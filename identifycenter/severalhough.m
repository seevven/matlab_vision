%hough transform
%可以识别一副图上任意个十字的交点，允许十字有断点。
clear
image=imread('jianduancross.png');
image=rgb2gray(image);
[m,n]=size(image);
bw=edge(image,'sobel');
se=strel('disk',1);
bw=imdilate(bw,se);
imshow(bw)
[L,num]=bwlabel(bw,4);
thresh=20;
for i=1:num
    for j=i+1:num
        [x1,y1]=find(L==i);
        [x2,y2]=find(L==j);
        if isempty(x1)==1 || isempty(x2)==1
            continue;
        end
        d(i,j)=distance(L,i,j);
        if d(i,j)<thresh
       for k=1:size(x2,1)
            L(x2(k),y2(k))=L(x1(1),y1(1));
       end
 end
    end
end
md=round(sqrt(m^2+n^2));
ma=180;
ruthta=zeros(md,ma,num);
ruthx=cell(1,1,1);
for i=1:md
    for j=1:ma
        for k=1:num
         ruthx{i,j,k}=[];
        end
    end
end
for number=1:num
for i=5:m-4
    for j=5:n-4
        if L(i,j)==number
            for k=1:ma
                ru=round(abs(j*cos(k)+i*sin(k)));
                ruthta(ru+1,k,number)=ruthta(ru+1,k,number)+1;
                ruthx{ru+1,k,number}=[ruthx{ru+1,k,number},[i,j]'];
            end
        end
    end
end
end
figure(1)
bw=ones(size(bw));
imshow(bw);
M=20;
pointx=zeros(1,M);
pointy=zeros(1,M);
pline=cell(1,M,num);
for i=1:num
    for j=1:M
        [y1,coll]=max(ruthta(:,:,i));
        [y2,row]=max(y1);
        col=coll(row);
        ruthta(col,row,i)=0;
        N=1;
    if col-N>0 && col+N<md && row-N>0 && row+N<ma
        ruthta(col-N:col+N,row-N:row+N,i)=0;
    end
    nds=ruthx{col,row,i};
%    pointx(i)=mean(nds(1,:));
 %   pointy(i)=mean(nds(2,:));
 if isempty(nds)==1
      pline{1,j,i}=[];
      continue;
 end
    pline{1,j,i}=draw(nds);
    end
end
%x=mean(pointx);
%y=mean(pointy);
X=zeros(1,num);
Y=zeros(1,num);
crossx=zeros(1,M^2,num);
crossy=zeros(1,M^2,num);
for number=1:num
    k=1;
    if isempty(pline{1,1,number})==1 
       continue;
    end
    for i=1:M
        for j=i+1:M
            k1=(pline{1,i,number}(2,1)-pline{1,i,number}(2,2))/(pline{1,i,number}(1,1)-pline{1,i,number}(1,2));
            k2=(pline{1,j,number}(2,1)-pline{1,j,number}(2,2))/(pline{1,j,number}(1,1)-pline{1,j,number}(1,2));
            b1=-k1*pline{1,i,number}(1,2)+pline{1,i,number}(2,2);
            b2=-k2*pline{1,j,number}(1,2)+pline{1,j,number}(2,2);
            if (pline{1,i,number}(1,1)-pline{1,i,number}(1,2))==0 && (pline{1,j,number}(1,1)-pline{1,j,number}(1,2))==0
                continue;
            elseif i==j || (atan(k1)-atan(k2))<10*pi/180
                continue;
            elseif (pline{1,i,number}(1,1)-pline{1,i,number}(1,2))==0
                crossx(1,k,number)=pline{1,i,number}(1,1);
                crossy(1,k,number)=k2*crossx(1,k,number)+b2;
                k=k+1;
            elseif (pline{1,j,number}(1,1)-pline{1,j,number}(1,2))==0
                crossx(1,k,number)=pline{1,j,number}(1,1);
                crossy(1,k,number)=k1*crossx(1,k,number)+b1;
                 k=k+1;
            else
               crossx(1,k,number)=(b2-b1)/(k1-k2);
               crossy(1,k,number)=k1*crossx(1,k,number)+b1;
               k=k+1;
            end
        end
    end
    if k==1
        crossx(1,:,number)=0;
        crossy(1,:,number)=0;
    end
    x=find(crossx(1,:,number)~=0)
    y=find(crossy(1,:,number)~=0)
    [m,sizex]=size(x);
    [n,sizey]=size(y);
    sumx=1;
    sumy=1;
    for i=1:sizex
        sumx=sumx+crossx(1,x(i),number);
    end
    for i=1:sizey
        sumy=sumy+crossy(1,y(i),number);
    end 
    averx=sumx/sizex;
    avery=sumy/sizey;
    X(1,number)=round(averx);
    Y(1,number)=round(avery);
end
            
            
            
            