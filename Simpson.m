function [I] = Simpson(x,y)
%The Simpson function takes inputs x and y and evaluates the numerical integral of y with
%respect to x from the first x value to the last x value using the Simpsons 1/3 rule and the trapezoidal rule
%if the number of intervals is odd.
%Inputs
%   x: an array containing the x values of the data or function being integrated
%   y: and array containing the y value of the data being integrated or the
%       the f(x) values of the function.
%Outputs
%   I: an estimate of the numerical integral with respect to x

%Checks for correct number of input arguments
if nargin~=2
    error('Check number of inputs')
end
%Checks that x and y are the same length
lx=length(x);
ly=length(y);
if lx~=ly
    error('x and y must be the same size')
end
%Creates array dx that contains the difference between values of x
dx=diff(x);
%Checks that x is equally spaced by ensuring each value of dx is the same
if all(dx)~=dx(1)
    error('x matrix must be equally spaced')
end
%Creates variable n equal to the length of the x array
n=length(x);
%Creates variable test that will be used to check if there is an even or
%odd number of intervals
test=n/2;
%If statement determines whether the number of elements in x is odd or even
%by rounding, If the number of elements is odd, then there is an even
%number of intervals and the trapezoidal rule doesn't have to be used
if floor(test)~=test
    %Creates variable ni that determines how many integrals will be taken
    ni=(n-1)/2;
    %creates an array of zeroes
    I=zeros(1,ni);
    %Performs a single application of the Simpsons 1/3 rule over ni
    %iterations
    for iter=1:ni
        %Array i determines which point is to be used as 'x0'
        i=(1:2:n-2);
        %Array j determines which point is to be used as 'x1'
        j=(2:2:n-1);
        %array e determines which point is to be used as 'x2'
        e=(3:2:n);
        %Determines the numerical Integral based off the Simpsons 1/3 Rule equation for each
        %iteration and stores it in array I
        I(iter)=(x(e(iter))-x(i(iter)))*((y(i(iter)))+4*y(j(iter))+y(e(iter)))/6;
    end
    %In order to get the total numerical integral, the elements in I must
    %be summed
    I=sum(I);
else
    %Makes n into an odd number so Simpsons 1/3 equation can be used,I is
    %calculated the same as before
    n=n-1;
    ni=(n-1)/2;
    I=zeros(1,ni);
    for iter=1:ni
        i=(1:2:n-2);
        j=(2:2:n-1);
        e=(3:2:n);
        I(iter)=(x(e(iter))-x(i(iter)))*((y(i(iter)))+4*y(j(iter))+y(e(iter)))/6;
    end
    %In this case the numerical integral is equal to the sum of I plus the
    %trapezoid area created by the last interval
    I=sum(I)+((n+1)-n)*(y(n)+y(n+1))/2;
    %Displays a warning that the trapezoidal rule was used
    warning('number of intervals uneven, trapezoidal rule used on the last interval')
end
end

