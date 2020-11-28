function [W,E_W] = Code4_BW(Etot,alpha,tol)

% Input Arguments: Etot = Total Energy
%                  Alpha = Multiplying Factor
%                  tol = Error Tolerance
% Output Arguments: W = Essential Bandwidth in radians per second
%                   E_W = Fraction of total Energy

W = 0;
step = 2*pi/Etot;
X_w = inline('(tau*sinc(omega*tau/(2*pi))).^2','omega','tau');
E = alpha*Etot;
relerr = (E-0)/E;
while (abs(relerr)>tol)
    if (relerr>0)
        W = W + step;
    elseif (relerr<0)
        step = step/2;
        W = W - step;
    end
    E_W = 1/(2*pi)*quad(X_w,-W,W,[ ],[ ],Etot);
    relerr = (E-E_W)/E;
end

% Type in command window & hit Enter:     [W E_W] = Code4_BW(1,0.9,0.001)  answer
% should be W = 5.3014   & E_W = 0.8997