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
% filename is the name of the file you're working with, to be used for
% titling
%
% Output Arguments:
% None
%
% This function works with drawTruss and drawExternalLoads to give a 
% graphical interpretation of the given truss.
%
% Authors: Group I
%  Owen Haberstroh (haber297@umn.edu)
%  Lily Wilkerson (wilke541@umn.edu)
%  Evan Stearns (stear149@umn.edu)
%
% Version: Nov. 20, 2025
%==========================================================================


function visualizeTruss()

[G, C, F, R, T, filename] = getValidUserInput();

%set radius and font size
radius = (mean(pdist(G)))/40;
fontsize = min(radius^(1/4),.025);

% Print radius and fontsize
% fprintf('Radius: %.4f\n', radius);
% fprintf('Fontsize: %.4f\n', fontsize);

%set titles and draw the figures
[~, baseName, ~] = fileparts(filename);
titlestr = baseName;

%draw the figures
drawExternalLoads(G, F, R, titlestr, radius, fontsize); %figure 1

drawTruss(G, C, T, titlestr, radius, fontsize); %figure 2

end




