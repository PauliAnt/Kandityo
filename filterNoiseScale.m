function [X_f,c] = filterNoiseScale(X,gamma)
cauchy = @(x) gamma^2./(x.^2+gamma^2);

L = length(X);
pad = 2*L;

c = fftshift(fft(X,pad));
omega = linspace(-1,1,length(c));
c = cauchy(omega).*c;
X_f = real(ifft(ifftshift(c),pad));
X_f = X_f(1:L);
c = ifftshift(c);


end

