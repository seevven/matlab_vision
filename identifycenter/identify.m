function [ flag ,answer ] = identify( L,num ,thresh)
%This function is used to identify different shapes in the image,
%like cross and circle, so that it can choose different Algorithm
%to calculate the center.
%flag return the number of the shape. Cross is 1,cricle is 2.
[m,n]=size(L);
ma=180;
md=round(sqrt(m^2+n^2));
ruthta=zeros(md,ma,num);
%hough变换，如果累计值大于thresh，判定为直线，否则为圆
for number=1:num
    for i=5:m-4
        for j=5:n-4
            if L(i,j)==number
                for k=1:ma
                    ru=round(abs(j*cos(k)+i*sin(k)));
                    ruthta(ru+1,k,number)=ruthta(ru+1,k,number)+1;
                end
            end
        end
    end
end
answermax=zeros(1,num);
flag=zeros(num,1);
answer=cell(1,1);
for k=1:num
    answer{k,1}=[];
end
for i=1:num
    answermax(1,i)=max(max(ruthta(:,:,i)));
    if answermax(1,i)>=thresh
        answer{i,1}='cross';
        flag(i,1)=1;
    end
    if answermax(1,i)<thresh
        answer{i,1}='circle';
        flag(i,1)=2;
    end
end
end

