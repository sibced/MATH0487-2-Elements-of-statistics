function [lower_bound, upper_bound] = student_interval(x, perc)
%   STUDENT_INTERVAL(X, PERC) computes the lower and upper bounds of the 100*PERC percent Student confidence interval
%   of X's distribution mean.
%
%   X : N-by-1 double
%   PERC : 1-by-1 double in [0, 1]
%   LOWER_BOUND : 1-by-1 double
%   UPPER_BOUND : 1-by-1 double

[m_x,~, std_x] = sample_sum_up(x);

alpha = 1 - perc;

lower_bound = m_x - icdf('T', 1 - alpha/2 , length(x) - 1) * ( std_x / sqrt(length(x) - 1))  ;
upper_bound = m_x + icdf('T', 1 - alpha/2 , length(x) - 1) * ( std_x / sqrt(length(x) - 1))  ;
      
end