function online_face_recognition(cap)

cc = cv.CascadeClassifier('haarcascade_frontalface_default.xml');
c_eye = cv.CascadeClassifier('haarcascade_eye.xml');

num_labels = 20;
online_cover_state.num_labels = num_labels;
online_cover_state.max_num_centroids = 50;

figure();
f = imshow(cv.resize(cap.read(),[640,480]));

online_cover_state.centroids = [];
online_cover_state.Y = [];
for i = 1:num_labels/2
    online_cover_state.centroids = [online_cover_state.centroids;preprocess_face(imread(sprintf('%s_%d.bmp',!!!!!'ADD_PROFILE_NAME_HERE'!!!!!,i)))];
    online_cover_state.Y = [online_cover_state.Y;1];
    online_cover_state.centroids = [online_cover_state.centroids;preprocess_face(imread(sprintf('%s_%d.bmp',!!!!!'ADD_PROFILE_NAME_HERE'!!!!!,i)))];
    online_cover_state.Y = [online_cover_state.Y;-1];
end

online_cover_state.nodes_to_centroids_map = [1:num_labels];
online_cover_state.centroids_to_nodes_map = [1:num_labels];
online_cover_state.taboo = true(size(online_cover_state.Y));
online_cover_state.R = 0;

t = num_labels;
while t < 1000
    for i_empty_buffer = 1:5; im = cap.grab(); end
    im = cv.resize(cap.read(), [640,480]);
    box = cc.detect(im);
    frame.width = size(im,2);
    frame.height = size(im,1);

    top_face.idx = 0;
    top_face.dst = Inf;
    gray_im = cv.cvtColor(im, 'BGR2GRAY');
    for i = 1:length(box)

        rect.x = box{i}(1);
        rect.y = box{i}(2);
        rect.width = box{i}(3);
        rect.height = box{i}(4);
        eyes_detected = c_eye.detect(im(rect.y:rect.y + rect.height, rect.x:rect.x + rect.width, :));

        if length(eyes_detected) > 0
            gray_face = gray_im( rect.y:rect.y + rect.height, rect.x:rect.x + rect.width);
            min_side = min(size(gray_face));
            face_corner = floor((size(gray_face) - min_side)/2);
            gray_face = gray_face(face_corner(1)+1:face_corner(1)+min_side, face_corner(2)+1:face_corner(2)+min_side);
            gray_face = preprocess_face(gray_face);

            online_cover_state = online_ssl_update_centroids(t, gray_face, online_cover_state, num_labels);
            online_cover_state.Y = [online_cover_state.Y;0];
            y = online_ssl_compute_solution(t, online_cover_state, online_cover_state.Y, 1e-12);
            if y ==1
                im = cv.rectangle(im,box{i},'Color',[255,0,0],'Thickness',2);
            elseif y == -1
                im = cv.rectangle(im,box{i},'Color',[0,0,255],'Thickness',2);
            else
                im = cv.rectangle(im,box{i},'Color',[0,0,0],'Thickness',2);
            end

            t = t+1;
        end
    end
    set(f,'CData', im);
    drawnow()
end
