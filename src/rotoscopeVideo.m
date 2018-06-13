% This function creates a rotoscoped, 10fps gif. The filepath to the source 
% video and the filepath for the output gif should be passed into the
% function

% --Inputs--
% video_fp: filepath to the source video
% out_fp: filepath for the gif created by the function
% sketch: a boolean that determines if the rotoscope gif will have a
% 'sketched' quality
% color_correct: a boolean that determines if the rotoscope gif will have
% any color adjustments made to it

function rotoscopeVideo(video_fp, out_fp, sketch, color_correct)
if(nargin<2)
    out_fp = '../gifs/out.gif';
    sketch = false;
    color_correct = false;
end
if(nargin<3)
    sketch = false;
    color_correct = false;
end
if(nargin<4)
    color_correct = false;
end
if sketch
    color_correct = false;
end

v = VideoReader(video_fp);

first = true;
frame_skip = floor(v.FrameRate/10); % take every frame_skip-th frame 
delay = 1/10; % for 10fps this should be 1/10
i = 1;
while hasFrame(v)
    if(mod(i, frame_skip)==0) 
        frame = readFrame(v);
        roto = im2uint8(rotoscopeFrame(frame, sketch, color_correct));
        if sketch
            A = roto;
            if first
                imwrite(A,out_fp,'gif','LoopCount',Inf, 'DelayTime', delay);
                first = false;
            else
                imwrite(A,out_fp,'gif','WriteMode','append', 'DelayTime', delay);
            end
        else
            [A, map] = rgb2ind(roto, 256);
            if first
                imwrite(A,map, out_fp,'gif','LoopCount',Inf, 'DelayTime', delay);
                first = false;
            else
                imwrite(A,map, out_fp,'gif','WriteMode','append', 'DelayTime', delay);
            end
        end    
    else
        frame = readFrame(v); % still need to advance the frames
    end
    i = i + 1;
end

end