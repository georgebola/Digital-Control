A = [0 1 0 0; 0 -0.3 10 0.3;0 0 0 1;0 0.3 -20 -0.6];
B = [0 1 0 -1]' ;
C = [1 0 0 0] ;
D = [0] ;
sys = ss(A,B,C,D) ;
[num, den]=ss2tf(A,B,C,D) ;
sys = tf(num ,den) 
step(sys);
rlocus(sys);