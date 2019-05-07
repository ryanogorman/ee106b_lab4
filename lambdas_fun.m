function [lam] = lambdas_fun(lambda)
%lam1 = (lambda^4-1)/(lambda^4);
lam1 = (lambda^4-1)/(lambda^3*(lambda-1));
lam2 = (lambda-1/lambda)^2;
lam = [lam1,lam2];
end