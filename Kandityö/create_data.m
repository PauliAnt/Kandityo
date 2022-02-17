f = @(x) 2*sin(x).^2+cos(4*x)+1/10*x.^3;
t = linspace(-5,5,1000);
fi = f(t);
e = randn(size(fi));
X = fi + e;
save data.mat X fi e