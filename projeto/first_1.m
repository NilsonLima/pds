n =  0 : 0.01 : 10;
y = sin(20 * pi * n) + cos(30 * pi * n);
z = sin(40 * pi * n) + cos(60 * pi * n);
w = [y z];

plotDFT(y);
plotDFT(z);
plotDFT(w);