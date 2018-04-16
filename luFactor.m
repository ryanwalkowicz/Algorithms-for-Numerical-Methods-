function [L,U,P] = luFactor(A)
%This Function takes a square matrix A and performs pivoting and LU
%factorization to create an L matrix and a U matrix that can be used to
%solve systems of equation
%Inputs:
%   A-Input a square matrix that represents the coefficients of a system of
%     equations
%Outputs:
%   L-Lower triangular matrix represeting the values used to perform
%     Gauss elimination
%   U-Upper triangular matrix found as a result of Gauss elimination
%   P-Square matrix that keeps track of pivoting

%Makes sure there is a correct number of input arguments
if nargin ~=1
    error('Wrong number of input arguments')
end
%checks to see if A is a square Matrix
[R,C]=size(A);
if R~=C
    error('Please input a square Matrix')
end
%Determines number of rows/columns in matrix A
n = length(A);
%Creates L,U,and P matricies
L = eye(n);
U = A;
P = eye(n);
    %for loop that determines which elements are being modified
for r=1:n
%creates variable rp that represents the row containing the pivot
%element(largest element in column)
[~,rp] = max(abs(A(r:end,r)));
%ensures correct matrix elements are being modified
rp =r-1+rp;
%Pivots the P,L, and U matricies
U([r rp],:) = U([rp r],:);
P([r rp],:) = P([rp r],:);
L([r rp],:) = L([rp r],:);
%Inputs values used in gauss elimination into L matrix(a2/a11)
L(r:n,r) = U(r:n,r) / U(r,r);
%Uses gauss elimination to fill in the U matrix
U(r+1:n,1:n) = U(r+1:n,1:n) - L(r+1:n,r)*U(r,1:n);
end
%Pivots the L matrix so that [L][U]=[A]
L=P\L;
end


