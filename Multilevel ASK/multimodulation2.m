%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        CO250-MINI PROJECT

%Performance analysis of state-of-the-art Digital-to-Analog Conversion
%techniques using Binary Amplitude Shift Keying (BASK) and Multi Amplitude
%Shift Keying 
%Here we are trying to multiple amplitude shift keying by entering a base and an array of values according to the base

%MEMBERS:
%1. PALAK SINGHAL  16CO129
%2. GOVIND JEEVAN  16CO221
%3. PRASANTH SAGAR 16CO225

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear all;
close all;
%

%multimodulation update

 % Multi level Information
%x=[ 2 1 0 1 2 0 1];   

disp('Enter the base for multi modulation is is denoted to a :');

a=input(prompt); 

% Let x be the array that i am going to use to represent the array dynamically, Initialize to large number we can make it minimized after
  x = zeros(1,1000000);
  % assign a counter that tracks the actual size of your array like number of elements enetred
  counter = 1;
  % an arbitrary while loop for ini
  rn = 0;
  while rn < a
   x(counter) = rn;
   rn = randi(10,1,1);
   counter = counter + 1;
  end
  x = x(1:counter-1); % removes the rest of non used array after the making of array

                             
% Bit period(time taken to transmit a bit)
bp=.000001;  
%displaying the binary message
disp(' Multilevel information at Trans mitter :');
disp(x);

%Conversion of binary message to a binary signal
%Definign an empty array called bit
bit=[]; 
%For each unit of message we check whether it's a one or zero and on the
%basis of that we fill a matrix of dimensions 1*100 with that particular
%value and later adding it to the bit array
for n=1:1:length(x)
    if x(n)==1;
       se=ones(1,100);
    elseif x(n)==0;
        se=zeros(1,100);
    else
        se(1:1,1:100)=2'
    end
     bit=[bit se];

end
%t1 is the time period which increments in units of bit period/100
%bit period/100 will be the time taken for each unit of value in the bit
%matrix for plotting binary signal
t1=bp/100:bp/100:100*length(x)*(bp/100);
subplot(3,1,1);
%plotting t1 on the x axis vs the bit matrix on the y axis 
plot(t1,bit,'lineWidth',2.5);grid on;
%the x axis will start from 0 and will got till the length multiplied by
%bit period which basically gives the total time for which the signal
%propogates
%the y axis ranges from -.5 to 1.5
axis([ 0 bp*length(x) -.5 1.5]);
ylabel('amplitude(volt)');
xlabel(' time(sec)');
title('transmitting information as digital signal');



%XXXXXXXXXXXXXXXXXXXXXXX Multilevel-ASK modulation XXXXXXXXXXXXXXXXXXXXXXXXXXX%

% Amplitude of carrier signal for information 1
A1=10;   
% Amplitude of carrier signal for information 0
A2=5; 
% Amplitude of carrier signal for information 2
A3=15;
%rate at which bit is transmitted is 1/bit period
br=1/bp;       
% Carrier frequency is taken to be 10 times the bit rate
f=br*10;                                                 
%t2 is the time taken for 1 bit to be transferred as analog signal and it
%is incremented by bit period/99
t2=bp/99:bp/99:bp;              
%ss gives the length of time priod t2
ss=length(t2);
%initializing empty matrix m to plot the analog transmitted signal later
m=[];
%the loop runs for the length of the message where each iteration of the
%loop adds an array of elements which gives the analog signal for time
%period t2 based on the message signal by imposing it on the carroier
%signal of frequency f
for (i=1:1:length(x))
    if (x(i)==1)
        y=A1*cos(2*pi*f*t2);
    elseif (x(i)==0)
        y=A2*cos(2*pi*f*t2);
    else
        y=A3*cos(2*pi*f*t2);
    end
    m=[m y];
end
%like t1, t2 is the total time period for which the signal exists
t3=bp/99:bp/99:bp*length(x);
subplot(3,1,2);
%plotting time t3 on the x axis and m(matrix containing the approximate
%digital signal as y axis)
plot(t3,m);
xlabel('time(sec)');
ylabel('amplitude(volt)');
title('waveform for binary ASK modulation coresponding binary information');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

