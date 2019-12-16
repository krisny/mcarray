
function md = mcarrayBarSegment(d,barlength)
% 
% Divide a mc struct into successive fixed periods. Output a mcarray.
%
% mcarrayBarSegment(d,barlength)
%
% d: mocap data structure
% barlength: repetition length (in frames)
%
% mcarrayOut = mcarrayBarSegment(data,barlength);
%

data = d.data;
nbars = (d.nFrames-1)/barlength;
d.data = [];

for j = 1:nbars
    md(j) = d;
    md(j).data = data(((j-1)*barlength+1):(j*barlength),:);
    md(j).nFrames = barlength;
    
end



end
