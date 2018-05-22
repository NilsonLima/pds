[y fs] = audioread('sp04.wav');
x = y';
D = 500;
a1 = -0.25;
a2 = 0.5;
ptime = length(y)/fs;

xD = zeros(size(x))
xD(D + 1: end) = x(1 : end - D);
x2 = x + (0.5 * xD);

num = [1];
den = zeros([1 D])
den(1) = 1;
den(D) = a2;

revx = filter(num, den, x2);

soundsc(x);
pause(ptime);

soundsc(x2);
pause(ptime);

soundsc(revx);