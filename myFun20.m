function [Is,Ir,Il,Vl,Pin,Pout] = myFun20(Vg,F,xC,rL)

%% Feeding machine parameters to the function
x1=0.093;
rS=0.062;
rR=0.07;

%% Defining p.u speed at which machine is driven
nu=1;

%% Computing various performance parameters
a = rS/F + complex(0,x1) -complex(0,xC*rL)/(F^2*rL - complex(0,F*xC));
b = rR/(F-nu) + complex(0,x1);
c = rL/F -complex(0,xC);
Is = (Vg/F)/a;
Ir = -(Vg/F)/b;
Il = -((complex(0,xC))/c)*Is;
Vl = Il*rL;
Pin = -(3*(abs(Ir))^2*rR*nu)/(F-nu);
Pout = 3*(abs(Il))^2*rL;

end
