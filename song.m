[y,fs]=audioread('matlab_useful.mp3'); %读取声音文件
sex = 1.4;
sound(y,fs);%播放语音
pause(3);
x1=y(:,1); %读入的y矩阵有两列,取第1列
sound(voice(x1,sex),fs);
N=length(voice(x1,sex)); %长度
n=0:N-1;
w=2*n*pi/N;
y1=fft(voice(x1,sex)); %对原始信号做FFT变换
subplot(2,1,1);
plot(n,voice(x1,sex)) %做原始语音信号的时域波形图
title('变声语音信号时域图');
xlabel('时间t');
ylabel('幅值');
subplot(2,1,2); %做原始语音信号的频谱图
plot(w/pi,abs(y1));
title('变声语音信号频谱')
xlabel('频率');
ylabel('幅度');
