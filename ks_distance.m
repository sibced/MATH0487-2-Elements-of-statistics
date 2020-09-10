function dist = ks_distance(x, y)
%   KS_DISTANCE(X, Y) is the Kolmogorov-Smirnov distance between X and Y.
%
%   X : N-by-1 double
%   Y : M-by-1 double
%   DIST : 1-by-1 double


vec_pop = functionFreqCum(x, 0:0.5:max(x));
vec_sample = functionFreqCum(y, 0:0.5:max(x));

diff = abs(vec_pop - vec_sample);

% figure;
% plot( 0:0.5:max(x), vec)
% hold on;
% plot( 0:0.5:max(x), vec_sample)
% hold on; 
% plot( 0:0.5:max(x), diff)
% hold off; 

dist= abs(max(diff));

end