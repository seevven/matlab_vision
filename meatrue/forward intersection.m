a1=1;
a2=-k/rou;
a3=-fai/rou;
b1=k/rou;
b2=1;
b3=-omg/rou;
c1=fai/rou;
c2=omg/rou;
c3=1;
X0=1;
Y0=1;
Z0=1;
for i=1:n
    X1=a1*(X0-Xs)+b1*(Y0-Ys)+c1*(Z0-Zs);
    Y1=a2*(X0-Xs)+b2*(Y0-Ys)+c2*(Z0-Zs);
    Z1=a3*(X0-Xs)+b3*(Y0-Ys)+c3*(Z0-Zs);
    a11=(a1*f+a3*(x-x0))/Z1;
    a12=(b1*f+b3*(x-x0))/Z1;
    a13=(c1*f+c3*(x-x0))/Z1;
    a21=(a2*f+a3*(y-y0))/Z1;
    a22=(b2*f+b3*(y-y0))/Z1;
    a23=(c2*f+c3*(y-y0))/Z1;
    x1=x0-f*X1/Z1;
    y1=y0-f*Y1/Z1;
    A=[-a11^2-a21^2,-a11*a12-a21*a22,-a11*a13-a21*a23;
        -a12*a11-a22*a21,-a12^2-a22^2,-a12*a13-a22*a23;
        -a13*a11-a23*a21,-a13*a12-a23*a22,-a12^2-a23^2];
    B=[a11*(x-x1)+a21*(y-y1);a12*(x-x1)+a22*(y-y1);a13*(x-x1)+a23*(y-y1)];
    result=A\B;
    vx=-(a11*detX+a12*detY+a13*detZ)-(x-x1);
    vx=-(a21*detX+a22*detY+a23*detZ)-(y-y1);
    FX=a11*vx+a21*vy;
    FY=a12*vx+a22*vy;
    FZ=a13*vx+a23*vy;
    X0=result(1)+X0;
    Y0=result(2)+Y0;
    Z0=result(3)+Z0;
    if result(1)<0.1 && result(2)<0.1 && result(3)<0.1
        break;
    end
end