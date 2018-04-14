
clc;
close all;
global Percentage 
Percentage = [];

global bp
global ss;
global f;
global t3;
global m;
global mn;
global t4;
global A;
A=[5 10 15 20];

maxlength=7;

for l=1:2^maxlength   % ALL VALUES FROM 1 BIT TO maxlength BITS
    x = de2bi(l, 'left-msb');      % MESSAGE SIGNAL GENERATED
    x=bitNumber(x);
    bask(x);           % PERFORMING BINARY AMPLITUDE SHIFT KEYING
end

%Plottting length of message vs percentage error detection based on no of bits transmitted correctly
len=1:length(Percentage);
figure
plot(len, Percentage) 
%calculating the average error detection
avg=mean(Percentage)


function y=bitNumber(x)
    global A;
    len=log2(length(A));
    while mod(length(x),len) ~= 0
        x=[0 x];
    end
    y=x;
end


% BINARY AMPLITUDE SHIFT KEYING
function output=bask(x)
    global bp;
    global ss;
    global f;
    global Percentage;
    global A;
    global mn;
    global t4;
    bp=.000001;                                                    % bit period
    %disp(' Binary information at Trans mitter :');


    %XX representation of transmitting binary information as digital signal XXX
    bit = binary_to_digital(x);

    t1=bp/100:bp/100:100*length(x)*(bp/100);
    subplot(5,1,1);
    plot(t1,bit,'lineWidth',2.5);grid on;
    axis([ 0 bp*length(x) -.5 1.5]);
    ylabel('amplitude(volt)');
    xlabel(' time(sec)');
    title('transmitting information as digital signal');

    m=binary_modulator(A,x);

    t3=bp/99:bp/99:bp*length(x)/log2(length(A));
    subplot(5,1,2);
    plot(t3,m);
    xlabel('time(sec)');
    ylabel('amplitude(volt)');
    title('waveform for binary ASK modulation coresponding binary information');
    
    
    [m,n] = noise_generator(10, m);

    subplot(5,1,3);
    plot(t3,n);
    xlabel('time');
    ylabel('Noise Amplitude');
    title('Noise Signal');
    
    subplot(5,1,4);
    plot(t3,m);
    xlabel('time');
    ylabel('amplitude');
    title('Received Signal');
    
    mn=binary_demodulator(A, m);
    
    
    %XXXXX Representation of binary information as digital signal which achived 
    %after ASK demodulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    bit = binary_to_digital(mn);

    t4=bp/100:bp/100:100*length(mn)*(bp/100);
    subplot(5,1,5);
    plot(t4,bit,'LineWidth',2.5);grid on;
    axis([ 0 bp*length(mn) -.5 1.5]);
    ylabel('amplitude(volt)');
    xlabel(' time(sec)');
    title('received information as digital signal after binary ASK demodulation');

    Percentage=[Percentage, sum(xor(mn,x))/length(x)*100];
end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%                          Binary-ASK modulation 

function m = binary_modulator(A,x)
% A1 Amplitude of carrier signal for information 1
% A2 Amplitude of carrier signal for information 0
% x Message signal

global bp;
global ss;
global f;
br=1/bp;                                                         % bit rate
f=br*10;                                                 % carrier frequency 
t2=bp/99:bp/99:bp;                                       % time period to transmit one bit of information
ss=length(t2);                                           %length of time period
m=[];                                                    %matrix to store the modulated signal

levels=length(A);
signalbits=log2(levels);

for (i=1:signalbits:length(x))
    
    bits=x(i:i+signalbits-1);
    bits=bi2de(bits,'left-msb');
    y=A(bits+1)*cos(2*pi*f*t2);  

    m=[m y];
    
end


end


function bit = binary_to_digital(mn)
%Conversion of binary message to a binary signal
%Definign an empty array called bit
    bit=[]; 
%For each unit of message we check whether it's a one or zero and on the
%basis of that we fill a matrix of dimensions 1*100 with that particular
%value and later adding it to the bit array
    for n=1:length(mn)
        if mn(n)==1
           se=ones(1,100);
        else
            if mn(n)==0
            se=zeros(1,100);
            end 
        end
         bit=[bit se];

    end

end







%XXXXXXXXXXXXXXXXXXXXXXX NOISE INTRODUCTION XXXXXXXXXXXXXXXXXXXXXXXXXXX%

function [m,r] = noise_generator(A, x)
    % A Amplitude of Noise
    r=A*randn(1,length(x));
    m=x+r;
    %To introduce noise in our modulated carrier signal we add the random value
    %to the signal and assign it to m(the modulated signal)

end


%XXXXXXXXXXXXXXXXXXXX Binary ASK demodulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
function mn=binary_demodulator(A, m)
    global ss;
    global f;
    global bp;
    mn=[];
    %looping from start of time till the end of the signal and incrementing in units of the time period for 1 bit of information
    for n=ss:ss:length(m)
      %dot multiplication of the carrier signal with the 100 successive elemnts of the matrix m which represents the modulated signal
      %mathematically it will give (A1orA2)cos^2(2*pi*f*t) 
      t=bp/99:bp/99:bp;
      y=cos(2*pi*f*t);
      % carrier signal
      mm=y.*m((n-(ss-1)):n);
      t4=bp/99:bp/99:bp;
      %trapezoidal integration of the above term with respect to the time period t4
      z=trapz(t4,mm);
      %on integration we can ignore the term with sin component as sine can range only from -1 to 1 and further it gets divided by 4*pi*f which gives an extremely small value
      zz=round((2*z/bp));
      %logic level (A1+A2)/2=7.5
      %If the amplitude of the modulated wave is greater than 7.5 it means the priginal message bit was a 1 otherwise it was a 0           

      [minDistance, indexOfMin] = min(abs(A-zz));
      mn=[mn indexOfMin-1];
    end
w=[];
for i=1:1:length(mn)
    i
    mn(i)
    x1=de2bi(mn(i), log2(length(A)), 'left-msb');
    w= [w x1];
end
mn=w;
end

