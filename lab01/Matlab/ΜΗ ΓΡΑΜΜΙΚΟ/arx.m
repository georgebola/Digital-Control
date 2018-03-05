t_in=0 ;
t_fin=40 ;
z0=[0 0 pi/36 0];
u=0
[t, z] = ode45(@(t,z)odefun1(t,z,u), [t_in t_fin], z0) ;

plot(t, z(:,3));

%figure(1)
%subplot(2,2,1),plot(t,z(:,1)),title('carrier position Ã« √—¡ÃÃ… œ')
%subplot(2,2,2),plot(t,z(:,2)),title('carrier velocity')
%subplot(2,2,3),plot(t,z(:,3)),title('pendulum angle')
%subplot(2,2,4),plot(t,z(:,4)),title('pendulum angular velocity')