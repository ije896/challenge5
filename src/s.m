% load image
% im_fp = '../photos/death.jpg';
% im = imread(im_fp);
% roto = rotoscopeFrame(im);
% figure
% imshowpair(im, roto, 'montage')


% load video
vid_fp = '../videos/walking.mp4';
out_fp = '../gifs/walking.gif';

rotoscopeVideo(vid_fp, out_fp)

