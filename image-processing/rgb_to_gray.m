clear
clc

FILE_NAME = 'images/processed/rock-house/new-house.jpg';
rockHouse = imread(FILE_NAME);

% Here our goal is to convert the colour image into gray image, and there
% exists a direct function for it
% rgb2gray()
% But showing no signs of laziness we are gonna create our own function

[height, width, dim] = size(rockHouse);


pixelCount = 0;
valCount = 0;
for h = 1:height
    for w = 1:width
        pixelCount = pixelCount + 1;
        
        rval = rockHouse(h,w,1);
        gval = rockHouse(h,w,2);
        bval = rockHouse(h,w,3);
       
        valCount = valCount + double((rval + gval + bval)/3);
    end
end

threshold = valCount/pixelCount;

newImage = zeros(height, width);
for h = 1:height
    for w = 1:width
        rval = rockHouse(h,w,1);
        gval = rockHouse(h,w,2);
        bval = rockHouse(h,w,3);
        
        value = double((rval + gval + bval)/3);
        newImage(h,w) = value/128;
    end
end
imshow(newImage);
NEW_FILE = 'images/processed/rock-house/gray-house.jpg';
imwrite(newImage, NEW_FILE);