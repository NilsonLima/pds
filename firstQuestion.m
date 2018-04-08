function firstQuestion
delta = 0.08 * pi
wc1 = 0.3 * pi
wc2 = 0.4 * pi
wc3 = 0.5 * pi
wc4 = 0.6 * pi
wc5 = 1.0 * pi
M = ceil((6.6 * pi)/delta) + 10

wHamming = (hamming(M))'
hLowPass = idealLowPass(wc5, M) - idealLowPass(wc4, M) + idealLowPass(wc1, M) + idealLowPass(wc3, M) - idealLowPass(wc2, M)
h = hLowPass .* wHamming

[db] = freqzModified(h, [1])

figure

ax1 = subplot(2, 1, 1)
stem(h)
title(ax1, 'Impulso')
ylabel(ax1, 'h[n]')

ax2 = subplot(2, 1, 2)
plot(ax2, db)
title(ax2, 'Magnitude em dB')
ylabel(ax2, 'Decibeis')
grid on

M