%本程序用来模拟n人博弈者形成一个环，相互之间进行t轮囚徒博弈之后的模拟程序
n=1000;%n表示博弈者的数量，这里假定为1000
R=3;T=5;S=0;P=1;%初始收益矩阵的各项数值
c=zeros(n,2);%第一列保存策略，第二列保存收益
index=randperm(n);
c(index(1:500),1)=1;%确定初始合作者数量
x0=sum(c(:,1));%记录每一轮博弈结束之后合作者的数量
for t=1:1000
   for i=1:n
       %讨论编号为1的博弈者与编号为1000和2的博弈者的博弈结果
       if i==1
           if c(i,1)==1&&c(i+1)==1
               c(i,2)=c(i,2)+R;          
           elseif c(i,1)==1&&c(i+1)==0
               c(i,2)=c(i,2)+S;          
           elseif c(i,1)==0&&c(i+1)==1
               c(i,2)=c(i,2)+T;           
           elseif c(i,1)==0&&c(i+1)==0
               c(i,2)=c(i,2)+P;
           end
           if c(i,1)==1&&c(n)==1
               c(i,2)=c(i,2)+R;
           elseif c(i,1)==1&&c(n)==0
               c(i,2)=c(i,2)+S;
           elseif c(i,1)==0&&c(n)==1
               c(i,2)=c(i,2)+T;
           
           elseif c(i,1)==0&&c(n)==0
               c(i,2)=c(i,2)+P;
           end
       end
       %讨论编号为n的博弈者与编号为n-1和1的博弈者的博弈结果
       if i==n
           if c(i,1)==1&&c(i-1)==1
               c(i,2)=c(i,2)+R;       
           elseif c(i,1)==1&&c(i-1)==0
               c(i,2)=c(i,2)+S;
           elseif c(i,1)==0&&c(i-1)==1
               c(i,2)=c(i,2)+T;
           elseif c(i,1)==0&&c(i-1)==0
               c(i,2)=c(i,2)+P;
           end
           if c(i,1)==1&&c(1)==1
               c(i,2)=c(i,2)+R; 
           elseif c(i,1)==1&&c(1)==0
               c(i,2)=c(i,2)+S;  
           elseif c(i,1)==0&&c(1)==1
               c(i,2)=c(i,2)+T;     
           elseif c(i,1)==0&&c(1)==0
               c(i,2)=c(i,2)+P;
           end
       end
       %讨论编号为i（1<i<n）的博弈者与编号为i-1和i+1的博弈者的博弈结果
       if i>=2&&i<=(n-1)
           if c(i,1)==1&&c(i+1)==1
               c(i,2)=c(i,2)+R;   
           elseif c(i,1)==1&&c(i+1)==0
               c(i,2)=c(i,2)+S;       
           elseif c(i,1)==0&&c(i+1)==1
               c(i,2)=c(i,2)+T;           
           elseif c(i,1)==0&&c(i+1)==0
               c(i,2)=c(i,2)+P;
           end
           if c(i,1)==1&&c(i-1)==1
               c(i,2)=c(i,2)+R;   
           elseif c(i,1)==1&&c(i-1)==0
               c(i,2)=c(i,2)+S;
           elseif c(i,1)==0&&c(i-1)==1
               c(i,2)=c(i,2)+T;    
           elseif c(i,1)==0&&c(i-1)==0
               c(i,2)=c(i,2)+P;
           end
       end
   end
  for i=1:n
      %比较编号为1的博弈者与相邻两个博弈者的收益大小，并学习收益大的博弈者的策略
      if i==1
           if c(1,2)<c(2,2)
               c(1,1)=c(2,1);
           end
           if c(1,2)<c(n,2)
           c(1,1)=c(n,1);
           end
       %比较编号为n的博弈者与相邻两个博弈者的收益大小，并学习收益大的博弈者的策略
      elseif i==n   
           if c(n,2)<c(n-1,2)
              c(n,1)=c(n-1,1);
           end
          if c(n,2)<c(1,2)
             c(n,1)=c(1,1);
          end
      %比较编号为i（1<i<n）的博弈者与相邻两个博弈者的收益大小，并学习收益大的博弈者的策略    
      else
          if c(i,2)<c(i-1,2)
            c(i,1)=c(i-1,1);
          end
          if c(i,2)<c(i+1,2)
             c(i,1)=c(i+1,1);
          end
      end
   end
   x0=[x0,sum(c(:,1))];
end
plot(x0/n)%绘出博弈者中合作者数量变化图