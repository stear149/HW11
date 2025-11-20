%==========================================================================
% function drawTruss(G, C, T, titlestr, radius, fontsize)
%
% Input Arguments:
% G is an N x 2 matrix, describes the geometry of the truss
% C is an M x 2 matrix, describes the start and end nodes of the members
% T is an M x 1 matrix, describes the tenstion within the members
% titlestr is the title of the figure
% radius is the radius of the nodes
% fontsize is the size of the font that numbers the nodes and describes the
% axial forces of each member
%
% Output Arguments:
% None
%
% This function draws a truss with the information obtained from
% getValidUserInput to be called by visualizeTruss.
%
% Authors: Code originally written by Group G, modified by Group I
%
% Version: Nov. 19, 2025
%==========================================================================
function drawTruss(G, C, T, titlestr, radius, fontsize)

    figure(2);
    clf;
    theme light;
    axis equal;

    weight = 3;
    hold on;
    for j=1:size(T,1)
        if T(j,1) > 0
            colorMember = 'red';
            colorText = 'red';
        elseif T(j,1) < 0
            colorMember = 'blue';
            colorText = 'blue';
        else
            colorMember = 'black';
            colorText = 'black';
        end

        x = [G(C(j,1),1) ,G(C(j,2),1)];
        y = [G(C(j,1),2) ,G(C(j,2),2)];

        plot(x, y, '-', 'LineWidth',weight, 'Color',colorMember)

        xm = mean(x);
        ym = mean(y);
        angle = atand((y(2) - y(1)) / (x(2) - x(1)));

        if angle > 90
            angle =  angle - 90;
        elseif angle < -90
            angle = angle + 90;

        end


        text( xm, ym, ...
            sprintf('%.1f', T(j)), ...
            'FontUnits', 'normalized', ...
            'FontSize', fontsize, ...
            'Rotation', angle, ...
            'HorizontalAlignment', 'center', ...
            'VerticalAlignment', 'bottom','Color',colorText);
        title(titlestr);



    end


    for i=1:size(G,1)
        %Draws the dots
        drawNode(G(i,1),G(i,2),radius,string(i),fontsize);
    end

    hold off;
end
