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

        assert(size(G, 1) > 3, 'G must have more than 3 rows');
        assert(size(G, 2) == 2, 'G must have 2 cols');
        assert(all(pdist(G)) ~= 0);

        assert(size(C, 1) > 3, 'C must have more than 3 rows');
        assert(size(C, 2) == 2, 'C must have 2 cols');

    % try 
    % 
    % catch
    %     error('Error reading the file. Please check the format and try again.');
    % end
    


end