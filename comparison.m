%% IBM

close all
clearvars
clc

data = readmatrix("IBM.csv");
X = data(1:end-1,2)
t = [1:length(X)]
% padding
padsize = round(length(X)/2)
X = [ones([padsize,1])*X(1);X;ones([padsize,1])*X(end)]

save IBM.mat X t







%%
close all
clearvars
clc
tick_size = 12;
fontsize = 18;
olive = "#556b2f";
dpurp = "#540073";

load IBM

padsize = round(length(t)/2)



L = length(X)

figure(1)
h=plot(t,X(padsize+1:end-padsize))
[X_F,c_new] = filterNoiseAmplitudeThreshold(X,0.3);
hold on
plot(t,X_F(padsize+1:end-padsize),'LineWidth',1)
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
X_F = filterNoiseFrequencyThreshold(X,30,L);
figure(1)
hold on
plot(t,X_F(padsize+1:end-padsize),'Color',olive,'LineWidth',1)

% lowpass

X_F = filterNoiseScale(X',0.015,L);
plot(t,X_F(padsize+1:end-padsize),'Color',dpurp,'LineWidth',1)
hold off
ax = gca;
ax.FontSize = tick_size;
xlabel("$$t(h)$$","Interpreter","latex","FontSize",fontsize)
ylabel("Amplitude","Interpreter","latex","FontSize",fontsize)