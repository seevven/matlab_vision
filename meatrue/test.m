FX='x+y+z-1=0';
    FY='x+2*y+z-2=0';
    FZ='x+y-z=0';
    S=solve(FX,FY,FZ,'x,y,z');
    result=[S.x,S.y,S.z]