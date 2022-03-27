function [X_f,c] = filterNoiseAmplitudeThresholdPadding(X,level,pad)
%FILTERNOISE_TRESHOLD Summary of this function goes here
%   Detailed explanation goes here
L = length(X)
if ~exist('pad','var')
    pad = 2*L
end
c = fft(X,2*L);
threshold = level*L/2;
c(abs(c)<threshold) = 0;
n = sum(abs(c)<threshold);
X_f = ifft(c,2*L);
X_f = X_f(1:L);
end

