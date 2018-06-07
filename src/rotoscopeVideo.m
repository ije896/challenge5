function rotoscopeVideo(video_fp, out_fp)
if(nargin<2)
    out_fp = '../gifs/out.gif';
end

v = VideoReader(video_fp);

i = 1;
while hasFrame(v)
    frame = readFrame(v);
    roto = rotoscopeFrame(frame);
    [A, map] = rgb2ind(roto, 256);
    if i ==1
        imwrite(A,map,out_fp,'gif','LoopCount',Inf);
    else
        imwrite(A,map,out_fp,'gif','WriteMode','append');
    end
    i = i + 1;
end

end