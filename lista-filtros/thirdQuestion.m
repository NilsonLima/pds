function thirdQuestion
wp = 0.4 * pi
ws = 0.6 * pi
Rp = 0.1
As = 40

delta = (ws - wp)
wc = (ws + wp) / 2

beta = (0.5842 * ((As - 21) ^ 0.4)) + (0.07886 * (As - 21))

MHamming = ceil((6.6 * pi)/delta)
MHanning = ceil((6.2 * pi)/delta)
MBlackman = ceil((11 * pi)/delta)
MKaiser = ceil((As - 8)/(2.285 * delta))

wHamming = (hamming(MHamming))'
wHanning = (hann(MHanning))'
wBlackman = (blackman(MBlackman))'
wKaiser = (kaiser(MKaiser, beta))'

hdHamming = idealLowPass(wc, MHamming)
hdHanning = idealLowPass(wc, MHanning)
hdBlackman = idealLowPass(wc, MBlackman)
hdKaiser = idealLowPass(wc, MKaiser)

hHamming = hdHamming .* wHamming
hHanning = hdHanning .* wHanning
hBlackman = hdBlackman .* wBlackman
hKaiser = hdKaiser .* wKaiser

figure

ax1 = subplot(2, 2, 1)
[db, mag, phase, w] = freqzModified(hHamming, [1])
plot(w/pi, db)
ax1.XTick = 0:.1:1
title(ax1, 'Hamming')
xlabel(ax1, 'Frequencia em pi unidades')
ylabel(ax1, 'dB')
grid on

ax2 = subplot(2, 2, 2)
[db, mag, phase, w] = freqzModified(hHanning, [1])
plot(w/pi, db)
ax2.XTick = 0:.1:1
title(ax2, 'Hanning')
xlabel(ax2, 'Frequencia em pi unidades')
ylabel(ax2, 'dB')
grid on

ax3 = subplot(2, 2, 3)
[db, mag, phase, w] = freqzModified(hBlackman, [1])
plot(w/pi, db)
ax3.XTick = 0:.1:1
title(ax3, 'Blackman')
xlabel(ax3, 'Frequencia em pi unidades')
ylabel(ax3, 'dB')
grid on

ax4 = subplot(2, 2, 4)
[db, mag, phase, w] = freqzModified(hKaiser, [1])
plot(w/pi, db)
ax4.XTick = 0:.1:1
title(ax4, 'Kaiser')
xlabel(ax4, 'Frequencia em pi unidades')
ylabel(ax4, 'dB')
grid on

MHamming
MHanning
MBlackman
MKaiser
beta