function [ flag ,answer,sectionnum,sectionlabel ,L] = identifypurple( L,num ,thresh,sectiondim,r)
%This function is used to identify different shapes in the image,
%like cross and circle, so that it can choose different Algorithm
%to calculate the center.
%flag return the number of the shape. Cross is 1,cricle is 2.
[m,n]=size(L);
ma=180;
md=round(sqrt(m^2+n^2));
ruthta=zeros(md,ma,num);
%hough�任������ۼ�ֵ����thresh���ж�Ϊֱ�ߣ�����ΪԲ
sectionnum=1;
sectionlabel=zeros(num,1);
for number=1:num
    [c,d]=find(L==number);
    if size(c,1)>sectiondim && abs(r(number))<0.05
       sectionlabel(sectionnum,1)=number;
       sectionnum=sectionnum+1;
    else 
        L(find(L==number))=0;
    end
end
% sectionnum=sectionnum-1;
% for number=1:sectionnum
%     for i=5:m-4
%         for j=5:n-4
%             if L(i,j)==sectionlabel(number,1)
%                 for k=1:ma
%                     ru=round(abs(j*cos(k)+i*sin(k)));
%                     ruthta(ru+1,k,number)=ruthta(ru+1,k,number)+1;
%                 end
%             end
%         end
%     end
% end
% answermax=zeros(1,sectionnum);
% flag=zeros(sectionnum,1);
% answer=cell(1,1);
% for k=1:sectionnum
%     answer{k,1}=[];
% end
% for i=1:sectionnum
%     answermax(1,i)=max(max(ruthta(:,:,i)));
%     if answermax(1,i)>=thresh
%         answer{i,1}='cross';
%         flag(i,1)=1;
%     end
%     if answermax(1,i)<thresh
%         answer{i,1}='circle';
%         flag(i,1)=2;
%     end
% end
% end

