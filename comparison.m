%% IBM

close all
clearvars
clc

data = readmatrix("IBM.csv");
X = data(:,2)
save IBM.mat X

%%
close all
clearvars
clc
tick_size = 12;
fontsize = 18;
olive = "#556b2f";
dpurp = "#540073";

load IBM

t = [1:length(X)]

figure(1)
h=plot(t,X)
[X_F,c_new] = filterNoiseAmplitudeThreshold(X,0.8);
hold on
plot(t,X_F,'LineWidth',1)
hold off
figure
c = fft(X)
[c_norm,omega] = plot_amplitude_spectrum(abs(c),1/(60*60),1);
plot(omega(2:end),c_norm(2:end))
ax = gca;
ax.FontSize = tick_size;
xlabel("$$\omega$$","Interpreter","latex","FontSize",fontsize)
ylabel("$$|\hat{f}(\omega)|$$","Interpreter","latex","FontSize",fontsize)


% Frequency cut off
X_F = filterNoiseFrequencyThreshold(X,10);
figure(1)
hold on
plot(t,X_F,'Color',olive,'LineWidth',1)

% lowpass

X_F = filterNoiseScale(X',0.015);
plot(t,X_F,'Color',dpurp,'LineWidth',1)
hold off
ax = gca;
ax.FontSize = tick_size;
xlabel("$$t(h)$$","Interpreter","latex","FontSize",fontsize)
ylabel("Amplitude","Interpreter","latex","FontSize",fontsize)