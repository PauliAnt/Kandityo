clc
close all
f = @(x) 2*sin(x).^2+cos(4*x)+1/10*x.^3;
t = linspace(-5,5,1000);
fi = f(t);
e = 2*randn(size(fi));
X = fi + e;
X_f = filterNoiseThreshold(X,0.366)

p = 0:0.001:1;
d = zeros(size(p));
N = zeros(size(p));
for ii = [1:length(p)]
    [X_f,n] = filterNoiseThreshold(X,p(ii));
    d(ii) = sum((fi(30:end-10)-X_f(30:end-10)).^2);
    N(ii) = n;
end
plot(p,d)
figure
plot(p,N)

%%
close all
clc
f = @(x) 2*sin(x).^2+cos(4*x)+1/10*x.^3;
t = linspace(-5,5,1000);
fi = f(t);
e = 3*randn(size(fi));
X = fi + e;
X_f = filterNoiseThreshold(X,0.363)


plot(X)
hold on
plot(X_f,'LineWidth',2)
plot(fi,'LineWidth',2)
hold off
legend("data","filtered","original")