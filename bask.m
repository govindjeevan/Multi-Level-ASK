%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        CO250-MINI PROJECT

%Performance analysis of state-of-the-art Digital-to-Analog Conversion
%techniques using Binary Amplitude Shift Keying (BASK) and Multi Amplitude
%Shift Keying 

%MEMBERS:
%1. PALAK SINGHAL  16CO129
%2. GOVIND JEEVAN  16CO221
%3. PRASANTH SAGAR 16CO225

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        MAIN FILE

clc;
clear all;
close all;
global Percentage 
Percentage = [];

global bp
global ss;
global f;
%maximum length of the message
maxlength=9;

for l=1:2^maxlength   % ALL VALUES FROM 1 BIT TO maxlength BITS
    x = de2bi(l)       % MESSAGE SIGNAL GENERATED
    bask(x);           % PERFORMING BINARY AMPLITUDE SHIFT KEYING
end

 
%Plottting length of message vs percentage error detection based on no of bits transmitted correctly
len=1:length(Percentage);
figure
plot(len, Percentage) 
%calculating the average error detection
mean(Percentage)


% BINARY AMPLITUDE SHIFT KEYING
function output=bask(x)
    global bp;
    global ss;
    global f;
    global Percentage;
    % bit period(time taken to transmit a single bit of information)
    bp=.000001;                                                    
    disp(' Binary information at Trans mitter :');
    disp(x);

    %XX representation of transmitting binary information as digital signal XXX
    bit = binary_to_digital(x);
    
    %t1 is the time period which increments in units of bit period/100
    %bit period/100 will be the time taken for each unit of value in the bit
    %matrix for plotting binary signal
    t1=bp/100:bp/100:100*length(x)*(bp/100);
    
    subplot(5,1,1);
    
    %plotting digital information vs time
    plot(t1,bit,'lineWidth',2.5);grid on;
    axis([ 0 bp*length(x) -.5 1.5]);
    ylabel('amplitude(volt)');
    xlabel(' time(sec)');
    title('transmitting information as digital signal');
    
    %passing message to binary modulator function and assigning it to a matrix m which contains the values to be plotted to represent a modulated signal
    m=binary_modulator(10,5,x);
    
    %like t1, t2 is the total time period for which the signal exists
    t3=bp/99:bp/99:bp*length(x);
    
    subplot(5,1,2);
    
    %plotting modulated signal vs time
    plot(t3,m);
    xlabel('time(sec)');
    ylabel('amplitude(volt)');
    title('waveform for binary ASK modulation coresponding binary information');
    
    %generating noise in the modulated signal
    [m,n] = noise_generator(10, m);

    subplot(5,1,3);
    
    %plotting the noisy signal vs time
    plot(t3,n);
    xlabel('time');
    ylabel('Noise Amplitude');
    title('Noise Signal');
    
    %plotting the received signal vs time
    subplot(5,1,4);
    plot(t3,m);
    xlabel('time');
    ylabel('amplitude');
    title('Received Signal');

    %demodulating the noisy signal
    mn=binary_demodulator(m);

    %XXXXX Representation of binary information as digital signal which achived 
    %after ASK demodulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    bit = binary_to_digital(mn);
    
    %t4 is the total time period for which the signal exists
    t4=bp/100:bp/100:100*length(mn)*(bp/100);
    subplot(5,1,5);
    
    %plotting the demodulated signasl vs time
    plot(t4,bit,'LineWidth',2.5);grid on;
    axis([ 0 bp*length(mn) -.5 1.5]);
    ylabel('amplitude(volt)');
    xlabel(' time(sec)');
    title('recived information as digital signal after binary ASK demodulation');
    
    %calculating the percentage error by xoring the demodulated signal with the original signal and counting the number of ones to find the number of errors
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

end 



%XXXXXXXXXXXXXXXXXXXXXXX NOISE INTRODUCTION XXXXXXXXXXXXXXXXXXXXXXXXXXX%
function [m,r] = noise_generator(A, x)
    % A Amplitude of Noise
    r=A*randn(1,length(x));
    m=x+r;
end


%XXXXXXXXXXXXXXXXXXXX Binary ASK demodulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
function mn=binary_demodulator(m)
    global ss;
    global f;
    global bp;
    mn=[];
    for n=ss:ss:length(m)

      t=bp/99:bp/99:bp;
      y=cos(2*pi*f*t);
      % carrier siignal
      mm=y.*m((n-(ss-1)):n);
      t4=bp/99:bp/99:bp;
      z=trapz(t4,mm);
      2*z/bp;       % intregation 
      zz=round((2*z/bp));
      if(zz>7.5)                                  % logic level = (A1+A2)/2=7.5
        a=1;
      else
        a=0;
      end
      mn=[mn a];
end

end
%%%%%%%%%%%%%%%%%%%%%%% Binary to Digital Signal%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function bit = binary_to_digital(mn)
    bit=[];
    for n=1:length(mn)
        if mn(n)==1
           se=ones(1,100);
        else mn(n)==0;
            se=zeros(1,100);
        end
         bit=[bit se];

    end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%