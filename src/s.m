% load image, convert to grayscale, blur image
im_fp = '../photos/death.jpg';

im = imread(im_fp);
dim = im2double(im);
img = rgb2gray(im);
dimg = im2double(img);

imblur = imgaussfilt(im, 2);
dimblur = im2double(imblur);

imedge = edge(img, 'Canny');
dimedge = double(imedge);


sum = dimblur + dimedge;
figure
imshowpair(im, sum, 'montage')

% edge extraction
% normalize and typecast the image


% extract gradients
% [ix, iy] = imgradientxy(dimg);
% 
% edgeFIS = newfis('edgeDetection');
% 
% edgeFIS = addvar(edgeFIS,'input','Ix',[-1 1]);
% edgeFIS = addvar(edgeFIS,'input','Iy',[-1 1]);
% 
% 
% sx = 0.1;
% sy = 0.1;
% edgeFIS = addmf(edgeFIS,'input',1,'zero','gaussmf',[sx 0]);
% edgeFIS = addmf(edgeFIS,'input',2,'zero','gaussmf',[sy 0]);
