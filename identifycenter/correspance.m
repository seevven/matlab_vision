function [ r ] = correspance(A,B)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

siz=length(find(A~=0));
A=A(1:siz);                                                      %discard the 0 element
B=B(1:siz);
x=corrcoef(A,B);
r=x(1,2);
end

