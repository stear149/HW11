%------------------------------------------------------------------------------
% drawArrow( xa, ya, xb, yb, weight, edgecolor, fillcolor )
%
%   Draws an arrow with a nice arrowhead that scales with the length of the
%   arrow.
%
% Input arguments:
%   xa              x-coordinate of point [a], i.e, the tail.
%   ya              y-coordinate of point [a], i.e. the tail.
%
%   xb              x-coordinate of point [b], i.e. the tip.
%   yb              y-coordinate of point [b], i.e. the tip.
%
%   weight          line width for the arrow.
%
%   edgecolor       color of the arrow.
%
%   fillcolor       color of the arrowhead.
%
% Output arguments:
%   NONE
%
% Usage:
% o If only the first four arguments are given, e.g.
%
%       drawArrow( xa, ya, xb, yb )
%
%   the weight is set to 1, and the edgecolor and drawcolor are set to
%   black.
%
% o If only the first five arguments are given, e.g.
%
%       drawArrow( xa, ya, xb, yb, weight )
%
%   the edgecolor and fillcolor are set to black.
%
% o If only the first six arguments are given, e.g.
%
%       drawArrow( xa, ya, xb, yb, weight, edgecolor )
%
%   the fillcolor is set equal to the edgecolor.
%
% Notes:
% o The are six construction points needed to draw the arrow. We label
%   these points [a] through [f].  Points [a] and [b] are passed in as
%   arguments. Points [c], [d], and [e] are computed.
%
%                      [c]
%                     o
%                  /./
%               /.../
%            /...../
%         /....[e]/   [f]
%     [b]o-------o----o--------- ... -----------o [a]
%         \.......\
%            \.....\
%               \...\
%                  \.\
%                     o
%                      [d]
%
% o There are three dimensional properties for our nice arrowhead.
%   We call these the "length", "width", and "tip".
%
%        |-- length ---| ___
%                     /   |
%                  /./    |
%               /.../   width
%            /...../      |
%         /......./       |
%        <-------|--------------- ...
%        |- tip -|
%
% o The detailed shape of our arrowhead is defined by three dimensionless
%   scaling ratios: "s", "t", and "u".
%
%       s = tip/|arrow|
%       t = width/length
%       u = tip/length
%
%   These three ratios are hard-coded into this function. We can change the
%   geometric look of the arrowhead by changing these ratios, but this
%   would require changing the code in this function.
%
% o This function assumes that the vertical and horizontal axes are scaled 
%   equally; e.g. "axis equal".
%
% Written by:
%   Dr. Randal J. Barnes
%   Department of Civil, Environmental, and Geo- Engineering
%   University of Minnesota
%
% Version:
%   12 November 2025
%------------------------------------------------------------------------------
function drawArrow( xa, ya, xb, yb, weight, edgecolor, fillcolor )
    % Set the default parameters, if necessary.
    if nargin == 4
        weight = 1;
        edgecolor = [0,0,0];
        fillcolor = edgecolor;
    elseif nargin == 5
        edgecolor = [0,0,0];
        fillcolor = edgecolor;
    elseif nargin == 6
        fillcolor = edgecolor;
    end
    
    % Validate the input arguments.
    assert( isscalar(xa) && isreal(xa), '<xa> must be a real scalar.' );
    assert( isscalar(ya) && isreal(ya), '<ya> must be a real scalar.' );
    
    assert( isscalar(xb) && isreal(xb), '<xb> must be a real scalar.' );
    assert( isscalar(yb) && isreal(yb), '<yb> must be a real scalar.' );
    
    assert( isscalar(weight) && weight > 0, '<xa> must be a positive scalar.' );
    
    % Set the dimensionless scaling ratios for the arrowhead.
    s = 0.125;              % length/|arrow|
    t = 0.500;              % width/length
    u = 0.700;              % tip/length
    
    % Compute the coordinates of the construction points.
    dx = s*(xa-xb);         % xf - xb
    dy = s*(ya-yb);         % yf - yb
    
    xc = xb + dx - dy*t;
    yc = yb + dy + dx*t;
    
    xd = xb + dx + dy*t;
    yd = yb + dy - dx*t;
    
    xe = xb + u*dx;
    ye = yb + u*dy;
    
    % Draw the arrow.
    flag = ishold;
    hold on;
    
    plot( [xa,xb], [ya,yb], '-', 'LineWidth',weight, 'Color',edgecolor );
    fill( [xb,xc,xe,xd,xb], [yb,yc,ye,yd,yb], fillcolor );
    plot( [xb,xc,xe,xd,xb], [yb,yc,ye,yd,yb], '-', 'LineWidth',weight, 'Color',edgecolor );
    
    if ~flag
        hold off;
    end
end