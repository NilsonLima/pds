function firstQuestion
delta = 0.1 * pi
wc1 = 0.3 * pi
wc2 = 0.4 * pi
wc3 = 0.5 * pi
wc4 = 0.6 * pi
wc5 = 1.0 * pi
M = ceil((6.6 * pi)/delta) + 1
wHamming = (hamming(M))'
hLowPass = idealLowPass(wc5, M) - idealLowPass(wc4, M) + idealLowPass(wc1, M) + idealLowPass(wc3, M) - idealLowPass(wc2, M)
h = hLowPass .* wHamming
[db, mag, phase, w] = freqzModified(h, [1])
stem(mag)