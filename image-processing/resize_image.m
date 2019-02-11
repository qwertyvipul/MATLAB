clear
clc

FILE_NAME = 'images/rock-house.jpg';
rockHouse = imread(FILE_NAME);

% This image is too big for efficient computing so let's reduce its size to
% 20% of its actual size

resizedImage = imresize(rockHouse, 0.08);
imshow(resizedImage);

% Now for future processing lets write this image into our file system.
NEW_FILE = 'images/processed/rock-house/new-house.jpg';
imwrite(resizedImage, NEW_FILE);