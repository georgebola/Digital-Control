function zdot = odefun1(t,z,u)

F_l=u;
M=100;
m=1;
l=1;
B_l=0.3;
B_r=0.3;
g=10;


zdot(1)= z(2);

zdot(2)=(F_l-B_l*z(2)+m*l*sin(z(3))*(z(4))^2 + ...
m*g*cos(z(3))*sin(z(3))+B_r/l*cos(z(3))*z(4))/...
((M+m)-m*(cos(z(3)))^2);

zdot(3)= z(4);

zdot(4)=(-m*g*l*sin(z(3))-B_r*z(4)-m*l*cos(z(3))*zdot(2))/...
(m*l^2);

zdot = zdot';


end

