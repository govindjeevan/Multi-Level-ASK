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
close all;
global Percentage 
global Percentage1
Percentage = [];
Percentage1 = [];

global bp
global ss;
global f;
%maximum length of the message
maxlength=4;

for l=1:2^maxlength   % ALL VALUES FROM 1 BIT TO maxlength BITS
    x = de2bi(l)       % MESSAGE SIGNAL GENERATED
    bask(x);           % PERFORMING BINARY AMPLITUDE SHIFT KEYING
end

 
%Plottting length of message vs percentage error detection based on no of bits transmitted correctly
len=1:length(Percentage);
figure
plot(len, Percentage) 

%calculating the average error detection for BASK
mean(Percentage)
mean(Percentage1)
