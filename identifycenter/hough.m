%hough transform
clear
image=imread('crosscircle.png');
image=rgb2gray(image);
[m,n]=size(image);
bw=edge(image,'sobel');
imshow(bw)
md=round(sqrt(m^2+n^2));
ma=180;
ruthta=zeros(md,ma);
ruthx=cell(1,1);
for i=1:md
    for j=1:ma
        ruthx{i,j}=[];
    end
end
for i=5:m-4
    for j=5:n-4
        if bw(i,j)==1
            for k=1:ma
                ru=round(abs(j*cos(k)+i*sin(k)));
                ruthta(ru+1,k)=ruthta(ru+1,k)+1;
                ruthx{ru+1,k}=[ruthx{ru+1,k},[i,j]'];
            end
        end
    end
end
figure(1)
bw=ones(size(bw));
imshow(bw);
M=10;
pointx=zeros(1,M);
pointy=zeros(1,M);
pline=cell(1,M);
for i=1:M
    [y1,coll]=max(ruthta);
    [y2,row]=max(y1);
    col=coll(row);
    ruthta(col,row)=0;
    N=1;
    if col-N>0 && col+N<md && row-N>0 && row+N<ma
        ruthta(col-N:col+N,row-N:row+N)=0;
    end
    nds=ruthx{col,row};
    pointx(i)=mean(nds(1,:));
    pointy(i)=mean(nds(2,:));
    pline{1,i}=draw(nds);
end
x=mean(pointx);
y=mean(pointy);
crossx=[];
crossy=[];
k=1;
for i=1:M
    for j=1:M
         k1=(pline{1,i}(2,1)-pline{1,i}(2,2))/(pline{1,i}(1,1)-pline{1,i}(1,2));
         k2=(pline{1,j}(2,1)-pline{1,j}(2,2))/(pline{1,j}(1,1)-pline{1,j}(1,2));
         b1=-k1*pline{1,i}(1,2)+pline{1,i}(2,2);
         b2=-k2*pline{1,j}(1,2)+pline{1,j}(2,2);
         if (pline{1,i}(1,1)-pline{1,i}(1,2))==0 && (pline{1,j}(1,1)-pline{1,j}(1,2))==0
             continue;
         elseif i==j || (atan(k1)-atan(k2))<5*pi/180
             continue;
         elseif (pline{1,i}(1,1)-pline{1,i}(1,2))==0
             crossx(1,k)=pline{1,i}(1,1);
             crossy(1,k)=k2*crossx(1,k)+b2;
             k=k+1;
         elseif (pline{1,j}(1,1)-pline{1,j}(1,2))==0
             crossx(1,k)=pline{1,j}(1,1);
             crossy(1,k)=k1*crossx(1,k)+b1;
             k=k+1;
         else
            crossx(1,k)=(b2-b1)/(k1-k2);
            crossy(1,k)=k1*crossx(1,k)+b1;
            k=k+1;
         end
    end
end
X=round(mean(crossx));
Y=round(mean(crossy));
            
            
            
            