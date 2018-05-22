img = imread('lena_rings.bmp')
sigma = 0.7

F = fft2(img)
nx = size(F, 2)
ny = size(F, 1)
cxrange = [0:nx/2, -nx/2 + 1: -1]
cyrange = [0:ny/2, -ny/2 + 1: -1]
[cx, cy] = meshgrid(cxrange, cyrange)
fxrange = cxrange * 2 * pi / nx
fyrange = cyrange * 2 * pi / ny
[fx, fy] = meshgrid(fxrange, fyrange)
ms = exp(-(fx .^ 2 + fy .^ 2)/(2 * sigma ^ 2))

figure
smooth = F .* ms
imshow(ifft2(smooth), [])