%PGG game的网状模型
% NM=[];NRM=[];NPM=[];
% for k=1:1000
n=900;%必须为平方数
a=sqrt(n);
p=0.2;%富人的比例
v=50;%每一户同意合作的农户需要的投资
ar=1000;%富人务农收益
ap=500;%穷人务农收益
br=1000;%富人农田被淹损失
bp=500;%穷人农田被淹损失
r=0.6;%发生洪水的概率
T=6000;%维修大坝的费用
NC=0.5*n;%初始化变量
index1=randperm(n);
index2=randperm(n);
c=zeros(n,3);%创建初始的数组表储存个人信息，第一列为1表示合作，第二列为1表示为富人，第三列表示收益
c(index1(1:NC),1)=1;%将初始NC个合作者随机分配
c(index2(1:n*p),2)=1;%将比例为p的富人随机分配
NC0=NC/n;%合作者占总人数的比例
img=zeros(a,a,3);
b1=c(:,1);
b2=c(:,2);
NRC0=0;%富人中合作者的人数
for j=1:n
    if c(j,2)==1
        NRC0=c(j,1)+NRC0;
    end
end
NPC0=0;%穷人中合作者的人数
for j=1:n
    if c(j,2)==0
        NPC0=c(j,1)+NPC0;
    end
end
for t=1:50
    if NC*v>=T%筹措的资金足够维护大坝
        for j=1:n
            if c(j,1)==1&&c(j,2)==1
                c(j,3)=ar-v;%合作者中富人的收益
            end
            if c(j,1)==1&&c(j,2)==0
                c(j,3)=ap-v;%合作者中穷人的收益
            end
            if c(j,1)==0&&c(j,2)==1
                c(j,3)=ar;%背叛者中富人的收益
            end
            if c(j,1)==0&&c(j,2)==0
                c(j,3)=ap;%背叛者中穷人的收益
            end
        end%for
    else %筹措的资金不够维护大坝
        if rand(1)<r %以r的概率发洪水
         for j=1:n
            if c(j,1)==1&&c(j,2)==1
                c(j,3)=-v-br;%合作者中富人的收益
            end
            if c(j,1)==1&&c(j,2)==0
                c(j,3)=-v-bp;%合作者中穷人的收益
            end
            if c(j,1)==0&&c(j,2)==1
                c(j,3)=-br;%背叛者中富人的收益
            end
            if c(j,1)==0&&c(j,2)==0
                c(j,3)=-bp;%背叛者中穷人的收益
            end
          end%for
        else %没有发洪水的情况
          for j=1:n
            if c(j,1)==1&&c(j,2)==1
                c(j,3)=ar-v;%合作者中富人的收益
            end
            if c(j,1)==1&&c(j,2)==0
                c(j,3)=ap-v;%合作者中穷人的收益
            end
            if c(j,1)==0&&c(j,2)==1
                c(j,3)=ar;%背叛者中富人的收益
            end
            if c(j,1)==0&&c(j,2)==0
                c(j,3)=ap;%背叛者中穷人的收益
            end
          end%for      
        end
    end
   for i=1:n
   %在网状结构中确定博弈者的策略
   if i==1%左上角
       if c(i,3)<c(i+1,3)
           c(i,1)=c(i+1,1);
       end
       if c(i,3)<c(a+1,3)
           c(i,1)=c(a+1,1);
       end
       if c(i,3)<c(a*a-1,3)
           c(i,1)=c(a*a-1,1);
       end
       if c(i,3)<c(a*a-a,3)
           c(i,1)=c(a*a-a,1);
       end
       
   elseif i==a%右上角
       if c(i,3)<c(i-1,3)
           c(i,1)=c(i-1,1);
       end
       if c(i,3)<c(a+i,3)
           c(i,1)=c(a+i,1);
       end
       if c(i,3)<c(a*a-2*a+1,3)
           c(i,1)=c(a*a-2*a+1,1);
       end
       if c(i,3)<c(a*a-a+2,3)
           c(i,1)=c(a*a-a+2,1);
       end  
   elseif i==(a*a-a+1)%左下角
       if c(i,3)<c(i+1,3)
           c(i,1)=c(i+1,1);
       end
       if c(i,3)<c(i-a,3)
           c(i,1)=c(i-a,1);
       end
       if c(i,3)<c(a-1,3)
           c(i,1)=c(a-1,1);
       end
       if c(i,3)<c(2*a,3)
           c(i,1)=c(2*a,1);
       end    
   elseif i==a*a%右下角
       if c(i,3)<c(i-1,3)
           c(i,1)=c(i-1,1);
       end
       if c(i,3)<c(i-a,3)
           c(i,1)=c(i-a,1);
       end
       if c(i,3)<c(a+1,3)
           c(i,1)=c(a+1,1);
       end
       if c(i,3)<c(2,3)
           c(i,1)=c(2,1);
       end
   elseif i>=2&&i<=(a-1)%上边
       if c(i,3)<c(i-1,3)
           c(i,1)=c(i-1,1);
       end
       if c(i,3)<c(i+1,3)
           c(i,1)=c(i+1,1);
       end
       if c(i,3)<c(i+a,3)
           c(i,1)=c(i+a,1);
       end
       if c(i,3)<c(i+a*a-a,3)
           c(i,1)=c(i+a*a-a,1);
       end
   elseif mod((i-1),a)==0%左边
        if c(i,3)<c(i+1,3)
           c(i,1)=c(i+1,1);
       end
       if c(i,3)<c(i+a,3)
           c(i,1)=c(i+a,1);
       end
       if c(i,3)<c(i-a,3)
           c(i,1)=c(i-a,1);
       end
       if c(i,3)<c(i+a-1,3)
           c(i,1)=c(i+a-1,1);
       end 
   elseif mod(i,a)==0%右边
        if c(i,3)<c(i-1,3)
           c(i,1)=c(i-1,1);
       end
       if c(i,3)<c(i+a,3)
           c(i,1)=c(i+a,1);
       end
       if c(i,3)<c(i-a,3)
           c(i,1)=c(i-a,1);
       end
       if c(i,3)<c(i-a+1,3)
           c(i,1)=c(i-a+1,1);
       end 
   elseif i>=(a*a-a+2)&&i<=(a*a-1)%下边
       if c(i,3)<c(i+1,3)
           c(i,1)=c(i+1,1);
       end
       if c(i,3)<c(i-1,3)
           c(i,1)=c(i-1,1);
       end
       if c(i,3)<c(i-a,3)
           c(i,1)=c(i-a,1);
       end
       if c(i,3)<c(i-a*a+a,3)
           c(i,1)=c(i-a*a+a,1);
       end 
   else
       if c(i,3)<c(i+1,3)
           c(i,1)=c(i+1,1);
       end
       if c(i,3)<c(i-1,3)
           c(i,1)=c(i-1,1);
       end
       if c(i,3)<c(i-a,3)
           c(i,1)=c(i-a,1);
       end
       if c(i,3)<c(i+a,3)
           c(i,1)=c(i+a,1);
       end 
   end   
end
    NC=sum(c(:,1));
    NC0=[NC0,NC/n];
    NRC=0;
    NPC=0;
    for j=1:n
        if c(j,2)==1
            NRC=c(j,1)+NRC;
        end
    end
    NRC0=[NRC0,NRC];
    for j=1:n
        if c(j,2)==0
            NPC=c(j,1)+NPC;
        end
    end
    NPC0=[NPC0,NPC];
    if mod(t,6)==0
       b1=[b1,c(:,1)];
       b2=[b2,c(:,2)];
    end
 end
NRC0=NRC0/(n*p);
NPC0=NPC0/(n*(1-p));
% NM=[NM,mean(NC0(30:50))];
% NRM=[NRM,mean(NRC0(30:50))];
% NPM=[NPM,mean(NPC0(30:50))];
% end
    subplot(3,3,1)
    plot(0:t,NC0);
    title('合作者占总人数的比例')
    subplot(3,3,2)
    plot(0:t,NRC0);
    title('富人中合作者的比例')
    subplot(3,3,3)
    plot(0:t,NPC0)
    title('穷人中合作者的比例')   
for s=1:6
   img=ones(a,a,3);
   for j=1:n
    if mod(j,a)==0
        col=a;
    else
        col=mod(j,a);
    end
    row=ceil(j/a); 
    img(row,col,1)=b1(j,s);
    img(row,col,2)=b2(j,s);
   end
   subplot(3,3,s+3)
   imshow(img);
end
% mean(NM)
% mean(NRM)
% mean(NPM)
% subplot(2,2,1)
% plot(NM);
% subplot(2,2,2)
% plot(NRM);
% subplot(2,2,3)
% plot(NPM);