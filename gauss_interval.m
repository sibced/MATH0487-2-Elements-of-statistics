function [lower_bound, upper_bound] = gauss_interval(x, sigma, perc)
%   GAUSS_INTERVAL(X, PERC) computes the lower and upper bounds of the 100*PERC percent Gauss confidence interval
%   of X's distribution mean. SIGMA is the standard deviation of the population.
%
%   X : N-by-1 double
%   SIGMA : 1-by-1 double
%   PERC : 1-by-1 double in [0, 1]
%   LOWER_BOUND : 1-by-1 double
%   UPPER_BOUND : 1-by-1 double

m_x = mean(x);
alpha = 1 - perc; 


lower_bound = m_x - icdf('Normal', 1 - alpha/2 , 0  , 1 ) * ( sigma / sqrt(length(x)));
upper_bound = m_x + icdf('Normal', 1 - alpha/2 , 0 , 1 ) * ( sigma / sqrt(length(x)));
      


end
