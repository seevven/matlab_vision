function pline = draw( im )
%�ú���ʵ�ָ����һ��ֱ���ϵ����꣬�����ֱ�ߵĲ������ֱ�ߵĹ��ܡ�
y=im(1,:);
x=im(2,:);
mx=max(x);
my=max(y);
nx=min(x);
ny=min(y);
cx=mean(x);
cy=mean(y);
xx=x-cx;
yy=y-cy;
a=sum(xx.^2)-sum(xx)^2;
b=sum(xx.*yy)-sum(xx)*sum(yy);
c=sum(yy.^2)-sum(yy)^2;
Vs=(a+c)/2+sqrt((a-c)^2/4+b^2);
if abs((Vs-a)/(b+eps))<=1
    my=floor(cy+(Vs-a)/(b+eps)*(mx-cx));
    ny=floor(cy+(Vs-a)/(b+eps)*(nx-cx));
else
    mx=floor(cx+b/(Vs-a+eps)*(my-cy));
    nx=floor(cx+b/(Vs-a+eps)*(ny-cy));
end
line([nx,mx],[ny,my]);
pline=[[nx,ny]',[mx,my]'];
hold on;
end

