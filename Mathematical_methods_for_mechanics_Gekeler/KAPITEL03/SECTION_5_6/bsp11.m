function Y = bsp11(X,flag,Parmeter);
% Spellucci, p. 368
% flag = 1: Objective function
% flag = 2: Inequalities
% flag = 3: Equalities
% flag = 4: Gradient of objective function
% flag = 5: Gradient of inequalities
% flag = 6: Gradient of equalities
% -------------------------------------------
% Gradient of f: R_n -> R_m is (m,n)-matrix
% -------------------------------------------
switch flag
case 1, Y = X(1)*X(2)^2;
case 2, Y = 0;
case 3, Y = 2 - X(1)*X(1) - X(2)*X(2);
case 4, Y = [X(2)^2, 2*X(1)*X(2)];
case 5, Y = 0;
case 6, Y = [-2*X(1), -2*X(2)];
end;
