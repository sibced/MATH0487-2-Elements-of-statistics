function [lower_bound, upper_bound] = gauss_interval(x, perc)
%   GAUSS_INTERVAL(X, PERC) computes the lower and upper bounds of the 100*PERC percent Gauss confidence interval
%   of X's distribution mean.
%
%   X : N-by-1 double
%   PERC : 1-by-1 double in [0, 1]
%   LOWER_BOUND : 1-by-1 double
%   UPPER_BOUND : 1-by-1 double

m_x = mean(x);

lower_bound = m_x - icdf('Normal', perc, 30.699819999999978, 5.907491021401209 ) * ( 5.907491021401209 / sqrt(length(x)));
upper_bound = m_x + icdf('Normal', perc, 30.699819999999978, 5.907491021401209 ) * ( 5.907491021401209 / sqrt(length(x)));
      
end
