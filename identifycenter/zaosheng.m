[m n]=size(bw);
[cA1,cH1,cV1,cD1] = dwt2(bw,'bior3.7');
th=0.9;
cH=abs(cH1)-th;    %让矩阵取绝对值减去阈值
cH1=(cH>0).*cH1;   % cH元素>0则其为1，否则为0，再与原来的矩阵.*即可。
cV=abs(cV1)-th;  cV1=(cV>0).*cV1;
cD=abs(cD1)-th;  cD1=(cD>0).*cD1;
Xn= idwt2(cA1,cH1,cV1,cD1,'bior3.7');
figure(1);
subplot(121);imshow(bw);
subplot(122);imshow(Xn);
