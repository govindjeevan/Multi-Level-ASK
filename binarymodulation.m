clc;
clear all;
close all;


x=[ 1 0 0 1 1 0 1];                                    % Binary Information
bp=.000001;                                                    % bit period
disp(' Binary information at Trans mitter :');
disp(x);

%XX representation of transmitting binary information as digital signal XXX
bit=[]; 
for n=1:1:length(x)
    if x(n)==1;
       se=ones(1,100);
    else x(n)==0;
        se=zeros(1,100);
    end
     bit=[bit se];

end
t1=bp/100:bp/100:100*length(x)*(bp/100);
subplot(3,1,1);
plot(t1,bit,'lineWidth',2.5);grid on;
axis([ 0 bp*length(x) -.5 1.5]);
ylabel('amplitude(volt)');
xlabel(' time(sec)');
title('transmitting information as digital signal');



%XXXXXXXXXXXXXXXXXXXXXXX Binary-ASK modulation XXXXXXXXXXXXXXXXXXXXXXXXXXX%
A1=10;                      % Amplitude of carrier signal for information 1
A2=5;                       % Amplitude of carrier signal for information 0
br=1/bp;                                                         % bit rate
f=br*10;                                                 % carrier frequency 
t2=bp/99:bp/99:bp;                 
ss=length(t2);
m=[];
for (i=1:1:length(x))
    if (x(i)==1)
        y=A1*cos(2*pi*f*t2);
    else
        y=A2*cos(2*pi*f*t2);
    end
    m=[m y];
end
t3=bp/99:bp/99:bp*length(x);
subplot(3,1,2);
plot(t3,m);
xlabel('time(sec)');
ylabel('amplitude(volt)');
title('waveform for binary ASK modulation coresponding binary information');
