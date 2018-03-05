A = [0 1 ;-10 -0.3];
B = [0 0]' ;
C = [1 0] ;
D = [0] ;
sys = ss(A,B,C,D) 
[num, den]=ss2tf(A,B,C,D) ;
sys = tf(num ,den) 
%step(sys);
damp(sys);
%bode(sys)
rlocus(sys)