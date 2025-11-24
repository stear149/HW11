%==========================================================================
% function visualizeTruss()
%
% Input Arguments:
% None
%
% Output Arguments:
% None
%
% This function works with drawTruss and drawExternalLoads to give a 
% graphical interpretation of the given truss.
%
% Authors: Code originally written by Group G, modified by Group I
%
% Version: Nov. 20, 2025
%==========================================================================


function visualizeTruss()

[G, C, F, R, T, filename] = getValidUserInput();

%set radius and font size
radius = 0.1;
fontsize = 0.03;

%set titles and draw the figures
titlestr = filename;
drawExternalLoads(G, F, R, titlestr, radius, fontsize); %figure 1

drawTruss(G, C, T, titlestr, radius, fontsize); %figure 2

end
