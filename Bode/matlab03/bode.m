s=tf('s');
G=-1.11/(s^2-21.89);
rlocus(G);
%step(G);
%bode(G);
%[Gm,Pm] = margin(G) 
%margin(G)