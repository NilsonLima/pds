function secondQuestionE(delta)
wc = (pi / 6)
M = ceil((11 * pi)/delta) + 10
hd = idealLowPass(wc, M)
wBlackman = (blackman(M))'
h = hd .* wBlackman

[db] = freqzModified(h, [1])

figure

ax1 = subplot(2, 2, 1)
stem(hd)
title(ax1, 'Impulso Ideal')
ylabel(ax1, 'hd[n]')

ax2 = subplot(2, 2, 2)
stem(wBlackman)
title(ax2, 'Blackman')
ylabel(ax2, 'w[n]')

ax3 = subplot(2, 2, 3)
stem(h)
title(ax3, 'Impulso Atual')
ylabel(ax3, 'h[n]')

ax4 = subplot(2, 2, 4)
plot(ax4, db)
title(ax4, 'Magnitude em dB')
ylabel(ax4, 'Decibeis')
grid on

M
