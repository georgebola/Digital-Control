function [x_float]=num2float(x,m,e)

sm=0;for i=1:m-1;sm=sm+1/2^i;end
for j=-2^(e-1)-1:2^(e-1)-1;...
    if x==0,e_number=0,
    elseif x>sm*2^(e-1)-1,e_number=2^(e-1)-1;
end elseif and(0.5<=abs(x)/(2^j),abs(x)/(2^j)<1),e_number=j;end;...
if e_number>=0,e_number_b=strcat('0',dec2bin(e_number,e-1));end
if e_number<0, e_number_b=strcat('1',dec2bin(-e_number,e-1));end
m_number=round((abs(x)/(2^e_number))*2^(m-1));
if x>0,m_number_b=strcat('0',dec2bin(m_number,m-1));end
if x<0,m_number_b=strcat('1',dec2bin(m_number,m-1));end
if x==0,m_number_b=strcat('0',dec2bin(0,m-1));end
mantissa_exponent=strcat(m_number_b,e_number_b);
x_float=sign(x)*(m_number*2^(-m+1))*(2^e_number);