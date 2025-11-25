%==========================================================================
% function drawNode(xc, yc, radius, label, fontsize)
%
% This function draws discs where its told to.
%
% Input Arguments:
%   xc - Center in the X direction
%   yc - Center in the Y direction
%   radius - Radius to draw the disk
%   label - Name of the node
%   fontsize - how big the font it, normalized to the graph
%
% Output Arguments:
%   None
%
% Authors: Group I
%   Owen Haberstroh (haber297@umn.edu)
%   Lily Wilkerson (wilke541@umn.edu)
%   Evan Stearns (stear149@umn.edu)
%
% Version: Nov. 24, 2025
%==========================================================================
function drawNode(xc, yc, radius, label, fontsize)


drawDisk(xc, yc, radius, 'black', 'white');

text(xc, yc, label, ...
    'FontUnits', 'normalized', ...
    'FontSize', fontsize, ...
    'HorizontalAlignment', 'center', ...
    'VerticalAlignment', 'middle');


end