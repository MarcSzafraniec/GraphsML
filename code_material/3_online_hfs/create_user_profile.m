function [] = create_user_profile(cap, user_name)
    f = figure('Position',[360,500,450,285]);

    EXTR_FRAME_SIZE = 96;

    snap_number = 1;

    cc = cv.CascadeClassifier('haarcascade_frontalface_default.xml');

    gray_im = zeros(EXTR_FRAME_SIZE,EXTR_FRAME_SIZE);
    exit_flag = 0;

    while(~exit_flag)
        fflush(stdout);
        com = input('What next? [c]apture, [s]ave to disk, [e]xit ---  ','s');
        if com == 'c'
            for iii = 1:10; im = cap.read(); end
            im = cap.read();
            frame.width = size(im,2);
            frame.height = size(im,1);
            gray_im = cv.cvtColor(im, 'BGR2GRAY');
            box = cc.detect(im);
            top_face.idx = 0;
            top_face.dst = Inf;
            for i = 1:length(box)
                rect.x = box{i}(1);
                rect.y = box{i}(2);
                rect.width = box{i}(3);
                rect.height = box{i}(4);
                im = cv.rectangle(im,box{i});
                face_dist = norm([rect.x + rect.width / 2 - frame.width / 2, rect.y + rect.height / 2 - frame.height / 2]);
                if (face_dist < top_face.dst)
                    top_face.idx = i;
                    top_face.dst = face_dist;
                    top_face.x = box{i}(1);
                    top_face.y = box{i}(2);
                    top_face.width = box{i}(3);
                    top_face.height = box{i}(4);
                end
            end
            gray_face = gray_im( top_face.y:top_face.y + top_face.height, top_face.x:top_face.x + top_face.width);
            [gray_face] = reshape(extract_face_features(gray_face),[EXTR_FRAME_SIZE, EXTR_FRAME_SIZE]);

            imshow(gray_face);
            hold on;
        elseif com == 's'
            imwrite(gray_face,sprintf('%s_%d.bmp',user_name,snap_number));
            snap_number = snap_number + 1;
        elseif com == 'e'
            exit_flag = 1;
        end
    end
endfunction
