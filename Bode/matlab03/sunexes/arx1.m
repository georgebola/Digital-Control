clc; clear all;
T_s=0.01;
z0=[ -1 5 ]';
t_in=0;
t_fin=10;
[t,z]= ode45(@odefun, [t_in:T_s:t_fin], z0);
t=[t_in:T_s:t_fin];
plot(t,z)