%==========================================================================
% function [G, C, F, R, T, filename] = getValidUserInput()
%
% This function reads a spreadsheet containg the above information and 
% turns it into matrices that MATLAB can read. It then verifies that the 
% given information follows a series of constraints.
%
% Input Arguments:
%   None
%
% Output Arguments:
%   G is an N x 2 matrix, describes the geometry of the truss
%   C is an M x 2 matrix, describes the start and end nodes of the members
%   F is an N x 2 matrix, describes the external forces acting on the truss
%   R is an N x 2 matrix, describes the reactions from the truss
%   T is an M x 1 matrix, describes the tenstion within the members
%   filename is the name of the file you're working with, to be used for
%   titling
%
% Authors: Group I
%   Owen Haberstroh (haber297@umn.edu)
%   Lily Wilkerson (wilke541@umn.edu)
%   Evan Stearns (stear149@umn.edu)
%
% Version: Nov. 24, 2025
%==========================================================================
function [G, C, F, R, T, filename] = getValidUserInput()

%==========================================================================
%Talk with the user to get the name of the file
%==========================================================================

while true
    
    user_input = input('Enter File Name Here (ex. "pratt.xlsx" or "pratt"): ', 's');
    
    % Deconstruct the user input.
    [filepath, name, ext] = fileparts(user_input);
    
    % Force the extension to be '.xlsx'. strcmpi is case-insensitive comparison.
    if ~strcmpi(ext, '.xlsx')
        ext = '.xlsx';
    end
    
    % Reconstruct the filename. fullfile ensures the correct file separator is used.
    filename_to_check = fullfile(filepath, [name, ext]); 

    % Check if the file exists.
    if exist(filename_to_check, 'file') == 2
        disp(['File "' filename_to_check '" accepted.']);
        filename = filename_to_check; % Set the final variable
        break;
    else
        disp('File not found. Please ensure the file is in the working directory.'); 
    end 
end

%==========================================================================
%Read the spreadsheet
%==========================================================================

    G = readmatrix(filename, 'Sheet','G');
    C = readmatrix(filename, 'Sheet','C');
    F = readmatrix(filename, 'Sheet','F');
    R = readmatrix(filename, 'Sheet','R');
    T = readmatrix(filename, 'Sheet','T');

    N = size(G,1);

%==========================================================================
%Validation
%==========================================================================

    %============= VALIDATE G =============

    assert(size(G, 1) >= 3, 'G must have more than 3 rows');
    assert(size(G, 2) == 2, 'G must have 2 cols');
    assert(all(pdist(G) ~= 0) == 1, 'G contains coincident nodes (duplicate rows).');
    assert(isnumeric(G), 'G must contain numeric values')

    %============= VALIDATE C =============

    assert(size(C, 1) >= 3, 'C must have more than 3 rows');
    assert(size(C, 2) == 2, 'C must have 2 cols');
    assert(all(C(:)==floor(C(:))), 'C includes non-intiger numbers')
    assert(any(C(:) > 1) && any(C(:) < N),'C contains node indices outside the range 1 to N')
    assert(any(C(:,1) ~= C(:,2)), 'C contains a member that starts and ends at the same node')
    assert(isnumeric(C), 'C must contain numeric values')

    %============= VALIDATE F =============

    assert(size(F,1) == N,'F must have size N-by-2, where N = number of rows in G.')
    assert(size(F,2) == 2,'F must have 2 cols')
    assert(isnumeric(F), 'F must contain numeric values')

    %============= VALIDATE R =============

    assert(size(R, 1) == N, 'R must have size N-by-2, where N = number of rows in G.');
    assert(size(R, 2) == 2, 'R must have 2 cols');
    assert(isnumeric(R), 'R must contain numeric values');

    %============= VALIDATE T =============

    assert(size(T, 1) == size(C,1), 'T must have size N-by-1, where N = number of rows in G.');
    assert(size(T,2) == 1, 'T must have 2 cols');
    assert(isnumeric(T), 'T must contain numeric values');
end
