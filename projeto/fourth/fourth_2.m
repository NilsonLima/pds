[y, Fs] = audioread('teste_de_som.wav');
fprintf('Taxa de amostragem: %d\n', Fs);

f = 466.16
dt = 1/Fs;
t = 0 : dt : (length(y)/Fs) - dt;
nsin = sin(2 * pi * f * t);
ynoise = (y' * 30) + nsin;

figure
plot(t, y)
title('Original')
xlabel('Seconds')
ylabel('Amplitude');

figure
plot(t, ynoise);
title('Noisy');
xlabel('Seconds');
ylabel('Amplitude');

%[b a] = butter(8, 0.06);
%[b a] = cheby1(5, 0.5, 0.06);
%yfilt = filter(b, a, ynoise);

%b = fir1(50, 0.06, gausswin(51));
%b = fir1(50, 0.06, hann(51));
%b = fir1(50, 0.06, hamming(51));
b = fir1(50, 0.06, bartlett(51));
yfilt = filter(b, 1, ynoise);

figure
plot(t, yfilt);
title('Filtered');
xlabel('Seconds');
ylabel('Amplitude');

sound(yfilt', Fs);
pause(length(yfilt)/Fs);