grayHouse = imread("gray-house.jpg");
[height, width, dim] = size(grayHouse);

L = 256;
n = height * width;

prob_table = zeros(256, 1);

for h = 1:height
    for w = 1:width
        val = grayHouse(h,w) + 1;
        prob_table(val, 1) = prob_table(val, 1) + 1;
    end
end

cfd_table = zeros(256, 1);
prev = 0;
for i = 1:256
    val = prob_table(i, 1);
    cfd_table(i, 1) = prev + val;
    prev = cfd_table(i, 1);
end

hist_table = zeros(256, 1);
cfd_min = cfd_table(1, 1);

for i = 1:256
    h = round((cfd_table(i, 1) - cfd_min) * (L - 1) / (height * width - cfd_min));
    hist_table(i, 1) = h;
end

newImage = zeros(height, width);
for h = 1:height
    for w = 1:width
        val = grayHouse(h,w) + 1;
        newImage(h,w) = hist_table(val, 1)/128;
    end
end

imshow(newImage);
disp("OK!")
% NEW_FILE = 'images/processed/rock-house/gray-house.jpg';
% imwrite(newImage, NEW_FILE);

%{
imshow(newImage);
NEW_FILE = 'images/processed/rock-house/gray-house.jpg';
imwrite(newImage, NEW_FILE);
%}
