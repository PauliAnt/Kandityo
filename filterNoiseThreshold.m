function [X_f] = filterNoiseThreshold(X,level)
%FILTERNOISE_TRESHOLD Summary of this function goes here
%   Detailed explanation goes here
c = fft(X);
threshold = level*max(abs(c));
c(abs(c)<threshold) = 0;
n = sum(abs(c)<threshold);
X_f = ifft(c);
end

