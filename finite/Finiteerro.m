load resp;
E=1.0e4;                                             %弹性模量
fin=fopen('inputdata.txt','r');
I=fscanf(fin,'%f',27);                               %截面惯性矩
x=fscanf(fin,'%f',28);                               %节点坐标
for i=1:27
    L(i)=x(i+1)-x(i);                                %梁元长度
end
k=zeros(4,4,27);
for j=1:27
    k(:,:,j)=BeamElementStiffness(E,I(j),L(j));      %梁元j的刚度矩阵
end
K=zeros(56,56);
for i=1:27
    K=BeamAssemble(K,k(:,:,i),i,i+1);                %整体刚度矩阵
end
for j=1:1376                                         %读入resp文件中的位移和转角到u
    u(1,j)=resp(1,j);
    for i=2:29
        u(2*i-2,j)=resp(i,j);
    end
    for i=30:57
        u(2*i-57,j)=resp(i,j);
    end
end
for i=1:1376                                         %计算节点载荷
    f(:,i)=K*u(2:57,i);
end
t=resp(1,:);
%for i=1:28
    BeamElementMomentDiagramerro(f,t,1);
%end

