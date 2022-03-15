%% Amplitude
close all
fontsize = 18
tick_size = 12

t = [0:0.001:1]
f = sin(50*2*pi*t)+3*cos(87*2*pi*t)+2*sin(221*2*pi*t);
e = 3*randn(1,1001);
plot(f+e)
fig = figure
c = fftshift(fft(f+e));
plot_amplitude_spectrum(fft(f+e),1000)
hold on
h = plot([0,500],[0.51,0.51],'LineWidth',2)
ax = gca;
ax.FontSize = tick_size;
xlabel("$$\omega$$","Interpreter","latex","FontSize",fontsize)
ylabel("$$|\hat{f}(\omega)|$$","Interpreter","latex","FontSize",fontsize)
hold off

%%
close all
x = [0:0.001:1]
f = x.^2
e = 0.15*randn(size(f))
plot(f+e)
figure
plot_amplitude_spectrum(fft(f+e))
hold on
plot([0.042,0.042],[0,0.35],'LineWidth',2)
ax = gca;
ax.FontSize = tick_size;
xlabel("$$\omega$$","Interpreter","latex","FontSize",fontsize)
ylabel("$$|\hat{f}(\omega)|$$","Interpreter","latex","FontSize",fontsize)


%% WHITE NOISE SPECTRUM


%% Decay
close all
C = 100
p = 2

f = @(x) C*abs(x).^-p 
x = [0:500]

plot(x,f(x))
ylim([0,1])
xlim([0,500])
ax = gca;
ax.FontSize = tick_size;
xlabel("$$\omega$$","Interpreter","latex","FontSize",fontsize)
ylabel("$$|\hat{f}(\omega)|$$","Interpreter","latex","FontSize",fontsize)


%% SIN AND COS 
close all
x = linspace(0,1,1000);
f = sin(27*2*pi*x)+2*cos(57*2*pi*x)+3*sin(97*2*pi*x);
plot(f)
plot_amplitude_spectrum(fft(f),1000)
ax = gca;
ax.FontSize = tick_size;
xlabel("$$\omega$$","Interpreter","latex","FontSize",fontsize)
ylabel("$$|\hat{f}(\omega)|$$","Interpreter","latex","FontSize",fontsize)


