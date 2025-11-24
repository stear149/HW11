%==========================================================================
% function visualizeTruss()
%
% Input Arguments:
% (From getValidUserInput, not input directly by user)
% G is an N x 2 matrix, describes the geometry of the truss
% C is an M x 2 matrix, describes the start and end nodes of the members
% F is an N x 2 matrix, describes the external forces acting on the truss
% R is an N x 2 matrix, describes the reactions from the truss
% T is an M x 1 matrix, describes the tenstion within the members
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

