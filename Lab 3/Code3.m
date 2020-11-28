X_w = inline('tau*sinc(omega*tau/(2*pi)).^2','omega','tau');
quad(X_w,-1e6,1e6,[],[],1)    % doc quad
