function fourthQuestion
wp = 0.2 * pi
ws = 0.3 * pi
Rp = -10 * log10(0.89125)
As = -10 * log10(0.17783)
N = ceil(log10(((10 ^ (Rp / 10)) - 1) * ((10 ^ (As / 10)) - 1)) / (2 * log10(wp / ws)))
wc_ = wp / (((10 ^ (Rp / 10)) - 1) ^ (1 / (2 * N)))
wc__ = ws / (((10 ^ (As / 10)) - 1) ^ (1 / (2 * N)))
wc = abs(wc_ - wc__)/2
coef = [-((1 / 0.6802) ^ 2) 0 1]
poles = roots(coef)