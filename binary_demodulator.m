%XXXXXXXXXXXXXXXXXXXX Binary ASK demodulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
function mn=binary_demodulator(m)
    global ss;
    global f;
    global bp;
    mn=[];
    for n=ss:ss:length(m);

      t=bp/99:bp/99:bp;
      y=cos(2*pi*f*t);
      % carrier siignal
      mm=y.*m((n-(ss-1)):n);
      t4=bp/99:bp/99:bp;
      z=trapz(t4,mm);
      2*z/bp;       % intregation 
      zz=round((2*z/bp));
      if(zz>7.5)                                  % logic level = (A1+A2)/2=7.5
        a=1;
      else
        a=0;
      end
      mn=[mn a];
end

end