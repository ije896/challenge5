function rotoscopeVideo(video_fp, out_fp, use_bw)
if(nargin<2)
    out_fp = '../gifs/out.gif';
    use_bw = false;
end
if(nargin<3)
    use_bw = false;
end

v = VideoReader(video_fp);

first = true;
frame_skip = 1;
delay = frame_skip/v.FrameRate;
i = 1;
while hasFrame(v)
    if(mod(i, 1)==0) % take half the frames
%         disp(['hit, i: ', num2str(i)])
        frame = readFrame(v);
        roto = im2uint8(rotoscopeFrame(frame, use_bw));
        if use_bw
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