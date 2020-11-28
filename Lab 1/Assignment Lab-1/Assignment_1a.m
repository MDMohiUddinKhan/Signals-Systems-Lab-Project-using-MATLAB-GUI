function [matrix_1, matrix_2] = Assignment_1a()

for i = 1:10
    if i == 1
        matrix_1(i,1) = 0;
    else
        matrix_1(i,1) = matrix_1(i-1 , 10) + 1;
    end
    
    for j = 2:10
        matrix_1(i,j) = matrix_1(i,j-1) + 1;
    end
end
matrix_1;
matrix_2 = matrix_1';
end