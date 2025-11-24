%==========================================================================
% function drawDisk(xc, yc, radius, edgeColor, faceColor)
%
% This function draws discs where its told to.
%
% Input Arguments:
%   xc - Center in the X direction
%   yc - Center in the Y direction
%   radius - Radius to draw the disk
%   edgeColor - Edge color of the disk
%   faceColor - Face color of the disk
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
function drawDisk(xc, yc, radius, edgeColor, faceColor)

pos = [xc-radius,yc-radius,2*radius,2*radius]; % [left conner x, left conner y, added to x = right conner, added to y = right conner]
rectangle('Position',pos,'Curvature',[1 1],'FaceColor',faceColor,'EdgeColor',edgeColor,'LineWidth',1)

end