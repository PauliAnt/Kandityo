load data.mat
close all

[X_f,c,c_new] = filterNoiseCut(X,0.04);

figure
plot(X)
hold on
plot(X_f,'LineWidth',2)
plot(fi,'LineWidth',2)
hold off

figure

plot(abs(fftshift(c)))
hold on
plot(abs(fftshift(c_new)))
hold off
