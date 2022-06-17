function [C1,C2,C3,C4,C5,C6,C7,C8,D1,D2,D3,D4,D5] = myFun10(x1,xC,rL,rS,rR)

C1=-2*x1*rL;
C2=-x1^2*rL;
C3=2*x1*rL;
C4=x1^2*rL;
C5=xC*(rS+rR+rL);
C6=xC*x1*(rS+rR+rL)+rL*rR*rS;
C7=-xC*(rS+rL);
C8=-x1*xC*(rS+rL);
D1=2*xC*x1 + rL*(rS+rR);
D2=rL*x1*(rS+rR) + xC^2*x1;
D3=rS*rR+2*x1*xC;
D4=-x1*(rS*rR+2*x1*xC);
D5=-xC*rR*(rS+rL);

end
