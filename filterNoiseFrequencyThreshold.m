function [X_f,c_new] = filterNoiseFrequencyThreshold(X,N)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
L = length(X)
pad = 2*L

c = fftshift(fft(X,pad));
x_m = ceil((length(c)+1)/2);
c_new = zeros(size(c));
c_new(x_m-N:x_m+N) = c(x_m-N:x_m+N);
X_f = ifft(ifftshift(c_new),pad);
X_f = X_f(1:L);
% Standardize outputs
c = ifftshift(c);
c_new = ifftshift(c_new);

end

