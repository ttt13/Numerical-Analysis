
tic
a = 0; % Interval a
b = 3; % Interval b
n = 0;
m = 10000;
x = 0; % Use for bisection
y = 0; % Use for bisection
ii = 1;
while n < m
   if bessely(0,a) * bessely(0,b) < 0
       n = n+1;
       x = a;
       y = b;
       while abs(y-x) > 1e-10 % eps*abs(y)
         mid = (x + y)/2;
         
         if sign( bessely(0,mid) ) == sign(bessely(0,y))
            y = mid;
         else
            x = mid;
         end
        % k = k + 1;
       end
        zm(ii) = mid; % Vector that keeps track of roots
        ii = ii + 1;
   end
   a = a + 3;
   b = b + 3;
end

toc

x = 0.5:0.1:20;

n = bessely(0, x);

plot(x, n);
title('Plot of Bessel Function, Second Kind');

