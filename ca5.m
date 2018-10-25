clear
grid = -1:0.01:1;

for n = 1:100
    xi = zeros(n+1,1);
    xii = zeros(n+1,1);
    for i = 0:n % Evenly spaced nodes
        xi(i+1) = (-1)+( (2*i)/n);
    end
    
    for i = 0:n % Chebyshev spaced nodes
        xii(i+1) = cos(i*pi/n);
        weightzchev(i+1) = (-1)^i;
    end
    weightzchev(1) = 0.5;
    weightzchev(n+1) = (0.5)*(-1)^n;

    weightz = baryweights(xi);
    
    f1grid = zeros(1,201); % Actual data
    f2grid = zeros(1,201);
    c3grid = zeros(1,201); % originally n
    
    f1xi = zeros(n+1,1); % Y Values
    f2xi = zeros(n+1,1);
    c1xi = zeros(n+1,1);
    c2xi = zeros(n+1,1);
    c3xi = zeros(n+1,1);
    
    for i = 1:n+1
        f1xi(i) = 1/abs(5-4*xi(i));
        f2xi(i) = exp(-5*xi(i)^2); %exp((-5)*(xi(i)^2)); % Squared
        
        c1xi(i) = 1/abs(5-4*xii(i));
        c2xi(i) = exp(-5*xii(i)^2); %exp((-5)*(xi(i)^2)); % Squared
        c3xi(i) = cos((10^4)*xii(i));
    end

    lf1 = baryinterp(xi, weightz, f1xi, grid); % Interp f1 even
    lf2 = baryinterp(xi, weightz, f2xi, grid); % Interp f2 even
    
     cf1 = baryinterp(xii, weightzchev', c1xi, grid);
     cf2 = baryinterp(xii, weightzchev', c2xi, grid);
     cf3 = baryinterp(xii, weightzchev', c3xi, grid);
     
    counter = 0;

    for i = -1:0.01:1
        counter = counter + 1;
        f1grid(counter) = 1/ (abs(5-4*i));     %*xi(i));
        f2grid(counter) = exp((-5)*(i^2));   %*xi(i)*xi(i));
        c3grid(counter) = cos((10^4)*i);
    
    end

    f1grid = f1grid';
    f2grid = f2grid';
    c3grid = c3grid';
    
    errorf1 = max(abs(lf1 - f1grid));
    errorf2 = max(abs(lf2 - f2grid));
    
    errorchev1 = max(abs(cf1 - f1grid));
    errorchev2 = max(abs(cf2 - f2grid));
    errorchev3 = max(abs(cf3 - c3grid));
    
     blah1(n) = errorf1;
     blah2(n) = errorf2;
     blahchev1(n) = errorchev1;
     blahchev2(n) = errorchev2;
     blahchev3(n) = errorchev3;

end
plot(1:100,log10(blah1), 'LineWidth', 2);
hold on
plot(1:100,log10(blah2), 'LineWidth', 2);
plot(1:100,log10(blahchev1), 'LineWidth', 1);
hold on
plot(1:100,log10(blahchev2), 'LineWidth', 1);
plot(1:100,log10(blahchev3), 'LineWidth', 1);


