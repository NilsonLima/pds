img1 = im2single(rgb2gray(imread('frames/saida_117.bmp')));
img2 = im2single(rgb2gray(imread('frames/saida_119.bmp')));
img_miss = im2single(rgb2gray(imread('frames_perdidos/saida_118_2.bmp')));

%{
block_size = 17;

hbm = vision.BlockMatcher('ReferenceFrameSource', 'Input port', 'BlockSize',[block_size block_size]);
hbm.OutputValue = 'Horizontal and vertical components in complex form';
halphablend = vision.AlphaBlender;
motion = hbm(img1, img2);

img12 = halphablend(img2, img1);

[X, Y] = meshgrid(1: block_size: size(img1, 2), 1: block_size: size(img1, 1));
imshow(img12);
hold on;
quiver(X(:), Y(:), real(motion(:)), imag(motion(:)), 0);
hold off;
%}

img_med = (img1 + img2)/2;
img_med = im2single(img_med);

mse1 = immse(img1, img_miss);
mse2 = immse(img2, img_miss);
mse_diff = immse(img_diff, img_miss);

fprintf('Erro médio quadrático entre as saida_117.bmp e saida_118_2.bmp: %f\n', mse1);
fprintf('Erro médio quadrático entre as saida_119.bmp e saida_118_2.bmp: %f\n', mse2);
fprintf('Erro médio quadrático entre as média e saida_118_2.bmp: %f\n', mse_med);

figure
imshowpair(img_miss, img_med, 'Montage');