function [G, C, F, R, T, filename] = getValidUserInput()
    filename = '';
    while exist(filename, 'file') ~= 2
        filename = input('Type File Name: ','s');    
        if exist(filename, 'file') ~= 2
            fprintf('\nFile %s does not exist in the directory. \n', filename);
            fprintf('Please Try Again. \n\n')
        end
    end
    
    G = readmatrix(filename, 'Sheet','G');
    C = readmatrix(filename, 'Sheet','C');
    F = readmatrix(filename, 'Sheet','F');
    R = readmatrix(filename, 'Sheet','R');
    T = readmatrix(filename, 'Sheet','T');


end