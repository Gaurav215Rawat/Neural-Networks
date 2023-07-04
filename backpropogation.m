x1=0;
x2=1;
e=2.718;
learrate=0.25;
t=1;
w11=0.6;
w12=-0.3;
w21=-0.1
w22=0.4
b1=0.3
b2=0.5
b3=-0.2
v1=0.4
v2=0.1
printf("x1\tx2\tt\tw11\tw12\tw21\tw22\tb1\tb2\tb3\tz1\tz2\ty\n");
for i=1:5

 zin1=b1 + x1*w11+x2*w21;
 zin2=b2 + x1*w12+x2*w22;

 z1=1/(1+e^(-zin1));
 z2=1/(1+e^(-zin2));

 yin1=b3+ z1*v1 + z2*v2;

  y=1/(1+e^(-yin1));

#  2nd step back propogation of errno
# s=y'

  s=e^(-yin1)/(1+e^(-yin1)^2);
  e3=(t-y)*s;

  delta_b3=learrate*e3;
  delta_v1=learrate*e3*z1;
  delta_v2=learrate*e3*z2;

# r=z1'

   r=e^(-zin1)/(1+e^(-zin1))^2;
   delta_zin1=e3*v1;
   e1=delta_zin1*r;

   delta_b1=learrate*e1;
  delta_w11=learrate*e1*x1;
  delta_w21=learrate*e1*x2;

# t=z2'
     t=e^(-zin2)/(1+e^(-zin2))^2;
    delta_zin2=e3*v2;
   e2=delta_zin2*t;
   delta_b2=learrate*e2;
  delta_w12=learrate*e2*z1;
  delta_w22=learrate*e2*z2;


 # 3rd step updation

  w11=w11+delta_w11;
   w12=w12+delta_w12;
    w21=w21+delta_w21;
     w22=w22+delta_w22;

     b1=b1+delta_b1;
      b2=b2+delta_b2;
       b3=b3+delta_b3;

   v1=v1+delta_v1;
   v2=v2+delta_v2;

   printf("%.2f\t%.2f\t%d\t%.2f\t%.2f\t%.2f\t%.2f\t%.2f\t%.2f\t%.2f\t%.2f\t%.2f\t%.2f\n",x1,x2,1,w11,w12,w21,w22,b1,b2,b3,z1,z2,y);
 end


