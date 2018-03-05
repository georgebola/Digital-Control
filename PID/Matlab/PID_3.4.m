M=1;
m=1;
l=1;
B_l=0.3;
B_r=0;
g=10;
num=[(1/(M*l)) 0];
den=[1 ((B_l)/M) ((M+m)*(-g))/M*l ((B_l*(-g))/M*l)];

T=tf(num,den);
for Kp=0:100:1000
    disp(Kp);
    for Ki=0:100:1000
        for Kd=0:100:1000
            t=0:0.01:5;
            M2=pid(Kp,Ki,Kd);
            M=feedback(T,M2);
            [y,t]=impulse(M,[0:0.01:5]);
            y1=(((0.04-0.1)/5)*t)+0.1;
            if all(y<y1)&all(y>(-y1))
                t1=5:0.01:2000;
                y4=(((0.0001-0.04)/(2000-5))*t1)+0.04;
                [y3,t1]=impulse(M,[5:0.01:2000]);
                 if all(y3<y4')&all(y3>(-y4)')
                    disp('______');
                    disp (Kp);
                    disp (Ki);
                    disp (Kd);
                    disp('______');
                end
            end
        end
    end
end