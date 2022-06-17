% function to compute fval,jac
function [fval,jac] = myFun30(X,xC,rL)

%% Defining xM and F
xM=X(1);
F=X(2);

%% Feeding machine parameters to the function
x1=0.093;
rS=0.062;
rR=0.07;

%% Computing the constants
[C1,C2,C3,C4,C5,C6,C7,C8,D1,D2,D3,D4,D5] = myFun10(x1,xC,rL,rS,rR);

%% Define fval
f=(C1*xM+C2)*F^3 + (C3*xM+C4)*F^2 + (C5*xM+C6)*F + (C7*xM+C8);
g=(D1*xM+D2)*F^2 + (D3*xM+D4)*F + D5;
fval(1,1)=f;
fval(2,1)=g;

%% Define jacobian
jac=[(C1*F^3 + C3*F^2 + C5*F + C7),(3*(C1*xM+C2)*F^2 + 2*(C3*xM+C4)*F + (C5*xM+C6));
    (D1*F^2 + D3*F),(2*(D1*xM+D2)*F + (D3*xM+D4))];

end
