
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



