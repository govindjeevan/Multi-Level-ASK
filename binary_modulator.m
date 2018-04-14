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

%                          Binary-ASK modulation 

function m = binary_modulator(A1,A2,x)
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

%the loop runs for the length of the message where each iteration of the
%loop adds an array of elements which gives the analog signal for time
%period t2 based on the message signal by imposing it on the carroier
%signal of frequency f
for (i=1:1:length(x))
    if (x(i)==1)
        y=A1*cos(2*pi*f*t2);  
    else
        y=A2*cos(2*pi*f*t2);
    end
    m=[m y];
end

end 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

