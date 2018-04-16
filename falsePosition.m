  function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%The falsePosition function estimates the root of a given function by
%bracketing the root and using the false position method to find the root
%   Inputs
%       func-the function being evaluated, must input f as the following,
%           f= @(x) desired function
%               ex: @(x)x^2
%       xl-lower guess
%       xu-upper guess
%       es-desired relative error as a percent, defaults to .0001%
%       maxiter- maximum number of iterations, defaults to 200
%   Outputs
%       root- estimate of the root of the given function
%       fx-the function evaluated at the root
%       ea-percent error of root estimate
%       iter=number of iterations performed

%Checks to see if user input enough arguments
if nargin<3 || nargin>5
    error('Invalid number of inputs, see function documentation')
%sets defaults for desired error and maximum iterations
elseif nargin==3
    es=.0001;
    maxiter=200;
end
%creates variable test
test=func(xl)*func(xu);
%creates an array that will be used to store the estimates
xr=zeros(1,5);
%creates first value of array so the function can calculate error
iter=1;
%Initializes the error as 100 percent
ea=100;
%If statement determines whether the user input bounds that bracket the
%root
if test<0
    %Runs while loop to determine the root estimate until it reaches the
    %desired error or maximum iterations
    while (iter<maxiter)|| (ea>es)
        xr(iter+1)=xu-((func(xu))*(xl-xu))/(func(xl)-func(xu));
        ea=(abs((xr(iter+1)-(xr(iter)))/(xr(iter+1))))*100;
        %If statement determines new bounds by checking for a sign change
        if func(xl)*(func(xr(iter+1)))<0
            xu=xr(iter+1);
        else
            xl=xr(iter+1);
        end
        %Keeps track of number of iterations
        iter=iter+1;
    end
else
    error('points do not bracket root')
end
%displays the estimate of the root by taking the last number in the array
root=(xr(iter))
%Since iter was initialized as 1, the real number of iterations is iter-1
iter=iter-1
%Displays the function value at the root
fx=double(func(root))
%displays actual error as a percent
ea=ea
end

