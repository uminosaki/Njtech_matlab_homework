[x,fs]=audioread('nansheng.wav'); %打开语音信号
sound(x,fs); %播放语音信号
N=length(x); %长度
n=0:N-1;
w=2*n*pi/N;
y1=fft(x); %对原始信号做FFT变换
subplot(2,1,1);
plot(n,x) %做原始语音信号的时域波形图
title('原始语音信号时域图');
xlabel('时间t');
ylabel('幅值');
subplot(2,1,2); %做原始语音信号的频谱图
plot(w/pi,abs(y1));
title('原始语音信号频谱')
xlabel('频率Hz');
ylabel('幅度');