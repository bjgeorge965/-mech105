function [I] = Simpson(x,y)
%Due on: April 19 2019
%Created By: Brad George
%
%[I] = Simpson(x,y)
%
%   The Simpson function uses Simpson's 1/3 rule to estimate the integral
%   of a relationship between input variables 'x' and 'y'
%
%   Inputs: x - column vector of the dependent variable
%           y - column vector of the independent variable

%Input Checks
m = length(x);
diff = x(m,1)-x(m-1,1);
for i = 2:m
    diff_1 = x(i,1)-x(i-1,1);
    if diff ~= diff_1
        error('Dependent Variable Must Be Evenly Spaced')
    end
end

if size(x) ~= size(y)
    error('Inputs are not the same length')
end

%Set Variables
I_1 = 0;
I_2 = 0;

%Summations
for f = 2:2:m
    I_1 = I_1 + 4*y(f,1);
end
for f = 3:2:m-1
    I_2 = I_2 + 2*y(f,1);
end

%Simpson's Calculations
h = (x(m,1)-x(1,1))/(length(x)-1);
I = (h/3)*(y(1,1)+I_1+I_2+y(m,1));

%Final Interval Check
if m>f
    step = (x(m,1)-x(f,1))/2;
    trap = step*(y(m,1)+y(m-1,1));
    I = I+trap;
    warning('Trapezoidal Method Was Used for Last Interval')
end

%Display Integral Value
fprintf('The Approximated Integral of x and y is %4.2f',I)
end

