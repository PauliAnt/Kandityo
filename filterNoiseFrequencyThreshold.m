function [X_f,c_new] = filterNoiseFrequencyThreshold(X,cutoff)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

c = fftshift(fft(X));
x_m = ceil((length(c)+1)/2)
N = round(cutoff/2*length(c))
c_new = zeros(size(c));
c_new(x_m-N:x_m+N) = c(x_m-N:x_m+N);
X_f = ifft(ifftshift(c_new));
% Standardize outputs
c = ifftshift(c);
c_new = ifftshift(c_new);

end

