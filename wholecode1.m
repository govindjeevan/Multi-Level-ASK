
clc;
close all;
global Percentage 
Percentage = [];

global bp
global ss;
global f;
global t3;
x=[ 1 1 1 0 0 1 1 0 1 0 0 1 0 1 1 1 1 1];
global m;
bask(x);



% BINARY AMPLITUDE SHIFT KEYING
function output=bask(x)
    global bp;
    global ss;
    global f;
    global Percentage;
global m;
global t3;
    bp=.000001;                                                    % bit period
    disp(' Binary information at Trans mitter :');
    disp(x);

    %XX representation of transmitting binary information as digital signal XXX
    bit = binary_to_digital(x);

    t1=bp/100:bp/100:100*length(x)*(bp/100);
    subplot(5,1,1);
    plot(t1,bit,'lineWidth',2.5);grid on;
    axis([ 0 bp*length(x) -.5 1.5]);
    ylabel('amplitude(volt)');
    xlabel(' time(sec)');
    title('transmitting information as digital signal');
    A=[0 1 2 3 4 5 6 7];
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

levels=length(A)
signalbits=log2(levels)

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
        if mn(n)==1;
           se=ones(1,100);
        else mn(n)==0;
            se=zeros(1,100);
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


