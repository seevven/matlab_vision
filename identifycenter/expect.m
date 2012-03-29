function [aver,v] = parameter( A)
%This function can calculate the average of a vector.

siz=length(find(A~=0));
A=A(1:siz);                                                      %discard the 0 element
aver=mean(A);
v=var(A);
end

