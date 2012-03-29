function [setx,sety ] = findset( L ,num)
%This function find the coordinates of differents section,then put them into setx and sety.

%Setx has num line,denotes different section.
%Same to sety.
[m,n]=size(L);
setx=zeros(num,n);
sety=zeros(num,n);
siz=zeros(num,1);
for k=1:num
    p=1;
    for i=1:m
        for j=1:n
            if L(i,j)==k
                setx(k,p)=i;
                sety(k,p)=j;
                p=p+1;
            end
        end
    end
end
end

    


