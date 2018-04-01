clc;
clear all;
close all;
x=[1 0 1 0 1 0 0];
N=length(x);
t=0.01:0.01:N;
c=2*sin(2*pi*t);
for i=1:1:N
m((i-1)*100+1:i*100)=x(i);
end
y=c.*m;
subplot(3,1,1);
plot(t,m);
xlabel('time');
ylabel('amplitude');
title('digital input signal');
subplot(3,1,2);
plot(t,c);
xlabel('time');
ylabel('amplitude');
title('sinusoidal signal');
subplot(3,1,3);
plot(t,y);
xlabel('time');
ylabel('amplitude');
title('PSK modulated signal');
r=randn(1,length(y));
k=y+r;
figure;
plot(t,k);
xlabel('time');
ylabel('amplitude');
title('noise added PSK signal');
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