load data.mat
close all
N = 1000;
Fs = 1000;
sigma = 3;
e = sigma * randn(N,1);
t = linspace(0,1,length(e));
plot(t,e)
figure
c = fftshift(fft(e));
plot(abs(c))

c_norm = plot_amplitude_spectrum(c,1000);

1/N*sum(e.^2)
2*sum(c_norm.^2)
%%
close all
t = [0:0.01:2*pi];
Fs = 1/0.01
f = sin(20*t)+0.3*cos(25*t);
f = f + randn(size(t));

plot(f)
figure
plot_amplitude_spectrum(fft(f),Fs);
