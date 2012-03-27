clear
image=imread('circle.png');
image=rgb2gray(image);
[m,n]=size(image);
bw=edge(image,'sobel');
se=strel('disk',3);
bw2=imdilate(bw,se);
sum=0;
p=1;
rmin=47;
rmax=53;
for i=1:m
    for j=1:n
        if bw2(i,j)==1
            sum=sum+1;
            black(1,p)=i;
            black(2,p)=j;
            p=p+1;
        end
    end
end
a1=[];
a2=[];
valid=[];
q=1;
for r=rmin:rmax
    sum1=1;
    for b=1:m
        for p=1:sum
            if r^2-(black(1,p)-b)^2>=0
            a1(p,b,r-rmin+1)=black(2,p)-sqrt(r^2-(black(1,p)-b)^2);
            a2(p,b,r-rmin+1)=black(2,p)+sqrt(r^2-(black(1,p)-b)^2);
            if round(a1(p,b,r-rmin+1))==a1(p,b,r-rmin+1) & a1(p,b,r-rmin+1)>=0
                valid(1,q)=a1(p,b,r-rmin+1);
                valid(2,q)=b;
                valid(3,q)=r;
                q=q+1;
                sum1=sum1+1;
            end
            if round(a2(p,b,r-rmin+1))==a2(p,b,r-rmin+1) & a2(p,b,r-rmin+1)>=0
                valid(1,q)=a2(p,b,r-rmin+1);
                valid(2,q)=b;
                valid(3,q)=r;
                q=q+1;
                sum1=sum1+1;
            end
            end
        end
    end
    accumulator(r-rmin+1)=sum1;
end
[accumulatorsum,index]=max(accumulator);
R=index+rmin-1;
[xindex,yindex]=size(valid);
p=1;
cacculator=[];
for q=1:yindex
    if valid(3,q)==R
        cacculator(1,p)=valid(1,q);
        cacculator(2,p)=valid(2,q);
        p=p+1;
    end
end
answer=mean(cacculator,2);
