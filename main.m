%% FREQUENCY THRESHOLD DATA 1
load data.mat
close all
clc
X = data1_X;
c = fft(X)
plot_amplitude_spectrum(c);
[X_f,c_new] = filterNoiseFrequencyThreshold(X,0.03);
figure
plot_amplitude_spectrum(c_new);
figure
plot(X_f)
hold on
plot(data1_f)
hold off

1/1000^2*sum((abs(c)-abs(c_new)).^2)

%% AMPLITUDE DATA 1
close all
clc
clearvars
load data.

% DATA 1
X = data1_X;
c = fft(X);
plot_amplitude_spectrum(c);
[X_f,c_new] = filterNoiseAmplitudeThreshold(X,0.5);
figure
plot_amplitude_spectrum(c_new);
figure
plot(X_f)
hold on
plot(data1_f)
hold off

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
[X_f,c_new] = filterNoiseAmplitudeThreshold(X,0.08);
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