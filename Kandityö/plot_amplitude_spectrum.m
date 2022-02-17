function [c_norm] = plot_fourier_components(c,Fs)
%PLOT_FOURIER_COMPONENTS Summary of this function goes here
%   Detailed explanation goes here
if ~exist('Fs','var')
    Fs = 1;
end
L = length(c);
T = L/Fs
f = Fs*(0:L/2)/L;
c2 = abs(c/L);
c1 = c2(1:L/2+1);
%c1(2:end-1) = c1(2:end-1);

plot(f,c1)
c_norm = c1;
end

