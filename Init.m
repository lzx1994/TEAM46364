temp=dbquery(char('UGDS','UGDS_WHITE','UGDS_BLACK','UGDS_HISP','UGDS_ASIAN','UGDS_AIAN','UGDS_NHPI','UGDS_2MOR','UGDS_NRA','UGDS_UNKN'));
temp=cell2mat(temp);
%%
% N=3000;             %The num of unvi
% M=10;               %The num of monitory
[N,M]=size(temp);

x=zeros(N,1);       %
R=zeros(N,1);       %
N=zeros(N,1);
Min=zeros(N,M);%The proportion of minority in univ
m=zeros(M,1);   %The boundary of the investments for the minority
W_low=zeros(N,2);
W_large=zeros(N,2);
w_low=zeros(2,1);
w_large=zeros(2,1);
Sub_Art=zeros(N,1);
Sub_Sci=zeros(N,1);
Sub_Eng=zeros(N,1);
sub_art=0.3;
sub_sci=0.3;
sub_eng=0.4;
%%
%Minority
TotalNum=temp(:,1);   %Total undergraduate num of each school
Min=temp(:,2:end);   
TotalMin=round(sum(diag(TotalNum)*Min));
Min=temp(:,3:8);
lambda1=0.8;
m=TotalMin(3:8)/sum(TotalNum)*lambda1;
%%
Sub=getPCIP;
Sub=cell2mat(Sub);
uid=Sub(:,1);
Sub=Sub(:,2:4);
TotalSub=round(sum(diag(TotalNum)*Sub));
lambda2=0.8;
sub=TotalSub/sum(TotalSub)*lambda2;
Total=diag(TotalNum);
A=[TotalNum,-Total*Min,-Total*Sub];
b=[1e8,-m*1e8,-sub*1e8]';
%%
temp=dbquery(char('md_earn_wne_p10','GRAD_DEBT_MDN_SUPP','NPT4_PUB','NPT4_PRIV'));
earning=cell2mat(temp(:,1));
debt=cell2mat(temp(:,2));
avr_price=cell2mat(temp(:,3:4));
avr_price=sum(avr_price,2)+1;
ROI=earning./(avr_price+debt);
%%
temp=dbquery(char('C150_4_POOLED_SUPP'));
temp=cell2mat(temp);
temp2=dbquery(char('C200_L4_POOLED_SUPP'));
temp2=cell2mat(temp2);
Risk=temp+temp2+1;
index=(avr_price~=-1&debt~=-1&earning~=-1&avr_price>=0&Risk~=-1);
%%
% temp=dbquery(char())
%%
save Init