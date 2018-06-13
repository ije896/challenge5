function rotoscopeVideo(video_fp, out_fp, sketch)
if(nargin<2)
    out_fp = '../gifs/out.gif';
    sketch = false;
end
if(nargin<3)
    sketch = false;
end

v = VideoReader(video_fp);

first = true;
frame_skip = floor(v.FrameRate/10); % take every frame_skip-th frame 
delay = 1/10; % for 10fps this should be 1/10
i = 1;
while hasFrame(v)
    if(mod(i, frame_skip)==0) 
%         disp(['hit, i: ', num2str(i)])
        frame = readFrame(v);
        roto = im2uint8(rotoscopeFrame(frame, sketch));
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
%         disp('pass')
    end
    i = i + 1;
end

end