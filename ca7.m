clear
funa = @(x) x.^3;
fun1 = @(x) sin(0.5*x);
fun2 = @(x) abs(sin(2*x));
fun3 = @(x) cos(x);
% Interval 1: [0, pi/3]
% Interval 2: [0, 2*pi]
N = 100;
% In 1
realf1i = 0.2679491924311227;
realf2i = 0.750000000000000;
realf3i = sqrt(3)/2;
t1 = integral(fun1, 0, pi/3);
t2 = integral(fun2, 0, pi/3);
t3 = integral(fun3, 0, pi/3);

% In 2
realf1i2 = 4;
realf2i2 = 4; % Not sure if this is right!!
realf3i2 = 0;
t4 = integral(fun1, 0, 2*pi);
t5 = integral(fun2, 0, 2*pi);
t6 = integral(fun3, 0, 2*pi);

for i = 1:N
    % Interval 1
    outputf1i(i) = trapezoidrule(fun1, 0, pi/3, i);
    outputf2i(i) = trapezoidrule(fun2, 0, pi/3, i);
    outputf3i(i) = trapezoidrule(fun3, 0, pi/3, i);
    
    % Interval 2
    outputf1i2(i) = trapezoidrule(fun1, 0, 2*pi, i);
    outputf2i2(i) = trapezoidrule(fun2, 0, 2*pi, i);
    outputf3i2(i) = trapezoidrule(fun3, 0, 2*pi, i);
    
    errorf1i(i) = abs(realf1i - outputf1i(i));
    errorf2i(i) = abs(realf2i - outputf2i(i));
    errorf3i(i) = abs(realf3i - outputf3i(i));
    
    errorf1i2(i) = abs(realf1i2 - outputf1i2(i));
    errorf2i2(i) = abs(realf2i2 - outputf2i2(i));
    errorf3i2(i) = abs(0 - outputf3i2(i));
end 

figure(1);
loglog(1:N, errorf1i(1:N), '*', 'markers', 8);
hold on
loglog(1:N, errorf2i(1:N), '*', 'markers', 8);
loglog(1:N, errorf3i(1:N), '*', 'markers', 8);

figure(2);
loglog(1:N, errorf1i2(1:N), '*', 'markers', 5, 'color', 'k');
hold on
loglog(1:N, errorf2i2(1:N), '^', 'markers', 4, 'color', 'm');
loglog(1:N, errorf3i2(1:N), '*', 'markers', 5, 'color', 'r');
pf1i = polyfit(log(1:N), log(errorf1i), 1);
pf2i2 = polyfit(log(1:N), log(errorf2i2), 1);
pf3i2 = polyfit(log(1:N), log(errorf3i2), 1);
outputx3 = trapezoidrule(funa, 0, 1, 100);
