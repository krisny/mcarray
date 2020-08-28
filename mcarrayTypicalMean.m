function dout = mcarrayTypicalMean(d, n, marker, dim)
% get the typical mean of a single dimension in a mcarray by removing the n
% least typical and calculating the mean of the rest
%
%

%disp(length(d))
if nargin == 1
    n = 5;
    marker = 3;
    dim = 3;
end

col = (marker-1)*3+dim;
    
for i = 1:length(d)
    for j = 1:length(d)
        distances(i,j) = sum(abs(d(i).data(:,col)-d(j).data(:,col)));
    end
end

dsum = sortrows([1:length(d);sum(distances)]',-2);

d(dsum(1:n,1)) = [];

dout = mcarrayMean(d);
    
    
    
end