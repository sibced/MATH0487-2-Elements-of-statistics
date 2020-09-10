function [lower_bound, upper_bound] = normal_interval(x)
%   NORMAL_INTERVAL(X) computes the normality interval, in the sense of the normal
%   distribution, of X.
%
%   X : N-by-1 double
%   LOWER_BOUND : 1-by-1 double
%   UPPER_BOUND : 1-by-1 double

[mean_x, median_x, std_x] = sum_up(x);

lower_bound = mean_x - std_x;
upper_bound = mean_x + std_x;

end