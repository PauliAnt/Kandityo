function [X_f,c] = filterNoiseAmplitudeThreshold(X,level)
%FILTERNOISE_TRESHOLD Summary of this function goes here
%   Detailed explanation goes here
L = length(X);
c = fft(X);
threshold = level*L/2;
c(abs(c)<threshold) = 0;
n = sum(abs(c)<threshold);
X_f = ifft(c);
X_f = X_f(1:L);
end

