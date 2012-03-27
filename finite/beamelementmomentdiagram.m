function y =BeamElementMomentDiagram( f ,t,i)
%BeamElementMomentDiagram      This function plots the bending moment diagram
%                             for the beam element with nodal force vector
%                             f ,time t and point i.
x=t;
y=f(2*i+1,:);
hold on;
grid on;
title('Bending Force Diagram');
xlabel('time');
ylabel('M');
plot(x,y);
z=zeros(1,1376);
plot(x,z,'k');
end

