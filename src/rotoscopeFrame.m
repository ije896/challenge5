function roto = rotoscopeFrame(frame)
% convert to grayscale
g_frame = rgb2gray(frame);

% blur image
imblur = imgaussfilt(frame, 1.5);
dimblur = im2double(imblur);

% extract edges
imedge = edge(g_frame, 'Canny');
dimedge = double(imedge);

% overlay edges on blurred image
roto = dimblur - dimedge;
end 