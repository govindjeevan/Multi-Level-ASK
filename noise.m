%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        CO250-MINI PROJECT

%Performance analysis of state-of-the-art Digital-to-Analog Conversion
%techniques using Binary Amplitude Shift Keying (BASK) and Multi Amplitude
%Shift Keying 

%MEMBERS:
%1. PALAK SINGHAL  16CO129
%2. GOVIND JEEVAN  16CO221
%3. PRASANTH SAGAR 16CO225

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear all;
close all;
% Binary message of length 7
x=[1 0 1 0 1 0 0];
% N gives the length of the message
N=length(x);
%t is the time which increments in units of .01 till the length of the
%message
t=0.01:0.01:N;
%c is the carrier signal with frequency 1
c=2*sin(2*pi*t);
%m is a matrix in which for every 100 elements we assign the value of 1 bit
%of message and continue till the end of the message
for i=1:1:N
m((i-1)*100+1:i*100)=x(i);
end
%to calculate the modulated signal by imposing digital message on the
%carrier signal we multiply m elemnet wise with the carrier wave
y=c.*m;
subplot(3,1,1);
%plotting m(digital signal) at y axis and time at the x axis
plot(t,m);
xlabel('time');
ylabel('amplitude');
title('digital input signal');
subplot(3,1,2);
%plotting time at the x axis vs carrier wave at the y axis
plot(t,c);
xlabel('time');
ylabel('amplitude');
title('sinusoidal signal');
subplot(3,1,3);
%plotting modulated signal as the y axis vs time as the x axis
plot(t,y);
xlabel('time');
ylabel('amplitude');
title('ASK modulated signal');
% r is a number randomly chosen from 1 till the length of the modulated
% signal
r=randn(1,length(y));
%To introduce noise in our modulated carrier signal we add the random value
%to the signal and assign it to k
k=y+r;
figure;
%Plotting time vs noise introduced carrier signal
plot(t,k);
xlabel('time');
ylabel('amplitude');
title('noise added ASK signal');
%time unit incrementing in units of .01 till .99
t1=0:0.01:.99;
r1=sin(2*pi*t1);
r2=fliplr(r1);
l=length(k)+length(r2)-1;
d1=fft(k,l);
d2=fft(r2,l);
d=d1.*d2;
p=ifft(d,l);
figure;
plot(p);
xlabel('time');
ylabel('amplitude');
title('correlated signal');
for j=1:length(x)
q(j)=p(100*j);
if q(j)>15
m1(j)=1;
else
m1(j)=0;
end
end
for i=1:1:N
s((i-1)*100+1:i*100)=m1(i);
end
figure;
plot(s);
xlabel('time');
ylabel('amplitude');
title('demodulated signal');