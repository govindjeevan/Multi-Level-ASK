







%%%%%%%%%%%%%%%%%% 
% error in output
%%%%%%%%%%%%



 clear all;
 close all;
 Nb=5;
 Rb=1; %bps
 T=1/Rb;
 
 % Generate Nb bits randomly
 %b =rand(1,Nb)&amp;amp;amp;gt;0.5;
 b =[1 1 0 1 0 0 1 0 1 1];
 %Rb is the bit rate in bits/second
 bit_to_symbol=[];
 for i=1:2:size(b,2)
 a = [b(i) b(i+1)]
 x = binary_to_digital(a)
 switch(x) 
 case [0]
 bit_to_symbol=[bit_to_symbol 0];
 case [1]
 bit_to_symbol=[bit_to_symbol 1];
 case [2]
 bit_to_symbol=[bit_to_symbol 2];
 case [3]
 bit_to_symbol=[bit_to_symbol 3];
 end
 
 end
 NRZ_out=[];
 RZ_out=[];
 Manchester_out=[];
 Vp=1;
 for index=1:size(bit_to_symbol,2)
 NRZ_out=[NRZ_out ones(1,200)*bit_to_symbol(index)];
 end
 figure;
 stem(b, 'filled');
 xlabel('Sequence Number')
 ylabel ('Transmitted Bits [0/1]')
 ylim ([0 2])
 
 
 
 t=0.005:0.005:5;
 f=5;
 Modulated=NRZ_out.*(sqrt(2/T)*sin(2*pi*f*t));
 figure;
 plot(Modulated);
 xlabel ('Time')
 ylabel ('Modulated Carrier')
 ylim ([-6 6])
 
 y=[];
 received=[];
 demodulated=Modulated.*(sqrt(2/T)*sin(2*pi*f*t));
 for i=1:200:size(demodulated,2)
 y=[y trapz(t(i:i+199),demodulated(i:i+199))];
 end
  
 for (i=1:1:size(y,2))
 euclidean_dist=sqrt((y(i)-[0 1 2 3]).^2);
 [val index]=min(euclidean_dist)
 temp = [0 1 2 3];
 index = temp (index);
 switch(index)
 case 0
 received=[received 0 0];
 case 1
 received=[received 0 1];
 case 2
 received=[received 1 0];
 case 3
 received=[received 1 1];
 end
 
 end
  
 %received=y&amp;amp;amp;gt;0;
 figure;
 stem(received,'filled', 'm')
 xlabel('Sequence Number')
 ylabel ('Received Bits [0/1]')
 ylim ([0 2])

function x = binary_to_digital(mn)
%Conversion of binary message to a binary signal
%Definign an empty array called bit
    x=[]; 
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
         x=[x se];

    end

end




