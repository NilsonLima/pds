function [db, mag, phase, w] = freqzModified(b, a)
eps = 0.1
[H, w] = freqz(b, a, 1000, 'whole')
H = (H(1 : 501))'
w = (w(1 : 501))'
mag = abs(H)
phase = angle(H)
db = 20 * log10((mag + eps)/(max(mag)))