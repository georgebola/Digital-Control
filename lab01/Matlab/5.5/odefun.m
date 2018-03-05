function zdot = odefun(t,z,u)

F_l=u;
m=1;
l=1;
B_l=0.3;
B_r=0.3;
g=10;

zdot(1)= z(2);

zdot(2)= -(B_r*z(2))/(m*l.^2)-(g*z(1))/l;

zdot = zdot';


end

