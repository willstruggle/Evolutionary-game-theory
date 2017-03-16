n=10000;%输入网格的面积
a=sqrt(n);%网的边长
R=3;T=5;S=0;P=1;%设定支付矩阵参数
c=zeros(n,2);%第一列保存策略（是否合作，合作为1，背叛为0），第二列保存收益
index=randperm(n);
c(index(1:5000),1)=1;
x0=sum(c(:,1));%记录合作者总数
y0=0;%记录总收益
img=zeros(a,a,3);%表示合作者与背叛者的点阵图
b=c(:,1);
for t=1:280%表示博弈进行的轮数
for i=1:n
   if i==1%确定左上角博弈者的收益
       if c(i,1)==1&&c(i+1,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i+1,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i+1,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i+1,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(a+1,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(a+1,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(a+1,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(a+1,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(a*a-a,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(a*a-a,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(a*a-a,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(a*a-a,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(a*a-1,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(a*a-1,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(a*a-1,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(a*a-1,1)==0
           c(i,2)=c(i,2)+P;
       end
   elseif i==a%确定右上角博弈者的收益
       if c(i,1)==1&&c(a-1,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(a-1,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(a-1,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(a-1,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(2*a,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(2*a,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(2*a,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(2*a,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(a*a-2*a+1,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(a*a-2*a+1,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(a*a-2*a+1,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(a*a-2*a+1,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(a*a-a+2,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(a*a-a+2,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(a*a-a+2,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(a*a-a+2,1)==0
           c(i,2)=c(i,2)+P;
       end 
   elseif i==(a*a-a+1)%确定左下角博弈者的收益
       if c(i,1)==1&&c(a*a-a+2,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(a*a-a+2,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(a*a-a+2,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(a*a-a+2,1)==0
           c(i,2)=c(i,2)+P;
       end 
       if c(i,1)==1&&c(a*a-2*a+1,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(a*a-2*a+1,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(a*a-2*a+1,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(a*a-2*a+1,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(a-1,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(a-1,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(a-1,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(a-1,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(2*a,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(2*a,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(2*a,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(2*a,1)==0
           c(i,2)=c(i,2)+P;
       end
   elseif i==a*a%确定右下角博弈者的收益
       if c(i,1)==1&&c(i-1,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i-1,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i-1,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i-1,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(a+1,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(a+1,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(a+1,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(a+1,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(a*a-a,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(a*a-a,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(a*a-a,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(a*a-a,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(2,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(2,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(2,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(2,1)==0
           c(i,2)=c(i,2)+P;
       end
   elseif i>=2&&i<=(a-1)%确定上边线上博弈者的收益 
       if c(i,1)==1&&c(i-1,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i-1,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i-1,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i-1,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(i+1,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i+1,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i+1,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i+1,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(i+a,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i+a,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i+a,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i+a,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(i+a*a-a,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i+a*a-a,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i+a*a-a,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i+a*a-a,1)==0
           c(i,2)=c(i,2)+P;
       end
   elseif mod((i-1),a)==0%确定左边线上博弈者的收益
       if c(i,1)==1&&c(i+1,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i+1,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i+1,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i+1,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(i+a,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i+a,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i+a,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i+a,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(i-a,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i-a,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i-a,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i-a,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(i+a-1,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i+a-1,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i+a-1,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i+a-1,1)==0
           c(i,2)=c(i,2)+P;
       end
   elseif mod(i,a)==0%确定右边线上博弈者的收益
       if c(i,1)==1&&c(i-1,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i-1,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i-1,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i-1,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(i+a,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i+a,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i+a,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i+a,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(i-a,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i-a,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i-a,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i-a,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(i-a+1,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i-a+1,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i-a+1,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i-a+1,1)==0
           c(i,2)=c(i,2)+P;
       end
   elseif i>=(a*a-a+2)&&i<=(a*a-1)%确定下边线上博弈者的收益
       if c(i,1)==1&&c(i-1,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i-1,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i-1,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i-1,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(i+1,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i+1,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i+1,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i+1,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(i-a,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i-a,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i-a,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i-a,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(i-a*a+a,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i-a*a+a,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i-a*a+a,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i-a*a+a,1)==0
           c(i,2)=c(i,2)+P;
       end
   else
       if c(i,1)==1&&c(i+1,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i+1,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i+1,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i+1,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(i-1,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i-1,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i-1,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i-1,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(i+a,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i+a,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i+a,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i+a,1)==0
           c(i,2)=c(i,2)+P;
       end
       if c(i,1)==1&&c(i-a,1)==1
           c(i,2)=c(i,2)+R;
       end
       if c(i,1)==1&&c(i-a,1)==0
           c(i,2)=c(i,2)+S;
       end
       if c(i,1)==0&&c(i-a,1)==1
           c(i,2)=c(i,2)+T;
       end
       if c(i,1)==0&&c(i-a,1)==0
           c(i,2)=c(i,2)+P;
       end
   end   
end
for i=1:n
   if i==1%确定左上角博弈者的策略
       if c(i,2)<c(i+1,2)
           c(i,1)=c(i+1,1);
       end
       if c(i,2)<c(a+1,2)
           c(i,1)=c(a+1,1);
       end
       if c(i,2)<c(a*a-1,2)
           c(i,1)=c(a*a-1,1);
       end
       if c(i,2)<c(a*a-a,2)
           c(i,1)=c(a*a-a,1);
       end
       
   elseif i==a%确定右上角博弈者的策略
       if c(i,2)<c(i-1,2)
           c(i,1)=c(i-1,1);
       end
       if c(i,2)<c(a+i,2)
           c(i,1)=c(a+i,1);
       end
       if c(i,2)<c(a*a-2*a+1,2)
           c(i,1)=c(a*a-2*a+1,1);
       end
       if c(i,2)<c(a*a-a+2,2)
           c(i,1)=c(a*a-a+2,1);
       end  
   elseif i==(a*a-a+1)%确定左下角博弈者的策略
       if c(i,2)<c(i+1,2)
           c(i,1)=c(i+1,1);
       end
       if c(i,2)<c(i-a,2)
           c(i,1)=c(i-a,1);
       end
       if c(i,2)<c(a-1,2)
           c(i,1)=c(a-1,1);
       end
       if c(i,2)<c(2*a,2)
           c(i,1)=c(2*a,1);
       end    
   elseif i==a*a%确定右下角博弈者的策略
       if c(i,2)<c(i-1,2)
           c(i,1)=c(i-1,1);
       end
       if c(i,2)<c(i-a,2)
           c(i,1)=c(i-a,1);
       end
       if c(i,2)<c(a+1,2)
           c(i,1)=c(a+1,1);
       end
       if c(i,2)<c(2,2)
           c(i,1)=c(2,1);
       end
   elseif i>=2&&i<=(a-1)%确定上边线上博弈者的策略
       if c(i,2)<c(i-1,2)
           c(i,1)=c(i-1,1);
       end
       if c(i,2)<c(i+1,2)
           c(i,1)=c(i+1,1);
       end
       if c(i,2)<c(i+a,2)
           c(i,1)=c(i+a,1);
       end
       if c(i,2)<c(i+a*a-a,2)
           c(i,1)=c(i+a*a-a,1);
       end
   elseif mod((i-1),a)==0%确定左边线上博弈者的策略
        if c(i,2)<c(i+1,2)
           c(i,1)=c(i+1,1);
       end
       if c(i,2)<c(i+a,2)
           c(i,1)=c(i+a,1);
       end
       if c(i,2)<c(i-a,2)
           c(i,1)=c(i-a,1);
       end
       if c(i,2)<c(i+a-1,2)
           c(i,1)=c(i+a-1,1);
       end 
   elseif mod(i,a)==0%确定右边线上博弈者的策略
        if c(i,2)<c(i-1,2)
           c(i,1)=c(i-1,1);
       end
       if c(i,2)<c(i+a,2)
           c(i,1)=c(i+a,1);
       end
       if c(i,2)<c(i-a,2)
           c(i,1)=c(i-a,1);
       end
       if c(i,2)<c(i-a+1,2)
           c(i,1)=c(i-a+1,1);
       end 
   elseif i>=(a*a-a+2)&&i<=(a*a-1)%确定下边线上博弈者的策略
       if c(i,2)<c(i+1,2)
           c(i,1)=c(i+1,1);
       end
       if c(i,2)<c(i-1,2)
           c(i,1)=c(i-1,1);
       end
       if c(i,2)<c(i-a,2)
           c(i,1)=c(i-a,1);
       end
       if c(i,2)<c(i-a*a+a,2)
           c(i,1)=c(i-a*a+a,1);
       end 
   else
       if c(i,2)<c(i+1,2)
           c(i,1)=c(i+1,1);
       end
       if c(i,2)<c(i-1,2)
           c(i,1)=c(i-1,1);
       end
       if c(i,2)<c(i-a,2)
           c(i,1)=c(i-a,1);
       end
       if c(i,2)<c(i+a,2)
           c(i,1)=c(i+a,1);
       end 
   end   
end
   x0=[x0,sum(c(:,1))];%存储合作者的数量
   y0=[y0,sum(c(:,2))];%存储收益
   if mod(t,20)==0
       b=[b,c(:,1)];
   end
end

for t=1:15
   for j=1:n
    if mod(j,a)==0
        col=a;
    else
        col=mod(j,a);
    end
    row=ceil(j/a); 
    img(row,col,1)=b(j,t);
   end
   subplot(3,5,t)
   imshow(img);
end




