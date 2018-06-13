% % load image
% im_fp = '../photos/death.jpg';
% im = imread(im_fp);
% roto = rotoscopeFrame(im, false);
% figure
% imshowpair(im, roto, 'montage')


% load video
filename = 'small';
type = '.mp4';
vid_fp = strcat('../videos/',filename,type);
out_fp = strcat('../gifs/',filename,'_cc.gif');

rotoscopeVideo(vid_fp, out_fp, false, true);

