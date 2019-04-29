function [L,U,P] = luFactor(A)
% Due on: 3 April 2019
%Created By: Brad George
%
%[L,U,P] = luFactor(A)
%
%luFactor determines the lower and upper triangular matrix of a given
%system of equations or matrix.
% 
%Inputs: A - Cooeficient Matrix
%
%Outputs: L - Lower Triangular Matrix
%         U - Upper Triangular Matrix
%         P - Pivot Matrix (keeps track of the pivots used in the LU
%         decomposition)

%Define Variables
P = eye(3);
L = P;
U = A;

%Input/Error Checks
[m,n] =  size(A);
if nargin>1
    error('The Function Does Not Support Multiple Inputs')
elseif m ~= n
    error('The Input Must be a Square Matrix')
end


%Variable Elimination
for k = 1:m
    for i = 1:m-1
        maximum = max(abs(U(:,k)));
        row = find(abs(U(:,k))==maximum);
        U([i row],:) = U([row i],:);
        if k == 2 && U(1,2) < U(3,2)          %Maximum Value Pivots
            U([1 1],:) = U([1 1],:);
        elseif k==2 && U(1,2) > U(3,2)
            U([1 3],:) = U([3 1],:);
        end
        
        L_1 = U(i+1,k)/U(i,k);
        U(i+1,:) = U(i+1,:)-(U(i,:)*L_1);  %Elimination
        
        
        L(i+k,k) = L_1;         %Lower Triangular Matrix Setup
    end
    m = m-1;
end
L = L*P;
L = L
U = U 
P = P




    
    
    
    


















        










end

