function thirdQuestion
wp = 0.4 * pi
ws = 0.6 * pi
Rp = 0.1
As = 40

delta = (ws - wp)
wc = delta / 2

beta = (0.1102 * (As - 8.7))

MHamming = ceil((6.6 * pi)/delta)
MHanning = ceil((6.2 * pi)/delta)
MBlackman = ceil((11 * pi)/delta)
MKaiser = 68

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
[db] = freqzModified(hHamming, [1])
plot(ax1, db)
title(ax1, 'Hamming')
ylabel(ax1, 'db')
grid on

ax2 = subplot(2, 2, 2)
[db] = freqzModified(hHanning, [1])
plot(ax2, db)
title(ax2, 'Hanning')
ylabel(ax2, 'db')
grid on

ax3 = subplot(2, 2, 3)
[db] = freqzModified(hBlackman, [1])
plot(ax3, db)
title(ax3, 'Blackman')
ylabel(ax3, 'db')
grid on

ax4 = subplot(2, 2, 4)
[db] = freqzModified(hKaiser, [1])
plot(ax4, db)
title(ax4, 'Kaiser')
ylabel(ax4, 'db')
grid on

MHamming
MHanning
MBlackman
MKaiser
beta