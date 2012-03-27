tic
clear
clc
A=imread('purplephotosmall.png');
B=rgb2hsv(A);
H=B(:,:,1);
[m,n]=size(H);
im=zeros(m,n);
for i=1:m
    for j=1:n
        if H(i,j)>=0.7 && H(i,j)<=0.9
            im(i,j)=1;
        end
    end
end
bw=edge(im,'sobel');
se=strel('disk',1);
bw=imdilate(bw,se);
[L,num]=bwlabel(bw,4);                                  %��ͬ�ĵ�ͼ�μӱ�ǩ1~N
thresh=100;                                             %���ʮ�ֺ�Բ�ķ�ֵ��hough�任��
sectiondim=50;
[flag,shape,sectionnum,sectionlabel]=identifypurple(L,num,thresh,sectiondim);                    %ʶ��ͬͼ�ε���״
[Xcross,Ycross]=houghcross(L,flag ,sectionnum,sectionlabel);                %�ҵ�ʮ�ֵĽ���
[Xcircle,Ycircle]=houghcircle(L,flag,sectionnum,sectionlabel);%�ҵ�Բ��
toc
