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

1/1000^2*sum((abs(c)-abs(c_new))).^2




%% FREQUENCY THRESHOLD DATA 2
close all
clc
clearvars
load data.mat
fontsize = 18;
tick_size = 12;
X = data2_X;
c = fft(X);
plot_amplitude_spectrum(c,1000);
hold on
plot([7,7],[0,2],'r','LineWidth',2)
ax = gca;
ax.FontSize = tick_size;
xlabel("$$\omega$$(Hz)","interpreter","latex","FontSize",fontsize)
ylabel("$$|\hat{f}(\omega)|$$","Interpreter","latex","FontSize",fontsize)
hold off
[X_f,c_new] = filterNoiseFrequencyThreshold(X,6);
figure
plot_amplitude_spectrum(c_new);
figure
t = data2_t
plot(t,X_f)
hold on
plot(t,data2_f)
hold off
ax = gca;
ax.FontSize = tick_size;
xlabel("$$t(s)$$","Interpreter","latex","FontSize",fontsize)
ylabel("Amplitude","Interpreter","latex","FontSize",fontsize)

figure

figure
plot(t,X)
hold on
plot(t,X_f,'r','LineWidth',2)
hold off
ax = gca;
ax.FontSize = tick_size;
xlabel("$$t(s)$$","Interpreter","latex","FontSize",fontsize)
ylabel("Amplitude","Interpreter","latex","FontSize",fontsize)



1/1000^2*sum((abs(c)-abs(c_new)).^2)


%% AMPLITUDE DATA 1


close all
clc
clearvars
load data.mat
fontsize = 18
tick_size = 12
% DATA 1
X = data1_X;
t = data1_t
c = fft(X);
plot_amplitude_spectrum(c,1000);
ax = gca;
ax.FontSize = tick_size;
xlabel("$$\omega$$(Hz)","interpreter","latex","FontSize",fontsize)
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

ax = gca;
ax.FontSize = tick_size;
xlabel("$$t(s)$$","Interpreter","latex","FontSize",fontsize)
ylabel("Amplitude","Interpreter","latex","FontSize",fontsize)



figure
plot(t,data1_f,'LineWidth',0.5)
hold on
plot(t,X_f,'r','LineWidth',0.5)
hold off
ax = gca;
ax.FontSize = tick_size;
xlabel("$$t(s)$$","Interpreter","latex","FontSize",fontsize)
ylabel("Amplitude","Interpreter","latex","FontSize",fontsize)


c_orig = fft(data1_f);
d1 = 1/1000^2*sum((abs(c_orig)-abs(c_new)).^2)
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
[X_f,c_new] = filterNoiseAmplitudeThreshold(X,0.043)
figure
plot_amplitude_spectrum(c_new);
figure
plot(X_f)
hold on
plot(data2_f)
hold off

c_orig = fft(data2_f);
d2 = 1/1000^2*sum((abs(c_orig)-abs(c_new)).^2)
var2 = 1/1000^2*sum((abs(c)-abs(c_new)).^2)

%% SCALE COEFICIENTS data 2

close all
clc
clearvars
load data.mat

fontsize = 18;
tick_size = 12;

X = data2_X;
t = data2_t
c = fft(X);
plot_amplitude_spectrum(c);
[X_f,c_new] = filterNoiseScale(X,0.011);
figure
plot_amplitude_spectrum(c_new);
figure
t = data2_t
plot(t,X_f)
hold on
plot(t,data2_f)
hold off
ax = gca;
ax.FontSize = tick_size;
xlabel("$$t(s)$$","Interpreter","latex","FontSize",fontsize)
ylabel("Amplitude","Interpreter","latex","FontSize",fontsize)

figure
plot(t,X)
hold on
plot(t,X_f,'r','LineWidth',2)
hold off
ax = gca;
ax.FontSize = tick_size;
xlabel("$$t(s)$$","Interpreter","latex","FontSize",fontsize)
ylabel("Amplitude","Interpreter","latex","FontSize",fontsize)

c_orig = fft(data2_f);
d2 = 1/1000^2*sum((abs(c_orig)-abs(c_new)).^2)
var2 = 1/1000^2*sum((abs(c)-abs(c_new)).^2)


%% SCALE COEFICIENTS data 1

close all
clc
clearvars
load data.mat

X = data1_X;
t = data1_t
c = fft(X);
plot_amplitude_spectrum(c);
[X_f,c_new] = filterNoiseScale(X,0.075);
figure
plot_amplitude_spectrum(c_new);
figure
plot(X_f)
hold on
plot(data1_f)
hold off

c_orig = fft(data1_f);
d2 = 1/1000^2*sum((abs(c_orig)-abs(c_new)).^2)
var2 = 1/1000^2*sum((abs(c)-abs(c_new)).^2)



%% comparison
close all
clc
clearvars
load data.mat

% ##################### data1 ############################
X1 = data1_X;
c1 = fft(X1);
c_orig1 = fft(data1_f);

% Amplitude thresholding
[X_f,c_new] = filterNoiseAmplitudeThreshold(X1,0.4);

d(1,1) = 1/1000^2*sum((abs(c_orig1)-abs(c_new)).^2);
var2(1,1) = 1/1000^2*sum((abs(c1)-abs(c_new)).^2);

% Frequency cut off
[X_f,c_new] = filterNoiseFrequencyThreshold(X1,29);

d(1,2) = 1/1000^2*sum((abs(c_orig1)-abs(c_new)).^2);
var2(1,2) = 1/1000^2*sum((abs(c1)-abs(c_new)).^2);


% low pass
[X_f,c_new] = filterNoiseScale(X1,0.075);
d(1,3) = 1/1000^2*sum((abs(c_orig1)-abs(c_new)).^2);
var2(1,3) = 1/1000^2*sum((abs(c1)-abs(c_new)).^2);


% ##################### data2 ############################
X2 = data2_X;
c2 = fft(X2);
c_orig2 = fft(data2_f);

% Amplitude thresholding
[X_f,c_new] = filterNoiseAmplitudeThreshold(X2,0.043);

d(2,1) = 1/1000^2*sum((abs(c_orig2)-abs(c_new)).^2);
var2(2,1) = 1/1000^2*sum((abs(c2)-abs(c_new)).^2);

% Frequency cut off
[X_f,c_new] = filterNoiseFrequencyThreshold(X2,6);

d(2,2) = 1/1000^2*sum((abs(c_orig2)-abs(c_new)).^2);
var2(2,2) = 1/1000^2*sum((abs(c2)-abs(c_new)).^2);


% low pass
[X_f,c_new] = filterNoiseScale(X2,0.011);
d(2,3) = 1/1000^2*sum((abs(c_orig2)-abs(c_new)).^2);
var2(2,3) = 1/1000^2*sum((abs(c2)-abs(c_new)).^2);


