function [X_f,c] = filterNoiseAmplitudeThreshold(X,level)
%FILTERNOISE_TRESHOLD Summary of this function goes here
%   Detailed explanation goes here
c = fft(X);
L = length(c);
threshold = level*length(c)/2;
c(abs(c)<threshold) = 0;
n = sum(abs(c)<threshold);
X_f = ifft(c);
end

