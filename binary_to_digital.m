%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        CO250-MINI PROJECT

%Performance analysis of state-of-the-art Digital-to-Analog Conversion
%techniques using Binary Amplitude Shift Keying (BASK) and Multi Amplitude
%Shift Keying 

%MEMBERS:
%1. PALAK SINGHAL  16CO129
%2. GOVIND JEEVAN  16CO221
%3. PRASANTH SAGAR 16CO225

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%                       Binary to Digital Signal

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
