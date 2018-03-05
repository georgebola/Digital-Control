clc;
clear;

M=1;m=1;l=1;B_l=0.3;B_r=0.3;g=10;

A_lin=zeros(4,4);B_lin=zeros(4,1);

A_lin(1,2)=1;
A_lin(2,2)=-B_r/(m*l^2)-B_r/(M*l^2);
A_lin(2,1)=(m+M)*g/M*l;
A_lin(2,3)=m*g/M;
A_lin(2,4)=-B_r/l/M;
A_lin(3,4)=1;
A_lin(4,2)=-B_l/M/l;
A_lin(4,3)=(m*g/M/l)+g/l;
A_lin(4,4)=(-B_r/m/l^2)+(-B_r/M/l^2);

B_lin(2)=1/M*l;
B_lin(4)=1/M/l;

C_lin=eye(4);
D_lin=zeros(4,1);
% state space form for x and \dot{x}
% u=K_1 x + K_2 \dot{x}
K_f_xdx=place(A_lin,B_lin,[-1;-2;-3;-4]);
A_lin_2=A_lin-B_lin*K_f_xdx;
t=[0:0.01:10];u=ones(size(t));
xdx_cl=lsim(A_lin_2,B_lin,C_lin,D_lin,u,t);
G = ss(A_lin_2,B_lin,C_lin,D_lin);

[n,d]=ss2tf(A_lin_2,B_lin,C_lin,D_lin);

n1=n(1,:);
Dx = tf(n1,d);

%step(Output,t);

s=tf('s');
N=50/(s+5);
Y=series(N,Dx);
poles=pole(Y)
zeroes=zero(Y);
%rlocus(-Y);
%bode(Y);
%margin(Y);
[Gm,Pm] = margin(-Y);
k=-0.68008294;
OUTPUT=k*Y;
H=feedback(OUTPUT,1);
%step(H);

%-0.634 0.278



