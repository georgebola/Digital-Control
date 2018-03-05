function zdot = odefun(t,z,u)
M=1;m=1;l=0.3;g=10;
zdot(1)=z(2);
fx= (m*l*sin(z(1))+cos(z(1))*(z(2)).^2-(m+M)*g*sin(z(1)))/...
    ((m*l*cos(z(1))^2)-(2*(m+M)*l));

gx=(cos(z(1)))/(m*l*(cos(z(1))).^2-2*(m+M)*l);

zdot(2)=fx+gx*u;
zdot = zdot';

end