function plotDFT(x)
y = fft(x);
m = abs(y);
p = unwrap(angle(y));
f = (0 : length(y) - 1) * 100 / length(y);

figure

subplot(2, 1, 1);
plot(f, m);
title('Magnitude');

subplot(2, 1, 2);
plot(f, p * 180 / pi);
title('Phase');