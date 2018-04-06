function secondQuestionA(wc)
delta = 2 * wc
M = ceil((1.8 * pi)/delta) + 1
hd = idealLowPass(wc, M)
wRectangular = rectwin(M)
h = hd .* wRectangular
[db, mag, phase, w] = freqzModified(h)
plot(db)
