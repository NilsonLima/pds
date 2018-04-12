function secondQuestionC(delta)
wc = pi / 6
M = ceil((6.6 * pi)/delta)
hd = idealLowPass(wc, M)
wHamming = (hamming(M))'
h = hd .* wHamming

[db, mag, phase, w] = freqzModified(h, [1])

figure

ax1 = subplot(2, 2, 1)
stem(hd)
title(ax1, 'Impulso Ideal')
xlabel(ax1, 'n')
ylabel(ax1, 'hd[n]')

ax2 = subplot(2, 2, 2)
stem(wHamming)
title(ax2, 'Hamming')
xlabel(ax2, 'n')
ylabel(ax2, 'w[n]')

ax3 = subplot(2, 2, 3)
stem(h)
title(ax3, 'Impulso Atual')
xlabel(ax3, 'n')
ylabel(ax3, 'h[n]')

ax4 = subplot(2, 2, 4)
plot(w/pi, db)
ax4.XTick = 0:.1:1
title(ax4, 'Magnitude em dB')
xlabel(ax4, 'Frequencia em pi unidades')
ylabel(ax4, 'Decibeis')
grid on

M