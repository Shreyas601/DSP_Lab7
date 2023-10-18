a = 2;
Fc = 1/3;
N = 21;
Hf = fdesign.lowpass('N,Fc',N,Fc);
Hd1 = design(Hf,'window','window',@blackman,'systemobject',true);
Hd2 = design(Hf,'window','window',@rectwin,'systemobject',true);
hfvt = fvtool(Hd1,Hd2,'Color','White');
legend(hfvt,'Hamming window design', ...
       'rectangular window design');
figure;

%2 

[num, den] = tf(Hd1);
bode(num, den);