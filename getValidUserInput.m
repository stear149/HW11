%==========================================================================
% function [G, C, F, R, T, filename] = getValidUserInput()
%
% Input Arguments:
% None
%
% Output Arguments:
% G is an N x 2 matrix, describes the geometry of the truss
% C is an M x 2 matrix, describes the start and end nodes of the members
% F is an N x 2 matrix, describes the external forces acting on the truss
% R is an N x 2 matrix, describes the reactions from the truss
% T is an M x 1 matrix, describes the tenstion within the members
% filename is the name of the file you're working with
%
% This function reads a spreadsheet containg the above information and 
% turns it into matrices that MATLAB can read. It then verifies that the 
% given information follows a series of constraints.
%
% Authors: Group G and Group I
%
% Version: Nov. 20, 2025
%==========================================================================
function [G, C, F, R, T, filename] = getValidUserInput()

%Talks with the user to get the name of the file
Valid = true;
while(Valid)
    
    filename = input('Enter File Name Here (space sensitive): ', 's');
%if you keep getting errors, make sure to include the file extenstion
%(.xlsx), ensure the file you're trying to access is in the working 
%directory, check spelling, and don't include unnecessary spaces

    if exist(filename, 'file') == 2
        Valid = false;
    else
        disp('File not found. Please return valid file'); 
    end 

end

%Read the spreadsheet

dataG = readmatrix(filename, 'Sheet','G');
G = dataG(1:size(dataG,1),1:2);

dataC = readmatrix(filename, 'Sheet','C');
C = dataC(1:size(dataC,1),1:2);

dataF = readmatrix(filename, 'Sheet','F');
F = dataF(1:size(dataF,1),1:2);

dataR = readmatrix(filename, 'Sheet','R');
R = dataR(1:size(dataR,1),1:2);

dataT = readmatrix(filename, 'Sheet','T');
T = dataT(1:size(dataT,1),1);

%==========================================================================
%Validation
%==========================================================================

%Validate G

%G has at least 3 rows and exactly 2 columns
if size(G,1) < 3 || size(G,2) ~= 2
    error('G must have at least 3 rows and exactly 2 columns.');
end

%G entries must be numeric
if ~isnumeric(G)
    error('G must contain numeric values.');
end

%No two nodes in G are coincident
%(check that every row is unique)
if size(unique(G,'rows'),1) ~= size(G,1)
    error('G contains coincident nodes (duplicate rows).');
end

%Number of nodes
N = size(G,1);

%==========================================================================

%Validate C

%C has at least 3 rows and exactly 2 columns
if size(C,1) < 3 || size(C,2) ~= 2
    error('C must have at least 3 rows and exactly 2 columns.');
end

%C must contain integers
if ~all(C(:) == floor(C(:)))
    error('C contains non-integer entries.');
end

%Indices must be between 1 and N
if any(C(:) < 1 | C(:) > N)
    error('C contains node indices outside the range 1 to N.');
end

%No member starts and ends at the same node
if any(C(:,1) == C(:,2))
    error('C contains a member that starts and ends at the same node.');
end

%==========================================================================

%Validate F

%F must have exactly the same number of rows as G
% and exactly 2 columns
if size(F,1) ~= N || size(F,2) ~= 2
    error('F must have size N-by-2, where N = number of rows in G.');
end

%F must be numeric
if ~isnumeric(F)
    error('F must contain numeric values.');
end

%==========================================================================

%Validate R

%R must have same number of rows as G
%and exactly 2 columns
if size(R,1) ~= N || size(R,2) ~= 2
    error('R must have size N-by-2, where N = number of rows in G.');
end

if ~isnumeric(R)
    error('R must contain numeric values.');
end

%==========================================================================

%Validate T

%T must have same number of rows as C and exactly 1 column
if size(T,1) ~= size(C,1) || size(T,2) ~= 1
    error('T must have size (#rows in C)-by-1.');
end

%T must be numeric
if ~isnumeric(T)
    error('T must contain numeric values.');
end

%==========================================================================

end
