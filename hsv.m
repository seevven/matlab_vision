A=imread('purplephoto.JPG');
B=rgb2hsv(A);
H=B(:,:,1);
[m,n]=size(H);
im=zeros(m,n);
figure(1);
for i=1:m
    for j=1:n
        if H(i,j)>=0.7 && H(i,j)<=0.9
            im(i,j)=1;
        end
    end
end
imshow(im);