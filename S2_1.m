[y,Fs] = audioread('matlab_useful.mp3');
figure;
plot(y);%Ô­yÆµÆ×
title('Ô­yÆµÆ×');
disp(Fs);
figure;
plot(abs(fft(y)));
title('fftºó');