close all;clc;
Init;
%%
f=-ROI(index);
A=A(index,:);
NN=diag(TotalNum);
NN=NN(index,index);
N=sum(index);
%%
x1=linprog(NN'*f,A',b,[],[],zeros(N,1),[]);
figure;
hist(x1,10);
%%
cvx_begin
    variable x2(N)
    minimize(f'*NN*x2+0.1*norm(x2,1));
 subject to
    A'*x2 <= b
    x2>=0
cvx_end
figure;
hist(x2,10);