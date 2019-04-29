function [root,fx,ea,iter] = falsePosition(func,x_l,x_u,es,maxiter)
%The falsePosition function uses the false position bracketing method
%to estimate the roots of a user inputted function. 
%
%   The user-input function must already be defined.
%   
%   The user will input a function and bounds as starting points for the
%   algorithm. Optional inputs 'es' and 'maxiter' will estimate the root of
%   the function to a certain percent of the true value or will run until
%   the maximum number of iterations has been reached. 



if nargin < 4       %%Input Check
    maxiter = 200;
    es = 0.000001;
elseif nargin == 4
    maxiter = 200;
end

f = func;
if f(x_l)*f(x_u) > 0
    error('Bounds Must Contain a Root')  %%Bound Check
else 
    relerror = 100;   %%Define Variables
    iter = 0;
    while iter<maxiter
        iter = iter+1;
        x_r = x_u - ((f(x_u)*(x_l-x_u))/(f(x_l)-f(x_u))); %x_r value Calculation
        if sign(x_u) == sign(x_r)
             relerror = abs((x_r)-(x_u))/(x_r);  
             x_u = x_r;
             if abs(relerror) < es                %%Error Check
                break
             end
        elseif sign(x_l) == sign(x_r)
             relerror = abs((x_r)-(x_l))/(x_r);
             x_l = x_r;
            if abs(relerror) < es
                break
            end
        end
    end
    fprintf('The Root is %0.4f\n',(x_r))
    fprintf('Relative Error: %0.4f\n',relerror)    %%Outputs
    fprintf('f(x) value of %0.4f\n',f(x_r))
    fprintf('%0.0f iterations were performed',iter)
end
end

