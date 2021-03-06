tic
load resp;
n=28;                                                %节点数目
m=27;                                                %梁元数目
T=1376;                                              %时间点个数
E=1.0e4;                                             %弹性模量
fin=fopen('inputdata.txt','r');
I=fscanf(fin,'%f',m);                               %截面惯性矩
x=fscanf(fin,'%f',n);                               %节点坐标
for i=1:m
    L(i)=x(i+1)-x(i);                                %梁元长度
end
k=zeros(4,4,m);
for j=1:m
    k(:,:,j)=beamelementstiffness(E,I(j),L(j));      %梁元j的刚度矩阵
end
for j=1:T                                         %读入resp文件中的位移和转角到u
    u(1,j)=resp(1,j);
    for i=2:n+1
        u(2*i-2,j)=resp(i,j);
    end
    for i=n+2:2*n+1
        u(2*i-2*n-1,j)=resp(i,j);
    end
end
f=zeros(2*n+1,T);
for i=1:T                                            %计算节点载荷
    f1(1,i)=resp(1,i);
    f(1,i)=resp(1,i);
    for j=1:m
        f1(4*j-2:4*j+1,i)=k(:,:,j)*u(2*j:2*j+3,i);
    end
    for j=1:m
        f(2*j:2*j+1,i)=f1(4*j-2:4*j-1,i);            %取左节点为该节点内力
    end
    f(2*n:2*n+1,i)=f1(4*m:4*m+1,i);
end
node=28;                                            %用户指定节点
clocknum=3;                                         %用户指定时刻
clock=resp(1,clocknum);
for i=1:27
    output(i,:)=f1(4*i-2:4*i+1,clocknum);
end
savefile='forceandmomentdata.mat';
save(savefile,'output');
t=resp(1,:);
beamelementmomentdiagram(f,t,node);
figure;
beamelementmomentdiagramwithlength(f,x,clocknum,n);
toc