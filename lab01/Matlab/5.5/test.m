t_in=0 ;
t_fin=40 ;
z0=[pi/2 0];
u=0;
[t, z] = ode45(@(t,z)odefun(t,z,u), [t_in t_fin], z0) ;

figure(1)
subplot(1,2,1),plot(t,z(:,1)),title('pendulum angle')
subplot(1,2,2),plot(t,z(:,2)),title('pendulum angular velocity')