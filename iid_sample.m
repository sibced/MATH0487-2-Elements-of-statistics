function sample = iid_sample(x, size)
%   IID_SAMPLE(X, SIZE) returns an iid sample of size SIZE, sampled from the elements of X.
%
%   X : N-by-P table
%   SIZE : 1-by-1 integer
%   SAMPLE : SIZE-by-P table
indices = randsample(height(x), size, true);

sample = table();
for i=1:size
    sample = [sample ; x(indices(i),:)];
end