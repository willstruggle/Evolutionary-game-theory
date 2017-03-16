%PGG game的环状模型
NM=[];NRM=[];NPM=[];
for k=1:1000
n=1000;p=0.2;v=50;ar=1000;ap=500;br=1000;bp=500;r=0.6;T=5000;NC=0.5*n;%初始化变量
t=100;
index1=randperm(n);
index2=randperm(n);
c=zeros(n,3);%创建初始的数组表储存个人信息，第一列为1表示合作，第二列为1表示为富人，第三列表示收益
c(index1(1:NC),1)=1;%将初始NC个合作者随机分配
c(index2(1:n*p),2)=1;%将比例为p的富人随机分配
NC0=NC/n;%合作者占总人数的比例
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
for i=1:t%t表示演化的轮数
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
    %下面考虑环状的两两博弈情况
    %端点的策略选择
    if c(1,3)<c(n,3)
        c(1,1)=c(n,1);
    end
    if c(1,3)<c(2,3)
        c(1,1)=c(2,1);
    end
    if c(n,3)<c(n-1,3)
        c(n,1)=c(n-1,1);
    end
    if c(n,3)<c(1,3)
        c(n,1)=c(1,1);
    end
    %中间点的策略选择
    for j=2:(n-1)
            if c(j,3)<c(j-1,3)
                c(j,1)=c(j-1,1);
            end
            if c(j,3)<c(j+1,3)
                c(j,1)=c(j+1,1);
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

end%for
NRC0=NRC0/(n*p);
NPC0=NPC0/(n*(1-p));
%subplot(2,2,1)
%plot(0:t,NC0);
%title('合作者占总人数的比例')
%subplot(2,2,2)
%plot(0:t,NRC0);
%title('富人合作者的比例')
%subplot(2,2,3)
%plot(0:t,NPC0)
%title('穷人合作者的比例')
NM=[NM,mean(NC0(60:90))];
NRM=[NRM,mean(NRC0(60:90))];
NPM=[NPM,mean(NPC0(60:90))];
end
mean(NM)
mean(NRM)
mean(NPM)
subplot(2,2,1)
plot(NM);
subplot(2,2,2)
plot(NRM);
subplot(2,2,3)
plot(NPM);