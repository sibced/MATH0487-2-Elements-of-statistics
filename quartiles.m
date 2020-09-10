function [first_q, second_q, third_q] = quartiles(x)
%   QUARTILES(X) returns the first, second and third quartiles of the elements in X.
%
%   X : N-by-1 double
%   FIRST_Q : 1-by-1 double
%   SECOND_Q : 1-by-1 double
%   THIRD_Q : 1-by-1 double
first_q = quantile(x, .25);
second_q = quantile(x, .50);
third_q = quantile(x, .75);
end