function dout = mcarrayRemoveLeastNormal(d, n, marker, dim)
% remove the n "least typical" elements of a mcarray
% only works for one marker in one dimension (Default uses marker 3 dimension 3)
% mcarrayRemoveLeastNormal(d, n, marker, dim)
%
% d = mcarray, array of mocap structs
% n = number of array elements to remove
% marker = which marker to use in typicality comparison
% dim = which dimension to use in typicality comparison

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

dout = d;
    

end