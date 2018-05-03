function [db, mag, phase, w] = freqzModified(b, a)
eps = 0.00001
[H, w] = freqz(b, a, 'whole', 1000)
H = (H(1 : 501))'
w = (w(1 : 501))'
mag = abs(H)
phase = angle(H)
db = 20 * log10((mag + eps)/(max(mag)));