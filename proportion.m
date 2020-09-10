function prop = proportion(x, y)
%   PROPORTION(X, Y) gives the proportion of elements in X that are smaller
%   or equal than Y.
%
%   X : N-by-1 double
%   Y : 1-by-1 double
%   PROP : 1-by-1 double

nb_smaller = 0;

for i=1:length(x)
    if x(i) <= y 
        nb_smaller = nb_smaller + 1;
    end
end

prop = nb_smaller/length(x);