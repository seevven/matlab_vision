clear
image=imread('crosscircle.png');
image=rgb2gray(image);
[m,n]=size(image);
bw=edge(image,'sobel');
se=strel('disk',1);
bw=imdilate(bw,se);
[L,num]=bwlabel(bw,4);
ma=180;
md=round(sqrt(m^2+n^2));
thresh=150;
ruthta=zeros(md,ma,num);
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
answer=cell(1,1);
for k=1:num
    answer{k,1}=[];
end
for i=1:num
    answermax(1,i)=max(max(ruthta(:,:,i)));
    if answermax(1,i)>=thresh
        answer{i,1}='cross';
    end
    if answermax(1,i)<thresh
        answer{i,1}='circle';
    end
end
