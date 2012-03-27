function [ d ] = distance( L ,m,n)
%This function is used to cacculate the min distance of two shapes.
%If the min distance is less than the thresh, think the latter shape
%affiliate with the former one.
thresh=20;
[x1,y1]=find(L==m);
[x2,y2]=find(L==n);
c=zeros(size(x1,1),size(x2,1));
for i=1:size(x1,1)
    for j=1:size(x2,1)
        c(i,j)=sqrt((x1(i)-x2(j))^2+(y1(i)-y2(j))^2);
    end
end
d=min(min(c));



