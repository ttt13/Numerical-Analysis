clear
T = 200;
h = 0.0005;
N = T/h;
t = 0:h:200;
e = 0.6;
q1(1) = 1 - e;
q2(1) = 0;
p1(1) = 0;
p2(1) = sqrt((1 + e)/(1 - e));

q(1:2,1) = [q1(1), q2(1)]';
p(1:2,1) = [p1(1), p2(1)]';
qp(1:2,1) = p(1:2,1);
pp(1:2,1) = -(q(1:2,1)/((q(1,1)^2) + (q(2,1)^2))^(3/2));

qs1(1) = 1 - e;
qs2(1) = 0;
ps1(1) = 0;
ps2(1) = sqrt((1 + e)/(1 - e));

qs(1:2,1) = [qs1(1), qs2(1)]';
ps(1:2,1) = [ps1(1), ps2(1)]';

qs(1:2,2) = (qs(1:2,1) + h*ps(1:2,1));
ps(1:2,2) = ps(1:2,1) - ((h*qs(1:2,2))/(qs(1,2)^2 + qs(2,2)^2)^(3/2));

for i = 2:N
    
    p(1:2,i) = p(1:2, i - 1) + h*(pp(1:2, i - 1));
    qp(1:2,i) = p(1:2,i);

    q(1:2,i) = q(1:2, i - 1) + h*(qp(1:2, i - 1));
    pp(1:2,i) = -(q(1:2,i)/((q(1,i)^2) + (q(2,i)^2))^(3/2));

    qs(1:2,i+1) = qs(1:2,i) + h*ps(1:2,i);
    ps(1:2,i+1) = ps(1:2,i) - ( ( h*qs(1:2,i+1) )/( qs(1,i+1)^2 + qs(2,i+1)^2 )^(3/2) );    
end
figure(1)
plot(q(1,1:N),q(2,1:N))
hold on
plot(qs(1,1:N),qs(2,1:N), 'LineWidth', 2, 'color', 'r')

for i = 1:N
    at(i) = ( q(1,i)*p(2,i) - q(2,i)*p(1,i) );
    ht(i) = 0.5*( p(1,i)^2 + p(2,i)^2 ) - (1/( sqrt(q(1,i)^2 +q(2,i)^2) ) );
    
    As(i) = (qs(1,i)*ps(2,i) - qs(2,i)*ps(1,i));
    Hs(i) = 0.5*(ps(1,i)^2 + ps(2,i)^2) - (1/( sqrt(qs(1,i)^2 + qs(2,i)^2) ));
end

figure(2)
plot(1:N, at(1:N), 'LineWidth', 2);
hold on
plot(1:T/h, As(1:T/h), 'LineWidth', 2);

figure(3)
plot(1:N, ht(1:N), 'LineWidth', 2);
hold on
plot(1:T/h, Hs(1:T/h), 'LineWidth', 2);

