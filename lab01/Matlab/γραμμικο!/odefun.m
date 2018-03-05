function zdot = odefun(t,z,u)

F_l=u;
M=100;
m=1;
l=1;
B_l=0.3;
B_r=0.3;
g=10;


zdot(1)= z(2);
zdot(3)= z(4);

zdot(2)= (F_l-B_l*zdot(1)+(B_r*zdot(3))/l+m*g*z(3))/M;


zdot(4)= -(B_r*zdot(3))/(m*l.^2)-...
    (g*z(3))/l-...
    (F_l-B_l*zdot(1)+(B_r*zdot(3))/l+m*g*z(3))/(M*l);


zdot = zdot';


end

