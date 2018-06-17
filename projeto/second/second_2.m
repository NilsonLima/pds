img = imread('alumgrns.bmp');
threshold = [0.052, 0.062];
bw = edge(img, 'Canny', threshold, 0.3);
se = strel('cube', 3);
pad = padarray(bw, [1, 1], 1);
dilated = imdilate(pad, se);
[lb, n] = bwlabel(dilated);
rgb = label2rgb(lb, 'hsv', 'k', 'shuffle');
imshowpair(img, rgb, 'Montage');

fprintf('Número de texturas diferentes: %d\n', n);