%% Amplitude method
close all
clc
clearvars
load data.mat
tick_size = 12

X = data1_X;
c = fft(X)
c_orig = fft(data1_f);

threshold = [0:0.001:1];
eT = [];
diff = [];

for ii = [1:length(threshold)]
   [X_f,c_new] = filterNoiseAmplitudeThreshold(X,threshold(ii));
   eT(ii) = 1/1000^2*sum((abs(c)-abs(c_new)).^2);
   diff(ii) = 1/1000^2*sum((abs(c_orig)-abs(c_new)).^2);
end


%plot(threshold,abs(1-eT))
hold on
plot(threshold./2,diff)
hold off
ax = gca;
ax.FontSize = tick_size;
xlabel("Threshold $|\hat{f}(\omega)|$","interpreter","latex","FontSize",18)
ylabel("d","interpreter","latex","FontSize",18)
%% Frequency threshold
close all
clc
clearvars
load data.mat
fontsize = 18
tick_size = 12


X = data2_X;
c = fft(X)
c_orig = fft(data2_f);


eT = [];
diff = [];
N = [1:100]
for ii = N
   [X_f,c_new] = filterNoiseFrequencyThreshold(X,ii);
   eT(ii) = 1/1000^2*sum((abs(c)-abs(c_new)).^2);
   diff(ii) = 1/1000^2*sum((abs(c_orig)-abs(c_new)).^2);
end

%plot(N,abs(1-eT))
hold on
plot([1:1:100],diff)
hold off
ax = gca;
ax.FontSize = tick_size;
xlabel("Frequency cut off (Hz)","Interpreter","latex","FontSize",fontsize)
ylabel("d","Interpreter","latex","FontSize",fontsize)


%% Scale method

close all
clc
clearvars
load data.mat
tick_size = 12
fontsize = 18

X = data2_X;
c = fft(X)
c_orig = fft(data2_f);


eT = [];
diff = [];
omega = [0.005:0.001:0.2]
for ii = [1:length(omega)]
   [X_f,c_new] = filterNoiseScale(X,omega(ii));
   eT(ii) = 1/1000^2*sum((abs(c)-abs(c_new)).^2);
   diff(ii) = 1/1000^2*sum((abs(c_orig)-abs(c_new)).^2);
end

%(omega,abs(1-eT))
hold on
plot(omega,diff)
hold off
ax = gca;
ax.FontSize = tick_size;
xlabel("$$\gamma$$","Interpreter","latex","FontSize",fontsize)
ylabel("d","Interpreter","latex","FontSize",fontsize)


