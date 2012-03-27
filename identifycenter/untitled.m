fx=fc(1);
fy=fc(2);
cx=cc(1);
cy=cc(2);
M=[fx,0,cx;0,fy,cy;0,0,1];
R=Rc_ext;
T=Tc_ext;
  W=[R,T];
W(:,3)=[];
H=M*W;
n=size(Xcircle,2);
dst=cell(n,1);
 for i=1:n
     dst{i,1}=[];
 end
for i=1:n
    dst{i,1}=inv(H)*[Xcircle(i);Ycircle(i);1];
    dst{i,1}(1)=dst{i,1}(1)/dst{i,1}(3);
    dst{i,1}(2)=dst{i,1}(2)/dst{i,1}(3);
    dst{i,1}(3)=dst{i,1}(3)/dst{i,1}(3);
end
for i=1:n-1
    distance(i,1)=sqrt((dst{i,1}(1)-dst{i+1,1}(1))^2+(dst{i,1}(2)-dst{i+1,1}(2))^2);
end
distance(n,1)=sqrt((dst{1,1}(1)-dst{n,1}(1))^2+(dst{n,1}(2)-dst{1,1}(2))^2);