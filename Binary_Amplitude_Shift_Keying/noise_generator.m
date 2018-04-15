%                        CO250-MINI PROJECT

%Performance analysis of state-of-the-art Digital-to-Analog Conversion
%techniques using Binary Amplitude Shift Keying (BASK) and Multi Amplitude
%Shift Keying 

%MEMBERS:
%1. PALAK SINGHAL  16CO129
%2. GOVIND JEEVAN  16CO221
%3. PRASANTH SAGAR 16CO225

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%XXXXXXXXXXXXXXXXXXXXXXX NOISE INTRODUCTION XXXXXXXXXXXXXXXXXXXXXXXXXXX%

function [m,r] = noise_generator(A, x)
    % A Amplitude of Noise
    %r=A*randn(1,length(x));
    r=A*randn(1,length(x));
    m=x+r;
   
    %To introduce noise in our modulated carrier signal we add the random value
    %to the signal and assign it to m(the modulated signal)

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
