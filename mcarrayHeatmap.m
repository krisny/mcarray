
function mcarrayHeatmap(d,marker,dim,nbins)
% 
% Plotting heatmap of all entries in the array. 
% By Kristian Nymoen, University of Oslo, 2020
% 
% The heatmap is a framewise histogram visualized as an image with time on
% the X-axis, position/velocity/acceleration or similar on the Y-axis and
% histogram count as image colour
% 
% syntax
% mcarrayHeatmap(d, marker, dim)
% mcarrayHeatmap(d, marker, dim, nbins) % if nbins is unspecified, it defaults to 100
%
%  
%
% input parameters
% d: MoCap data struct array. Each mocap struct in the input array should have the same length.
% marker: vector containing marker numbers
% dim: dimensions to be plotted (for MoCap data structure - default: 1)
%
% examples
% mcarrayHeatmap(d, 1, 3)
% mcarrayHeatmap(d, 1, 3, 10) 
% mcarrayHeatmap(d, 1:2, 3)
% mcarrayHeatmap(d, 1:2, 1:2, 200)
%
% 


if nargin < 4
    nbins = 100;
end

if strcmpi(d(1).type, 'norm data')
    col = marker;
else
    col = (marker-1) * 3 + dim;
end

b = d(1).data(:,col);

for j = 1:length(col)

for i = 2:length(d)
    
    b = [b d(i).data(:,col(j))];

    
end


end

bmax = max(max(b));
bmin = min(min(b));

if length(nbins) == 3
    bmin = nbins(1);
    bmax = nbins(2);
    nbins = nbins(3);
end

edges = linspace(bmin,bmax,nbins);


for i = 1:d(1).nFrames

    c(:,i) = histcounts(b(i,:),edges);

    
end


imagesc((0:d(1).nFrames-1)/d(1).freq,-edges,c)

end

