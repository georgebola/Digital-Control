clc; clear all;
T_s=2;
z0=[ -1 5 ]';
t_in=0;
t_fin=10;
cnt=1;
M=1;m=1;l=0.3;g=10;
kp=50;
kd=20;
z=z0;
x_system=z0;
for t=t_in:T_s:t_fin-T_s
    cnt=cnt+1; %counter increment
    fx= (m*l*sin(z(1))+cos(z(1))*(z(2)).^2-(m+M)*g*sin(z(1)))/...
    ((m*l*cos(z(1))^2)-(2*(m+M)*l));
    gx=(cos(z(1)))/(m*l*(cos(z(1))).^2-2*(m+M)*l);
    u=(-fx-kp*z(1)-kd*z(2))/gx; %input specification
    [tode,z]= ode45(@(t,z)odefun(t,z,u), [t t+T_s],[z]);
    szx_ode=size(z);
    z=z(szx_ode(1),:)';
    x_system(:,cnt)=z;
end
t=[t_in:T_s:t_fin];
%plot(t,x_system(2,:))
subplot(2,1,1),plot(t,x_system(1,:)),title('THESI')
subplot(2,1,2),plot(t,x_system(2,:)),title('TAXYTHTA')