close all
rng(222)
fontsize = 17

%% DATASET 1
%close all
N1 = 1000
t = linspace(0,1,N1);
omega1 = 19
omega2 = 29
f = 1/3*sin(omega1*2*pi*t)+1/2*cos(omega2*2*pi*t)
h1 = plot(t,f)
xlabel("t($$s$$)","Interpreter","latex","FontSize",fontsize)
ylabel("Amplitude","Interpreter","latex","FontSize",fontsize)

figure
[c,omega] = plot_amplitude_spectrum(fft(f),1000)

% noise
e = randn(1,N1);
X = f+e;
figure
h3 = plot(t,X);
xlabel("$$t(s)$$","Interpreter","latex","FontSize",fontsize)
ylabel("Amplitude","Interpreter","latex","FontSize",fontsize)
figure
[c,omega] = plot_amplitude_spectrum(fft(X),1000)
data1_X = X;
data1_f = f;
data1_e = e;
data1_t = t;
%% DATASET 2
%close all
N2 = 1000
t = linspace(0,1,N2);
f = -70*t.^4+120*t.^3-60*t.^2+12*t;
plot(t,f)
xlabel("$$t(s)$$","Interpreter","latex","FontSize",fontsize)
ylabel("Amplitude","Interpreter","latex","FontSize",fontsize)
figure
[c,omega]=plot_amplitude_spectrum(fft(f),1000);
plot(omega,c)

% noise
e = randn(1,N2);
X = f+e;
figure
h3 = plot(t,X);
xlabel("$$t(s)$$","Interpreter","latex","FontSize",fontsize)
ylabel("Amplitude","Interpreter","latex","FontSize",fontsize)
figure
[c,omega] = plot_amplitude_spectrum(fft(X),1000,true);
h4 = plot(omega,c);


data2_X = X;
data2_f = f;
data2_e = e;
data2_t = t;

%% save
save data.mat data1_X data1_f data1_e data1_t data2_X data2_f data2_e data2_t