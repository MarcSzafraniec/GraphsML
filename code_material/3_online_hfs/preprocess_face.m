function [gray_face] = preprocess_face(gray_face)
% [gray_face] = preprocess_face(gray_face)
%     Transforms a n x n image into into a feature vector
%
% Input
% gray_face:
%     ( n x n ) image in grayscale
%
% Output
% gray_face_vector:
%     ( 1 x EXTR_FRAME_SIZE^2) row vector with the preprocessed face

EXTR_FRAME_SIZE = 96;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Apply preprocessing to balance the image (color/lightning), such    %
% as filtering (cv.boxFilter, cv.GaussianBlur, cv.bilinearFilter) and %
% equalization (cv.equalizeHist).                                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

gray_face = ;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%resize the face
gray_face = cv.resize(gray_face, [EXTR_FRAME_SIZE, EXTR_FRAME_SIZE]);

%necessary conversion from 8bit images
gray_face = double(gray_face);

%scale the data to [0,1]
gray_face = gray_face./255;

%reshape it to a row vector
gray_face = gray_face(:)';

