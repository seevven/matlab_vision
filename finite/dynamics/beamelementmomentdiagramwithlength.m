function y = beamelementmomentdiagramwithlength( f,x,t,n )
%BeamElementMomentDiagram      This function plots the bending moment diagram
%                              for the beam element with nodal force vector
%                              f length L and time t.n is the number of
%                              nodes.
y=f(3:2:2*n+1,t);
hold on;
grid on;
title('Bending Force Diagram');
xlabel('length');
ylabel('M');
plot(x,y);
z=zeros(1,n);
plot(x,z,'k');

end

