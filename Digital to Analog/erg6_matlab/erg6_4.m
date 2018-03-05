clc;
clear;

M=1;m=1;l=1;B_l=0.3;B_r=0.3;g=10;

A_lin=zeros(4,4);B_lin=zeros(4,1);

A_lin(1,2)=1;
A_lin(2,2)=-B_l/M;
A_lin(2,3)=m*g/M;
A_lin(2,4)=-B_r/M/l;
A_lin(3,4)=1;
A_lin(4,2)=-B_l/M/l;
A_lin(4,3)=(m+M)*g/M/l;
A_lin(4,4)=-B_r/m/l^2-B_r/M/l^2

B_lin(2)=1/M;
B_lin(4)=1/M/l;

C_lin=eye(4);
D_lin=[0;0;0;0];
K_f_xdx=place(A_lin,B_lin,[-1;-2;-3;-4]);
A_lin_2=A_lin-B_lin*K_f_xdx;
t=[0:0.001:10];u=zeros(size(t));

z0=[0 0 pi/36 0]';
xdx_cl=lsim(A_lin_2,B_lin,C_lin,D_lin,u,t,z0);
%plot(t,xdx_cl);

Ts=0.1;
[A,B,C,D]= c2dm(A_lin_2,B_lin,C_lin,D_lin,Ts,'ZOH');
%d erwtima
Q=16;
Vmin=-128;
Vmax=128;

cnt=1;
z(:,1)=z0;
ADC(:,1)=adc(z(:,1),Q,Vmin,Vmax);
for t1=1:Ts:10
    u=-K_f_xdx*ADC(:,cnt);
    z(:,cnt+1)=A*z(:,cnt)+B*u;
    ADC(:,cnt+1)=adc(z(:,cnt+1),Q,Vmin,Vmax);
    cnt=cnt+1;
end
t1=1:Ts:10+Ts;
plot(t1,ADC);



