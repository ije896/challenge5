function roto = rotoscopeFrame(frame, sketch, color_correct)
if(nargin<2)
    sketch = false;
    color_correct = false;
end
if(nargin<3)
    color_correct = false;
end
% convert to grayscale
g_frame = rgb2gray(frame);

if color_correct
    I = imread('eSFRTestImage.jpg');

    I = rgb2lin(I);
    chart = esfrChart(I);
    [colorTable,ccm] = measureColor(chart);

    A_R = frame(:,:,1);
    A_G = frame(:,:,2);
    A_B = frame(:,:,3);

    B = double([A_R(:) A_G(:) A_B(:) ones(length(A_R(:)),1)])*ccm;
    C = zeros(size(frame),'like',frame);
    C(:,:,1) = reshape(B(:,1),size(frame,1),size(frame,2));
    C(:,:,2) = reshape(B(:,2),size(frame,1),size(frame,2));
    C(:,:,3) = reshape(B(:,3),size(frame,1),size(frame,2));

    frame = C;
end
%blur image
imblur = imgaussfilt(frame, 1); % 0.2 for pretty clear image
dimblur = im2double(imblur);

% extract edges
imedge = edge(g_frame, 'Canny'); %, [0.03  0.061]);
dimedge = double(imedge);

% overlay edges on blurred image
if sketch
    roto = not(dimedge);
else
    roto = dimblur - dimedge;
end
end 