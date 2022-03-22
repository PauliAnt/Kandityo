function [c_norm,omega] = plot_fourier_components(c,Fs,padding,flag)
%PLOT_FOURIER_COMPONENTS Summary of this function goes here
%   Detailed explanation goes here
if ~exist('Fs','var')
    Fs = 1;
end
    
if ~exist('flag','var')
    flag = 0;
end

L = length(c);
omega = Fs*(0:L/2)/L;
c2 = abs(c/L);
c1 = c2(1:L/2+1);
c1(2:end-1) = 2*c1(2:end-1);
if ~flag
    plot(omega,c1)
end
c_norm = c1;
end

