clc;
clear all;
close all;
global Percentage 
Percentage = [];

global bp
global ss;
global f;
maxlength=5

for l=1:2^maxlength   % ALL VALUES FROM 1 BIT TO maxlength BITS
    x = de2bi(l)       % MESSAGE SIGNAL GENERATED
    bask(x);           % PERFORMING BINARY AMPLITUDE SHIFT KEYING
end

 

len=1:length(Percentage);
figure
plot(len, Percentage) 
mean(Percentage)



% BINARY AMPLITUDE SHIFT KEYING
function output=bask(x)
    global bp;
    global ss;
    global f;
    global Percentage;

    bp=.000001;                                                    % bit period
    disp(' Binary information at Trans mitter :');
    disp(x);

    %XX representation of transmitting binary information as digital signal XXX
    bit = binary_to_digital(x);


    t1=bp/100:bp/100:100*length(x)*(bp/100);
    subplot(4,1,1);
    plot(t1,bit,'lineWidth',2.5);grid on;
    axis([ 0 bp*length(x) -.5 1.5]);
    ylabel('amplitude(volt)');
    xlabel(' time(sec)');
    title('transmitting information as digital signal');

    m=binary_modulator(10,5,x)

    t3=bp/99:bp/99:bp*length(x);
    subplot(4,1,2);
    plot(t3,m);
    xlabel('time(sec)');
    ylabel('amplitude(volt)');
    title('waveform for binary ASK modulation coresponding binary information');

    m = noise_generator(10, m)

    subplot(4,1,3);
    plot(t3,m);
    xlabel('time');
    ylabel('amplitude');
    title('noise Added');


    mn=binary_demodulator(m)

    %XXXXX Representation of binary information as digital signal which achived 
    %after ASK demodulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    bit = binary_to_digital(mn)

    t4=bp/100:bp/100:100*length(mn)*(bp/100);
    subplot(4,1,4);
    plot(t4,bit,'LineWidth',2.5);grid on;
    axis([ 0 bp*length(mn) -.5 1.5]);
    ylabel('amplitude(volt)');
    xlabel(' time(sec)');
    title('recived information as digital signal after binary ASK demodulation');

    Percentage=[Percentage, sum(xor(mn,x))/length(x)*100];
end



%XXXXXXXXXXXXXXXXXXXXXXX Binary-ASK modulation XXXXXXXXXXXXXXXXXXXXXXXXXXX%

function m = binary_modulator(A1,A2,x)
    % A1 Amplitude of carrier signal for information 1
    % A2 Amplitude of carrier signal for information 0
    % x Message signal
    global bp;
    global ss;
    global f;
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



%XXXXXXXXXXXXXXXXXXXXXXX NOISE INTRODUCTION XXXXXXXXXXXXXXXXXXXXXXXXXXX%

function m = noise_generator(A, x)
    % A Amplitude of Noise
    r=A*randn(1,length(x));
    m=x+r;
end




function bit = binary_to_digital(mn)
    bit=[];
    for n=1:length(mn)
        if mn(n)==1;
           se=ones(1,100);
        else mn(n)==0;
            se=zeros(1,100);
        end
         bit=[bit se];

    end

end