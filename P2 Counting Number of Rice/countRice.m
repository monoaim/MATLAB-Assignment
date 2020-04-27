%{
58090046 Mr. Araya Siriadun


MATLAB Assignment
Project 2: Counting Number of Rice

The basic process of proposed method:
    Read the image file into the workspace, brighten the rice grain, then 
the rice grain is blended with the background, to find the true brightness 
of the background and make the rice grain and the background more different. 
Next, we will increase the contrast of the image and convert the Grayscale 
image into a binary image. reduce noise, find all the connected objects in 
the binary image. We will get the counted number of rice.
%}

function numRice = countRice()
originalImg = imread('rice.png'); % Reads the grayscale image from the file rice.png into the workspace.
structElem = strel('disk', 15); % Create a disk-shaped structuring element structElem with a radius of 15.
background = imopen(originalImg, structElem); % Estimate the background with the structuring element structElem from the image originalImg.
modifyImg = originalImg - background; % Create image modifyImg from subtract the background with the image originalImg.
modifyImg2 = imadjust(modifyImg); % Create image modifyImg2 from adjust the contrast of the image modifyImg.
modifyImg3 = im2bw(modifyImg2); % Converts the grayscale image modifyImg2 to a binary image modifyImg3.
maxPixel = 47; % Maximum number of pixels in rice (adjustable)
modifyImg4 = bwareaopen(modifyImg3, maxPixel); % Create image modifyImg4 from remove rice containing fewer than maxPixel.
modifyImg5 = bwboundaries(modifyImg4); % Calculate boundaries of regions in the image modifyImg4.
connectComp = bwconncomp(modifyImg4, 4); % Create connectComp structure with 4-connected neighborhood
numRice = connectComp.NumObjects;
figure('Name', ['Number of Rice: ', num2str(numRice)], ... % Create a figure and specify the Name property.
    'NumberTitle', 'off');
imshow(originalImg); % Display the originalImg image.
title(['Number of Rice \approx ', num2str(numRice)]); % display a title
hold on
for i = 1:length(modifyImg5)
    plot(modifyImg5{i}(:, 2), modifyImg5{i}(:, 1), 'y', 'LineWidth', 0.5)  % Wrap all the rice
end
end
