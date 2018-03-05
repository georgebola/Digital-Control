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
A_xdx=A_lin([1:2],[1:2]);,B_xdx=B_lin([1:2],:);
% u=K_1 x + K_2 \dot{x}
K_f_xdx=place(A_xdx,B_xdx,[-3;-4]);
A_xdx_cl=A_xdx-B_xdx*K_f_xdx;
t=[0:0.01:10];u=ones(size(t));
C_xdx=eye(2);D_xdx=[0;0];
xdx_cl=lsim(A_xdx_cl,B_xdx,C_xdx,D_xdx,u,t);
%plot(t,xdx_cl);
G = ss(A_xdx_cl,B_xdx,C_xdx,D_xdx);
step(G,t);

K_f=[0 0 K_f_xdx];
A_f=A_lin-B_lin*K_f;
xdx_cl_2=lsim(A_f,B_lin,C_lin,D_lin,u,t);
%plot(t,xdx_cl_2);

G = ss(A_f,B_lin,C_lin,D_lin);
[n,d]=ss2tf(A_f,B_lin,C_lin,D_lin);
%step(G,t);
n4=n(4,:);
Dthdot = tf(n4,d);
poles=pole(Dthdot);
zeroes = zero(Dthdot);
k = dcgain(Dthdot);
