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

%XXXXXXXXXXXXXXXXXXXX Binary ASK demodulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
function mn=binary_demodulator(m)
    global ss;
    global f;
    global bp;
    mn=[];
    %looping from start of time till the end of the signal and incrementing in units of the time period for 1 bit of information
    for n=ss:ss:length(m);
      %dot multiplication of the carrier signal with the 100 successive elemnts of the matrix m which represents the modulated signal
      %mathematically it will give (A1orA2)cos^2(2*pi*f*t) 
      t=bp/99:bp/99:bp;
      y=cos(2*pi*f*t);
      % carrier siignal
      mm=y.*m((n-(ss-1)):n);
      t4=bp/99:bp/99:bp;
      %trapezoidal integration of the above term with respect to the time period t4
      z=trapz(t4,mm);
      %on integration we can ignore the term with sin component as sine can range only from -1 to 1 and further it gets divided by 4*pi*f which gives an extremely small value
      zz=round((2*z/bp));
      %logic level (A1+A2)/2=7.5
      %If the amplitude of the modulated wave is greater than 7.5 it means the priginal message bit was a 1 otherwise it was a 0           
      if(zz>7.5)                                
        a=1;
      else
        a=0;
      end
      mn=[mn a];
end

end
