img = imread('alumgrns.bmp');
[gx, gy] = imgradientxy(img);
figure
imshowpair(gx, gy, 'montage')
figure
[Gmag, Gdir] = imgradient(gx, gy)
imshowpair(Gmag, Gdir, 'montage')