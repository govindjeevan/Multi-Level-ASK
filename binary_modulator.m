%XXXXXXXXXXXXXXXXXXXXXXX Binary-ASK modulation XXXXXXXXXXXXXXXXXXXXXXXXXXX%

function m = binary_modulator(A1,A2,x)
% A1 Amplitude of carrier signal for information 1
% A2 Amplitude of carrier signal for information 0
% x Message signal
global bp;
global ss;
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
plot(t3,m);
xlabel('time(sec)');
ylabel('amplitude(volt)');
title('waveform for binary ASK modulation coresponding binary information');
end 


