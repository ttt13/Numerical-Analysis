% Routine for CA NUMBER

% matrix norms example.
clear;
A = rand(3,3) % define a random 3 by 3 matrix
% compute the 2 norm and condition number using the 2 norm.
twonorm = norm(A,2) % 2-norm
twocond = cond(A,2) % cond number with 2-norm

% Add code here for the computation of the 1-norm, the infinity norm
% and the Frobenius norm and condition number based on those norms.
onenorm = norm(A,1)
onecond = cond(A,1)

infnorm = norm(A, inf)
infcond = cond(A, inf) 

fronorm = norm(A, 'fro')
frocond = cond(A, 'fro')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% generate Hilbert matrices and 
% compute cond number with 2-norm
N = 50; % total numer of matrices
condofH = [];
a = 1 + sqrt(2);
% compute the cond number of Hn
for n = 1:N
	Hn = hilb(n);
	condofH = [condofH cond(Hn,2)];
     q(n) =   ( (a)^(4*n) )/sqrt(n) ;
end

% at this point you have a vector condofH that contains the condition
% number of the Hilber matrices from 1x1 to 50x50.
semilogy(1:N, condofH, 'LineWidth', 2)
hold on
semilogy(1:N, q )
title('Semilog on Y Axis: Condition of Hibert Matrix vs Size')
ylabel('Condition Number','fontsize',10)
xlabel('Size','fontsize',10)
% Figure out how to plot this (regular plot?, log log plot?, semilog plot?)
% and also plot on the same graph the theoretical growth line. Include and
% explain this graph in your report.
%

% Third part - compare the performance of solving an ill-conditioned linear
% system using LU, QR and backslash.
% 
mindim = 100; % minimum number of rows and columns of Hilbert matrix
maxdim = 400; % maximum number of rows and columns of Hilbert matrix
% errors in 2-norm for 3 methods
errorlu = [];
errorqr = [];
errorbackslash = [];
tic
for k = mindim:maxdim
	Hk = hilb(k); % generate Hilbert matrix
	x = ones(k,1); % give the solution of the system
	b = Hk*x; % % compute RHS
	% get solution back by using different methods
  	[P,L,U] = lu(Hk); % lu factorization of Hk
 	[Q,R] = qr(Hk); % qr factorization of Hk
  	xlu = U \ (L \ (P * b)); % solution with LU
 	xqr = R \ Q \ b; % solution with QR
 	xbackslash = Hk \ b; % solution with backslash command
	% computing errors
  	errorlu = [errorlu norm(xlu-x,2)];
  	errorqr = [errorqr norm(xqr-x,2)];
	errorbackslash = [errorbackslash norm(xbackslash-x,2)];
end
toc
%total errors
totalerrorlu = sum(errorlu)
totalerrorqr = sum(errorqr)
totalerrorbackslash = sum(errorbackslash)

% plot solutions
subplot(3,1,1)
semilogy(mindim:maxdim,errorlu)
title('Semilogy Subplot: Hilbert Matrix Error vs Size, LU')
ylabel('Log Error','fontsize',10)
xlabel('Size','fontsize',10)

subplot(3,1,2)
semilogy(mindim:maxdim, errorqr)
title('Semilogy Subplot: Hilbert Matrix Error vs Size, QR')
ylabel('Log Error','fontsize',10)
xlabel('Size','fontsize',10)

subplot(3,1,3)
semilogy(mindim:maxdim, errorbackslash)
title('Semilogy Subplot: Hilbert Matrix Error vs Size, Backslash')
ylabel('Log Error','fontsize',10)
xlabel('Size','fontsize',10)


meanqr = mean(errorqr)
meaneb = mean(errorbackslash)
% add here similar plots for QR and backslash


	
