clear
rgb=imread('blue.png');
[A,map]=rgb2ind(rgb,128);
[m,n]=size(map);
num=1;
k=1:m;
index(k,1)=-1;
for i=1:m
    if map(i,1)<=0.65 && map(i,1)>=0.4 && map(i,2)<=0.3 &&map(i,2)>=0.01 && map(i,3)<=0.65 && map(i,3)>=0.55
        index(num,1)=i-1;
        num=num+1;
    end
end
[m1,n1]=size(A);
p=1;
num=size(find(index>=0),1);
for i=1:m1
    for j=1:n1
        for k=1:num
            if A(i,j)==index(k)
                xy{p}=[[i,j]];
                %row(p)=i;
                %col(p)=j;
                p=p+1;
            end
        end
    end
end
figure(1);
im=zeros(m1,n1);
for k=1:p-1
   % im(row(i),col(i))=1;
    im(xy{k}(1),xy{k}(2))=1;
end
imshow(im);
        