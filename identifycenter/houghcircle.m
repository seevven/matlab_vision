function [ Xcircle,Ycircle ] = houghcircle( L,flag,sectionnum,sectionlabel )
%This function is used to find the circle center of the shape.
%If it is identified to be a circle, then use this function to 
%calculate the center.
%Xcircle and Ycircle return the coordinate of the center.
[m,n]=size(L);
accumulator=zeros(m,n,sectionnum);
flag1=zeros(1,sectionnum);
col=zeros(1,sectionnum);
row=zeros(1,sectionnum);
%����ͬ��״�ĵ���࣬���ڲ�ͬ����������е㣬����õĵ�����ۼӣ��ۼӵ����ֵ��Ϊ��Բ�ġ�
for number=1:sectionnum
    p1=1;p2=1;p3=1;p4=1;p5=1;p6=1;p7=1;p8=1;
    if flag(number)==2                                                        %�ж�����״ΪԲ�����м���
for i=5:m-4
    for j=5:n-4
        if L(i,j)==sectionlabel(number)
            if L(i,j)==sectionlabel(number) && L(i,j+1)==sectionlabel(number) && L(i,j-1)==sectionlabel(number)
                L1(1,p1,number)=i;
                L1(2,p1,number)=j;
                p1=p1+1;
            end
            if L(i,j)==sectionlabel(number) && L(i+1,j)==sectionlabel(number) && L(i-1,j)==sectionlabel(number)
                L2(1,p2,number)=i;
                L2(2,p2,number)=j;
                p2=p2+1;
            end
            if L(i,j)==sectionlabel(number) && L(i-1,j+1)==sectionlabel(number) && L(i+1,j-1)==sectionlabel(number)
                L3(1,p3,number)=i;
                L3(2,p3,number)=j;
                p3=p3+1;
            end
            if L(i,j)==sectionlabel(number) && L(i+1,j+1)==sectionlabel(number) && L(i-1,j-1)==sectionlabel(number)
                L4(1,p4,number)=i;
                L4(2,p4,number)=j;
                p4=p4+1;
            end
            if (L(i,j)==sectionlabel(number) && L(i-1,j-1)==sectionlabel(number) && L(i-1,j+1)==sectionlabel(number))||(L(i,j)==sectionlabel(number) && L(i-1,j-1)==sectionlabel(number) && L(i,j+1)==sectionlabel(number))||(L(i,j)==sectionlabel(number) && L(i,j-1)==sectionlabel(number) && L(i-1,j+1)==sectionlabel(number))
                L5(1,p5,number)=i;
                L5(2,p5,number)=j;
                p5=p5+1;
            end
            if (L(i,j)==sectionlabel(number) && L(i+1,j+1)==sectionlabel(number) && L(i+1,j-1)==sectionlabel(number))||(L(i,j)==sectionlabel(number) && L(i,j-1)==sectionlabel(number) && L(i+1,j+1)==sectionlabel(number))||(L(i,j)==sectionlabel(number) && L(i+1,j-1)==sectionlabel(number) && L(i,j+1)==sectionlabel(number))
                L6(1,p6,number)=i;
                L6(2,p6,number)=j;
                p6=p6+1;
            end
            if (L(i,j)==sectionlabel(number) && L(i-1,j-1)==sectionlabel(number) && L(i+1,j)==sectionlabel(number))||(L(i,j)==sectionlabel(number) && L(i-1,j)==sectionlabel(number) && L(i+1,j-1)==sectionlabel(number))||(L(i,j)==sectionlabel(number) && L(i-1,j-1)==sectionlabel(number) && L(i+1,j-1)==sectionlabel(number))
                L7(1,p7,number)=i;
                L7(2,p7,number)=j;
                p7=p7+1;
            end
            if (L(i,j)==sectionlabel(number) && L(i-1,j)==sectionlabel(number) &&L(i+1,j+1)==sectionlabel(number))||(L(i,j)==sectionlabel(number) && L(i-1,j+1)==sectionlabel(number) && L(i+1,j)==sectionlabel(number))||(L(i,j)==sectionlabel(number) && L(i-1,j+1)==sectionlabel(number) && L(i+1,j+1)==sectionlabel(number))
                L8(1,p8,number)=i;
                L8(2,p8,number)=j;
                p8=p8+1;
            end
        end
    end
end
    end
    if p1==1 && p2==1 && p3==1 && p4==1 && p5==1 && p6==1 && p7==1 && p8==1 || flag(number)~=2
            flag1(1,number)=1;
    end
end
thresh=5;
for number=1:sectionnum
    if flag1(1,number)==1
        continue;
    end
x1=find(L1(1,:,number)~=0);
y1=find(L1(2,:,number)~=0);
[~,n1]=size(x1);
for i=1:n1
    for j=i+1:n1
        d1=sqrt((L1(1,i,number)-L1(1,j,number))^2+(L1(2,i,number)-L1(2,j,number))^2);
        if d1>thresh
            x1=round((L1(1,i,number)+L1(1,j,number))/2);
            y1=round((L1(2,i,number)+L1(2,j,number))/2);
            accumulator(x1,y1,number)=accumulator(x1,y1,number)+1;
        end
    end
end
x2=find(L2(1,:,number)~=0);
y2=find(L2(2,:,number)~=0);
[~,n2]=size(x2);
for i=1:n2
    for j=i+1:n2
        d2=sqrt((L2(1,i,number)-L2(1,j,number))^2+(L2(2,i,number)-L2(2,j,number))^2);
        if d2>thresh
            x2=round((L2(1,i,number)+L2(1,j,number))/2);
            y2=round((L2(2,i,number)+L2(2,j,number))/2);
            accumulator(x2,y2,number)=accumulator(x2,y2,number)+1;
        end
    end
end
x3=find(L3(1,:,number)~=0);
y3=find(L3(2,:,number)~=0);
[~,n3]=size(x3);
for i=1:n3
    for j=i+1:n3
        d3=sqrt((L3(1,i,number)-L3(1,j,number))^2+(L3(2,i,number)-L3(2,j,number))^2);
        if d3>thresh
            x3=round((L3(1,i,number)+L3(1,j,number))/2);
            y3=round((L3(2,i,number)+L3(2,j,number))/2);
            accumulator(x3,y3,number)=accumulator(x3,y3,number)+1;
        end
    end
end
x4=find(L4(1,:,number)~=0);
y4=find(L4(2,:,number)~=0);
[~,n4]=size(x4);
for i=1:n4
    for j=i+1:n4
        d4=sqrt((L4(1,i,number)-L4(1,j,number))^2+(L4(2,i,number)-L4(2,j,number))^2);
        if d4>thresh
            x4=round((L4(1,i,number)+L4(1,j,number))/2);
            y4=round((L4(2,i,number)+L4(2,j,number))/2);
            accumulator(x4,y4,number)=accumulator(x4,y4,number)+1;
        end
    end
end
x5=find(L5(1,:,number)~=0);
y5=find(L5(2,:,number)~=0);
[~,n5]=size(x5);
x6=find(L6(1,:,number)~=0);
y6=find(L6(2,:,number)~=0);
[~,n6]=size(x6);
for i=1:n5
    for j=1:n6
        d5=sqrt((L5(1,i,number)-L6(1,j,number))^2+(L5(2,i,number)-L6(2,j,number))^2);
        if d5>thresh
            x5=round((L5(1,i,number)+L6(1,j,number))/2);
            y5=round((L5(2,i,number)+L6(2,j,number))/2);
            accumulator(x5,y5,number)=accumulator(x5,y5,number)+1;
        end
    end
end
x7=find(L7(1,:,number)~=0);
y7=find(L7(2,:,number)~=0);
[~,n7]=size(x7);
x8=find(L8(1,:,number)~=0);
y8=find(L8(2,:,number)~=0);
[~,n8]=size(x8);
for i=1:n7
    for j=1:n8
        d6=sqrt((L7(1,i,number)-L8(1,j,number))^2+(L7(2,i,number)-L8(2,j,number))^2);
        if d6>thresh
            x6=round((L7(1,i,number)+L8(1,j,number))/2);
            y6=round((L7(2,i,number)+L8(2,j,number))/2);
            accumulator(x6,y6,number)=accumulator(x6,y6,number)+1;
        end
    end
end
[colmax,colrow]=max(accumulator(:,:,number));
[~,col(1,number)]=max(colmax);
row(1,number)=colrow(col(1,number));
end
Xcircle=col(find(col));
Ycircle=row(find(row));
x=size(Xcircle,2);
%figure(2);
%bw2=ones(size(L));
%imshow(bw);
for i=1:x
    plot(Xcircle(i),Ycircle(i),'*r');
    hold on;
end
end

