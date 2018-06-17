rgb = imread('dalton.bmp');
hsv = rgb2hsv(rgb);

hue = hsv(:, :, 1);
sat = hsv(:, :, 2);
val = hsv(:, :, 3);

[x, y, z] = size(rgb);

hue_length = 0.125;
hue_pos = 0:1:8;
hue_range = hue_pos * hue_length;

figure
histogram(hue, hue_range)
xticks(hue_range)
%figure
%imshow(rgb)

for i = 1:x
    for j = 1:y
        if (hue(i, j) >= 0.875) || (hue(i, j) <= 0.125)
            if (sat(i, j) > 0)
               %sat(i, j) = 0.6;
               val(i, j) = 1.0;
            end
        end
    end
end

new_hsv = hue;
new_hsv(:, :, 2) = sat;
new_hsv(:, :, 3) = val;

new_rgb = hsv2rgb(new_hsv);
figure;
imshow(new_rgb)