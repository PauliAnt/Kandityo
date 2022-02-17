
c = fftshift(fft(price));

mid = 1256193   ;
n1 = 5;

c_new1 = zeros(size(c));
c_new1(mid-n1:mid+n1) = c(mid-n1:mid+n1);
plot(abs(c_new1([1:(mid-1),(mid+1):end])))
A = ifft(ifftshift(c_new1));

figure
plot(price)
hold on 
plot(A)
hold off
