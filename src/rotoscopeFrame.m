function roto = rotoscopeFrame(frame, sketch)
if(nargin<2)
    sketch = false;
end
% convert to grayscale
g_frame = rgb2gray(frame);

% blur image
imblur = imgaussfilt(frame, 0.2);
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