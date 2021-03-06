function hd = idealLowPass(wc, M)
eps = 0.00001
alpha = (M - 1)/2
n = [0: (M - 1)]
m = n - alpha + eps
hd = sin(wc * m)./(pi * m)