close all;
u=1000;
x=0:0.1:2000;
ss=(-1/7*(x./u-1).^7+3/5*(x./u-1).^5-(x./u-1).^3+(x./u-1)+16/35)*35/32;
plot(x,ss)
hold on;
plot(1000,0.5,'*r','markersize',10)
xlabel('investment per person');
ylabel('performance');