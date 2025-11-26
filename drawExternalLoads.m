%==========================================================================
% function drawExternalLoads(G, F, R, titlestr, radius, fontsize)
%
% Input Arguments:
% G is an N x 2 matrix, describes the geometry of the truss
% F is an N x 2 matrix, describes the external forces acting on the truss
% R is an N x 2 matrix, describes the reactions from the truss
% titlestr is the title of the figure
% radius is the radius of the nodes
% fontsize is the size of the font that numbers the nodes and describes the
% axial forces of each member
%
% Output Arguments:
% None
%
% This function draws external loads with the information obtained from
% getValidUserInput to be called by visualizeTruss.
%
% Authors: Code originally written by Group G, modified by Group I
%  Owen Haberstroh (haber297@umn.edu)
%  Lily Wilkerson (wilke541@umn.edu)
%  Evan Stearns (stear149@umn.edu)
%
% Version: Nov. 20, 2025
%==========================================================================
function drawExternalLoads(G, F, R, titlestr, radius, fontsize)

figure(1);
clf;
theme light;
axis equal;
title(titlestr);

weight = 2;
Scale = 0.3; %used to scale the size of the arrows
hold on;

for i=1:size(G,1)

    %Draws force
    drawArrow(G(i,1),G(i,2) + radius, G(i,1) + (F(i,1) * Scale), G(i,2) + radius,weight, 'red','red');
    drawArrow(G(i,1),G(i,2) + radius, G(i,1), G(i,2) + radius + (F(i,2) * Scale) ,weight, 'red','red');

    %Draws reaction
    drawArrow(G(i,1),G(i,2) - radius, G(i,1) + (R(i,1) * Scale),G(i,2) - radius, weight, 'blue','blue');
    drawArrow(G(i,1),G(i,2) - radius, G(i,1), G(i,2) - radius + (R(i,2) * Scale), weight, 'blue','blue');


    %Draws the text by the arrows
    Ftextx1 = (G(i,1) + (G(i,1) + (F(i,1) * Scale)))/2 + 0.1;
    Ftexty1 = ((G(i,2) + radius) + (G(i,2) + radius))/2 + 0.1;
    Ftextx2 = (G(i,1) + G(i,1)) / 2 + 0.1;
    Ftexty2 = (G(i,2) + radius + (G(i,2) + radius + (F(i,2) * Scale)))/2 + 0.1;

    Rtextx1 = (G(i,1) + G(i,1) + (R(i,1) * Scale))/2 + 0.1;
    Rtexty1 = (G(i,2) - radius + G(i,2) - radius)/2 + 0.1;
    Rtextx2 = (G(i,1) + G(i,1))/2 + 0.1;
    Rtexty2 = (G(i,2) - radius + G(i,2) - radius + (R(i,2) * Scale))/2 + 0.1;

    %Draws the nodes
    drawNode(G(i,1),G(i,2),radius,string(i),fontsize);

    if F(i,1) ~= 0
        text(Ftextx1,Ftexty1,string(F(i,1)),'FontSize',12,'color','red');
    end

    if F(i,2) ~= 0
        text(Ftextx2,Ftexty2,string(F(i,2)),'FontSize',12,'color','red');
    end

    if R(i,1) ~= 0
        text(Rtextx1,Rtexty1,string(R(i,1)),'FontSize',12,'color','blue');
    end

    if R(i,2) ~= 0
        text(Rtextx2,Rtexty2,string(R(i,2)),'FontSize',12,'color','blue');
    end

end


hold off;



end


