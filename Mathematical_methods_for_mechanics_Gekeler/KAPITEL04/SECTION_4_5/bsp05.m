function Y = bsp05(X,flag,Parmeter);
% Example of Hartl et al. p. 204
% flag = 1: Objective function
% flag = 2: Inequalities, also []
% flag = 3: Equalities 
% flag = 4: Gradient of objective function
% flag = 5: Gradient of inequalities, also []
% flag = 6: Gradient of equalities
% -------------------------------------------
% !! Gradient of f: R_n -> R_m is (m,n)-matrix !!
% -------------------------------------------
n = Parmeter(1); X0 = Parmeter(2); T_END = Parmeter(3);
A = T_END/n; FAKTOR = ones(1,n+1);
FAKTOR(1) = 0.5; FAKTOR(n+1) = 0.5;
D           = 0.5*ones(n+1,1);
E           = zeros(n+1,n+1) + tril(ones(n+1,n+1),-1) + diag(D);
E(:,1) = D; E(1,1) = 0;
FAKTOR = A*FAKTOR;
E = A*sparse(E);

XX = X(1:n+1); U = X(n+2:2*(n+1));
X1 = ones(n+1,1) + E*U;
switch flag
case 1, Y = FAKTOR*XX;
case 2, Y = [XX; U + 1; 1 - U];
case 3
   Y   = [XX - ones(n+1,1) - E*U;
          XX(n+1) - 1];
case 3
   Y   = [XX - ones(n+1,1) - E*U;
          XX(n+1) - 1];
case 4, Y = [FAKTOR, zeros(1,n+1)];
case 5
   Y  = [ eye(n+1), zeros(n+1,n+1);
          zeros(n+1,n+1), eye(n+1);
          zeros(n+1,n+1),-eye(n+1)];
   Y = sparse(Y);
case 6
   AUX = zeros(1,2*(n+1));
   AUX(n+1) = 1;
   Y   = [ eye(n+1), - E; AUX];
   Y   = sparse(Y);
end
