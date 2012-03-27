clear
image=imread('tuoyuan.png');
image=rgb2gray(image);
[m,n]=size(image);
bw=edge(image,'sobel');
ru=round(sqrt(m^2+n^2));
se=strel('disk',1);
bw2=imdilate(bw,se);
accumulator=zeros(m,n);
sum=0;k=1;
for i=1:m
    for j=1:n
        if bw2(i,j)==1
            sum=sum+1;
            black(1,k)=i;
            black(2,k)=j;
            k=k+1;
        end
    end
end
p1=1;p2=1;p3=1;p4=1;p5=1;p6=1;p7=1;p8=1;
for i=2:m
    for j=2:n
        if bw2(i,j)==1 & bw2(i,j+1)==1 & bw2(i,j-1)==1
            L1(1,p1)=i;
            L1(2,p1)=j;
            p1=p1+1;
        end
        if bw2(i,j)==1 & bw2(i+1,j)==1 & bw2(i-1,j)==1
            L2(1,p2)=i;
            L2(2,p2)=j;
            p2=p2+1;
        end
        if bw2(i,j)==1 & bw2(i-1,j+1)==1 & bw2(i+1,j-1)==1
            L3(1,p3)=i;
            L3(2,p3)=j;
            p3=p3+1;
        end
        if bw2(i,j)==1 & bw2(i+1,j+1)==1 & bw2(i-1,j-1)==1
            L4(1,p4)=i;
            L4(2,p4)=j;
            p4=p4+1;
        end
        if (bw2(i,j)==1 & bw2(i-1,j-1)==1 & bw2(i-1,j+1)==1)|(bw2(i,j)==1 & bw2(i-1,j-1)==1 & bw2(i,j+1)==1)|(bw2(i,j)==1 & bw2(i,j-1)==1 & bw2(i-1,j+1)==1)
            L5(1,p5)=i;
            L5(2,p5)=j;
            p5=p5+1;
        end
        if (bw2(i,j)==1 & bw2(i+1,j+1)==1 & bw2(i+1,j-1)==1)|(bw2(i,j)==1 & bw2(i,j-1)==1 & bw2(i+1,j+1)==1)|(bw2(i,j)==1 & bw2(i+1,j-1)==1 & bw2(i,j+1)==1)
            L6(1,p6)=i;
            L6(2,p6)=j;
            p6=p6+1;
        end
        if (bw2(i,j)==1 & bw2(i-1,j-1)==1 & bw2(i+1,j)==1)|(bw2(i,j)==1 & bw2(i-1,j)==1 & bw2(i+1,j-1)==1)|(bw2(i,j)==1 & bw2(i-1,j-1)==1 & bw2(i+1,j-1)==1)
            L7(1,p7)=i;
            L7(2,p7)=j;
            p7=p7+1;
        end
        if (bw2(i,j)==1 & bw2(i-1,j)==1 & bw2(i+1,j+1)==1)|(bw2(i,j)==1 & bw2(i-1,j+1)==1 & bw2(i+1,j)==1)|(bw2(i,j)==1 & bw2(i-1,j+1)==1 & bw2(i+1,j+1)==1)
            L8(1,p8)=i;
            L8(2,p8)=j;
            p8=p8+1;
        end
    end
end
thresh=5;
[m1,n1]=size(L1);
for i=1:n1
    for j=1:n1
        d1=sqrt((L1(1,i)-L1(1,j))^2+(L1(2,i)-L1(2,j))^2);
        if d1>thresh
            x1=round((L1(1,i)+L1(1,j))/2);
            y1=round((L1(2,i)+L1(2,j))/2);
            accumulator(x1,y1)=accumulator(x1,y1)+1;
        end
    end
end
[m2,n2]=size(L2);
for i=1:n2
    for j=1:n2
        d2=sqrt((L2(1,i)-L2(1,j))^2+(L2(2,i)-L2(2,j))^2);
        if d2>thresh
            x2=round((L2(1,i)+L2(1,j))/2);
            y2=round((L2(2,i)+L2(2,j))/2);
            accumulator(x2,y2)=accumulator(x2,y2)+1;
        end
    end
end
[m3,n3]=size(L3);
for i=1:n3
    for j=1:n3
        d3=sqrt((L3(1,i)-L3(1,j))^2+(L3(2,i)-L3(2,j))^2);
        if d3>thresh
            x3=round((L3(1,i)+L3(1,j))/2);
            y3=round((L3(2,i)+L3(2,j))/2);
            accumulator(x3,y3)=accumulator(x3,y3)+1;
        end
    end
end
[m4,n4]=size(L4);
for i=1:n4
    for j=1:n4
        d4=sqrt((L4(1,i)-L4(1,j))^2+(L4(2,i)-L4(2,j))^2);
        if d4>thresh
            x4=round((L4(1,i)+L4(1,j))/2);
            y4=round((L4(2,i)+L4(2,j))/2);
            accumulator(x4,y4)=accumulator(x4,y4)+1;
        end
    end
end
[m5,n5]=size(L5);
[m6,n6]=size(L6);
for i=1:n5
    for j=1:n6
        d5=sqrt((L5(1,i)-L6(1,j))^2+(L5(2,i)-L6(2,j))^2);
        if d5>thresh
            x5=round((L5(1,i)+L6(1,j))/2);
            y5=round((L5(2,i)+L6(2,j))/2);
            accumulator(x5,y5)=accumulator(x5,y5)+1;
        end
    end
end
[m7,n7]=size(L7);
[m8,n8]=size(L8);
for i=1:n7
    for j=1:n8
        d6=sqrt((L7(1,i)-L8(1,j))^2+(L7(2,i)-L8(2,j))^2);
        if d6>thresh
            x6=round((L7(1,i)+L8(1,j))/2);
            y6=round((L7(2,i)+L8(2,j))/2);
            accumulator(x6,y6)=accumulator(x6,y6)+1;
        end
    end
end
[colmax,colrow]=max(accumulator);
[arraymax,col]=max(colmax)
row=colrow(col)
answer=zeros(700,700,181);
for i=1:sum
    for j=(i+1):sum
        for k=(j+1):sum
            if sqrt((black(1,i)-black(1,j))^2+(black(2,i)-black(2,j))^2)>thresh && sqrt((black(1,i)-black(1,k))^2+(black(2,i)-black(2,k))^2)>thresh && sqrt((black(1,k)-black(1,j))^2+(black(2,k)-black(2,j))^2)>thresh
                f=@(x)([((black(1,i)-row)*cos(x(3))+(black(2,i)-col)*sin(x(3)))^2/x(1)/x(1)+((black(1,i)-row)*sin(x(3))+(black(2,i)-col)*cos(x(3)))^2/x(2)/x(2)-1;((black(1,i)-row)*cos(x(3))+(black(2,j)-col)*sin(x(3)))^2/x(1)/x(1)+((black(1,j)-row)*sin(x(3))+(black(2,j)-col)*cos(x(3)))^2/x(2)/x(2)-1;((black(1,k)-row)*cos(x(3))+(black(2,k)-col)*sin(x(3)))^2/x(1)/x(1)+((black(1,k)-row)*sin(x(3))+(black(2,k)-col)*cos(x(3)))^2/x(2)/x(2)-1]);
                x=fsolve(f,[1,1,1]);
                if isreal(x)==1 && x(1)>0 && x(2)>0 && x(1)<ru/2 && x(2)<ru/2 && x(3)<=pi && x(3)>=0
                    a=round(x(1));
                    b=round(x(2));
                    theta=round(x(3)*180/pi);
                    %if x(3)<0
                     %   theta=round(abs(x(3)*180/pi))+180;
                    %elseif x(3)*180/pi>180
                     %   theta=round(x(3)*180/pi-180);
                    %else 
                     %   theta=round(x(3)*180/pi);
                    %end
                    answer(a,b,theta+1)=answer(a,b,theta+1)+1;
                end
            end
        end
    end
end
[answermax,maxind]=max(answer(:));
[A,B,THETA]=ind2sub(size(answer),maxind);