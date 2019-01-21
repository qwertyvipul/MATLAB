clear
clc

FILE_NAME = 'images/rock-house.jpg';

[rockHouse, houseMap] = imread(FILE_NAME);
fileInfo = dir(FILE_NAME);
fileSize = fileInfo(1).bytes;
fileSizeMB = fileSize/1024;

grayHouse = rgb2gray(rockHouse);
[height, width, dim] = size(rockHouse);

cropHouse = imcrop(rockHouse, [0, 0, 7419, 4910]);
% imshow(grayHouse);
% imshow(cropHouse);
