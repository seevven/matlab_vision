clear
rgb=imread('test.png');
m=size(rgb,1);
n=size(rgb,2);
h=zeros(m,n);
for i=1:m
    for j=1:n
        H=max(rgb(i,j,:));
        L=min(rgb(i,j,:));
        R=rgb(i,j,1);
        G=rgb(i,j,2);
        B=rgb(i,j,3);
        if R>=G>=B
            h(i,j)=60*(G-L)/(H-L);
        end
        if G>=R>=B
            h(i,j)=60*(1+(R-L)/(H-L));
        end
        if G>=B>=R
            h(i,j)=60*(2+(B-L)/(H-L));
        end
        if B>=G>=R
            h(i,j)=60*(3+(G-L)/(H-L));
        end
        if B>=R>=G
            h(i,j)=60*(4+(R-L)/(H-L));
        end
        if R>=B>=G
            h(i,j)=60*(5+(B-L)/(H-L));
        end
    end
end