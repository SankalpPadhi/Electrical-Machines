% To analyze the steady state performance of the SEIG
%
%
%% Initializing xM and F
nu=1;
xM0=0.1;
F0=nu;
X0=[xM0;F0];
maxIter=50;
tolX=1e-6*[1;1];
tmnlVol=[0];
xMsat=[0];

%% Defining range of values of shunt capacitor
xCsh=[1.1161,1.2165,1.3387,1.4859];

%% Defining range of values of load
rLoad=[4,4.2,4.4,4.6,4.8,5];

%% Obtaining curve b/w terminal voltage and load for different values of shunt capacitor
for z = 1:length(xCsh)
    xC = xCsh(z);

    % Computing terminal voltage for range of values of load
    for i = 1:length(rLoad)
        rL = rLoad(i);

        % Computation of xM and F using Newton Raphson Method
        X=X0;
        Xold=X0;
        for k=1:maxIter
            [f,j]=myFun30(X,xC,rL);
            X=X-j\f;
            err=abs(X-Xold);
            Xold = X;
            if (err < tolX)
                break;
            end
        end
        xM = X(1);
        F = X(2);

        % Dispaly the values of xM and F
        disp(['Iteration no: ',num2str(i)]);
        disp(['The value of saturated magnetising reactance is ',num2str(xM)]);
        disp(['The value of per unit frequency is ',num2str(F)]);

        % Linearising the non-linear relationship b/w Vg/F and xM in the saturated region and computing Vg
        Vg = F*(1.714-0.4*xM);

        % Computing iS,iR,iL,Vl,Pin,Pout
        [iS,iR,iL,Vl,Pin,Pout] = myFun20(Vg,F,xC,rL);

        % Display terminal voltage
        disp(['The value of terminal voltage is ',num2str(abs(Vl))]);

        % Storing values of terminal voltage and saturated magnetising
        % reactance in  vectors named tmnlVol and xMsat respectively
        tmnlVol = [tmnlVol,abs(Vl)];
        xMsat=[xMsat,xM];

    end

    % Plotting results
    plot(rLoad,tmnlVol(2:end),'--g')
    xlabel('load in p.u');ylabel('terminal voltage in p.u');
    title('Variation of terminal voltage with decreasing load for various range of values of shunt capacitor');
    hold on
    tmnlVol=[0];

end
