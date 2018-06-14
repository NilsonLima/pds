[y, Fs] = audioread('dg105.wav');

gap1 = 17500;
idx1 = 17500;

gap2 = 53600;
idx2 = 53600;

for i = gap1 : length(y)
   if (y(i) >= 0.03)
       break;
   end
   idx1 = idx1 + 1;
end

for i = gap2 : length(y)
   if (y(i) >= 0.03)
       break;
   end
   idx2 = idx2 + 1;
end

dt = 1/Fs;
t = 0 : dt :(length(y) * dt) - dt;

figure
plot(t, y);
title('Degraded Signal');
xlabel('Seconds');
ylabel('Amplitude');

delta1 = idx1 - gap1;
delta2 = idx2 - gap2;

y_deg = y;

y_deg(gap1:idx1) = [];
y_deg(gap2 - delta1 : idx2 - delta1) = [];

pad = zeros([1, (delta1 + delta2 + 2)]);
y_deg = horzcat(y_deg', pad)';

figure
plot(t, y_deg);
title('Restored Signal');
xlabel('Seconds');
ylabel('Amplitude');

sound(y, Fs);
pause(length(y)/Fs);
sound(y_deg, Fs);

%{
window = hamming(512);
noverlap = 256;
nfft = 1024;

figure;
[S, F, T, P] = spectrogram(y, window, noverlap, nfft, Fs, 'yaxis');
surf(T, F, 10 * log10(P), 'edgecolor', 'none');
axis tight;
title('dg105.wav')
view(0, 90);
colormap(jet);
set(gca, 'clim', [-80 -30]);
%}

