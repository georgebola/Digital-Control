function zdot = odefun(t,z)
M=1;m=1;l=0.3;g=10;
zdot(1)=z(2);
fx= (m*l*sin(z(1))+cos(z(1))*(z(2)).^2-(m+M)*g*sin(z(1)))/...
    (m*l*cos(z(1))^2)-(2*(m+M)*l);

gx=(cos(z(1)))/(m*l*(cos(z(1))).^2-2*(m+M)*l);
kp=50;
kd=20;
u=(-fx-kp*z(1)-kd*z(2))/gx;
zdot(2)=fx+gx*u;
zdot = zdot';

end