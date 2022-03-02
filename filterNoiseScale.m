function [X_f,c] = filterNoiseScale(X,gamma)
cauchy = @(x) gamma^2./(x.^2+gamma^2);
c = fftshift(fft(X));
omega = linspace(-1,1,length(c));
c = cauchy(omega).*c;
X_f = real(ifft(ifftshift(c)));
c = ifftshift(c);


end

