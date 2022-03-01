%% FREQUENCY THRESHOLD DATA 1
close all
clc
clearvars
load data.mat
X = data1_X;
c = fft(X)
plot_amplitude_spectrum(c);
[X_f,c_new] = filterNoiseFrequencyThreshold(X,50);
figure
plot_amplitude_spectrum(c_new);
figure
plot(X_f)
hold on
plot(data1_f)
hold off

1/1000^2*sum((abs(c)-abs(c_new)).^2)




%% FREQUENCY THRESHOLD DATA 2
close all
clc
clearvars
load data.mat
X = data2_X;
c = fft(X)
plot_amplitude_spectrum(c);
[X_f,c_new] = filterNoiseFrequencyThreshold(X,15);
figure
plot_amplitude_spectrum(c_new);
figure
plot(X_f)
hold on
plot(data2_f)
hold off

1/1000^2*sum((abs(c)-abs(c_new)).^2)


%% AMPLITUDE DATA 1


close all
clc
clearvars
load data.mat
fontsize = 18
% DATA 1
X = data1_X;
t = data1_t
c = fft(X);
plot_amplitude_spectrum(c,1000);
xlabel("$$\omega(Hz)$$","interpreter","latex","FontSize",fontsize)
ylabel("$$|\hat{f}(\omega)|$$","Interpreter","latex","FontSize",fontsize)
hold on 
plot([0,500],[0.20,0.20],'r','LineWidth',2)
hold off
[X_f,c_new] = filterNoiseAmplitudeThreshold(X,0.4);
figure
plot_amplitude_spectrum(c_new);
figure
plot(t,X)
hold on
plot(t,X_f,'LineWidth',2)

hold off

xlabel("$$t(s)$$","Interpreter","latex","FontSize",fontsize)
ylabel("Amplitude","Interpreter","latex","FontSize",fontsize)


figure
plot(t,data1_f,'LineWidth',0.5)
hold on
plot(t,X_f,'r','LineWidth',0.5)
hold off
xlabel("$$t(s)$$","Interpreter","latex","FontSize",fontsize)
ylabel("Amplitude","Interpreter","latex","FontSize",fontsize)

c_orig = fft(data1_f);
eT1 = 1/1000^2*sum((abs(c_orig)-abs(c_new)).^2)
var1 = 1/1000^2*sum((abs(c)-abs(c_new)).^2)

%% AMPLITUDE DATA 2
close all
clc
clearvars
load data.mat

X = data2_X;
t = data2_t
c = fft(X);
plot_amplitude_spectrum(c);
[X_f,c_new] = filterNoiseAmplitudeThreshold(X,0.04);
figure
plot_amplitude_spectrum(c_new);
figure
plot(X_f)
hold on
plot(data2_f)
hold off

c_orig = fft(data2_f);
eT2 = 1/1000^2*sum((abs(c_orig)-abs(c_new)).^2)
var2 = 1/1000^2*sum((abs(c)-abs(c_new)).^2)

%% SCALE COEFICIENTS

close all
clc
clearvars
load data.mat

X = data2_X;
t = data2_t
c = fft(X);
plot_amplitude_spectrum(c);
[X_f,c_new] = filterNoiseScale(X,0.017);
figure
plot_amplitude_spectrum(c_new);
figure
plot(X_f)
hold on
plot(data2_f)
hold off

c_orig = fft(data2_f);
eT2 = 1/1000^2*sum((abs(c_orig)-abs(c_new)).^2)
var2 = 1/1000^2*sum((abs(c)-abs(c_new)).^2)
