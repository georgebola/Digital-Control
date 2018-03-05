clc;
clear;

M=1;m=1;l=1;B_l=0.3;B_r=0.3;g=10;

A_lin=[0 1 0 0;
   0 -B_l/M m*g/M -B_r/(M*l);
   0 0 0 1;
   0 -B_l/(m*l) (m+M)*g/(M*l) -B_r/(m*l*l)-B_r/(M*l*l)];
B_lin=[0;1/M;0;1/M];
C_lin=eye(4);
D_lin=[0;0;0;0];

K_f_xdx=place(A_lin,B_lin,[-1;-2;-3;-4]);
A_lin_2=A_lin-B_lin*K_f_xdx;
t=[0:0.01:10];u=ones(size(t));
xdx_cl=lsim(A_lin_2,B_lin,C_lin,D_lin,u,t);
sys = ss(A_lin_2,B_lin,C_lin,D_lin);
step(sys)
[n,d]=ss2tf(A_lin_2,B_lin,C_lin,D_lin);
z0=[0 0 pi/36 0]';
xdx_cl=lsim(A_lin_2,B_lin,C_lin,D_lin,u,t,z0);
plot(t,xdx_cl);
Dx = tf(n(1,:),d);
damp(Dx);
mhdenika = zero(Dx)
gain = dcgain(Dx)

n1=n(1,:);
Dx = tf(n1,d)
poles=pole(Dx)
zeroes = zero(Dx)
k = dcgain(Dx)

n2=n(2,:);
Dxdot = tf(n2,d)
poles=pole(Dxdot)
zeroes = zero(Dxdot)
k = dcgain(Dxdot)

n3=n(3,:);
Dth = tf(n3,d)
poles=pole(Dth)
zeroes = zero(Dth)
k = dcgain(Dth)

n4=n(4,:);
Dthdot = tf(n4,d)
poles=pole(Dthdot)
zeroes = zero(Dthdot)
k = dcgain(Dthdot)

