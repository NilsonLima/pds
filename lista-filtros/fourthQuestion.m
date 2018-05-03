function fourthQuestion
wp = 0.2 * pi
ws = 0.3 * pi
Rp = -10 * log10(0.89125)
As = -10 * log10(0.17783)
N = ceil(log10(((10 ^ (Rp / 10)) - 1) / ((10 ^ (As / 10)) - 1)) / (2 * log10(wp / ws)))
wc_ = wp / (((10 ^ (Rp / 10)) - 1) ^ (1 / (2 * N)))
wc__ = ws / (((10 ^ (As / 10)) - 1) ^ (1 / (2 * N)))
wc = abs(wc_ + wc__)/2

[z, p, k] = buttap(N)
p = p * wc
k = k * (wc ^ N)
B = real(poly(z))
b = k * B
a = real(poly(p))
[c, d] = bilinear(b, a, 1)
fvtool(c, d)