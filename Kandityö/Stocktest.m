close all
A = readmatrix('NOK.csv')
price = A(1:end,3)

n_sample = length(price)

N = 630
n1 = 6

c = fftshift(fft(price))
plot(abs(c))
figure
c_new1 = zeros(size(c));
c_new1(N-n1:N+n1) = c(N-n1:N+n1)
A = ifft(ifftshift(c_new1))

std = 0.009

x0 = 0.5
y = 0.005

f = @(x,x0,y) (y^2./((x-x0).^2+y.^2)) 
fplot(@(x) f(x,x0,y),[0,1])
figure

c_new2 = c.*f(linspace(0,1,n_sample)',x0,y);
B = ifft(ifftshift(c_new2));

n2 = 5
c = fft(price)
c_new3 = zeros(size(c));
[~,ind] = sort(-abs(c));
c_new3(ind(1:2*n2+1)) = c(ind(1:2*n2+1));
C = ifft(c_new3)

plot(price)
hold on
plot(A) 
plot(real(B))
plot(real(C))
hold off


legend('Nokia osake 2017-2022','Korkeataajuiset termit pois','Komponenttien pehmennys caychy-jakaumalla','Suurimmat komponentit jätettiin')