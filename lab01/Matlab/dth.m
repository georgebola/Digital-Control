clc;
A = [0 1 0 0; 0 -0.003 10 0.003;0 0 0 1;0 0.003 -10.01 -0.303];
B = [0 1 0 -1]' ;
C = [0 0 1 0] ;
D = [0] ;
sys = ss(A,B,C,D) ;
[num, den]=ss2tf(A,B,C,D) ;
sys = tf(num ,den) 
sgrid(sys)
%step(sys);
%rlocus(sys)
%damp(sys);
%bode(sys);