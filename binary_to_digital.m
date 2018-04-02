
function bit = binary_to_digital(mn)
    bit=[];
    for n=1:length(mn)
        if mn(n)==1;
           se=ones(1,100);
        else mn(n)==0;
            se=zeros(1,100);
        end
         bit=[bit se];

    end

end