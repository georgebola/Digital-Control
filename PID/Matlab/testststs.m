M=1;
m=1;
l=1;
B_l=0.3;
B_r=0;
g=10;
num=[(1/(M*l)) 0];
den=[1 ((B_l)/M) ((M+m)*(-g))/M*l ((B_l*(-g))/M*l)];

T=tf(num,den);
M2=pid(1000,200,900);
M=feedback(T,M2);
rlocus(M)
damp(M)
impulse(M)