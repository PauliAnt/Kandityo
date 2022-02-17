f = @(t) t.^2-sin(t).*t+5*t

fplot(f,[-20,10])

t = linspace(-20,10,1001);

ft = f(t);


c = fftshift(fft(ft));

d = [];
for ii = [1:length(c)/2]
      c_new = zeros(size(c));
      c_new(ii:end-ii) = c(ii:end-ii);
      d(end+1) = sum((c-c_new).^2);
end

plot(abs(d(end:-1:1)))