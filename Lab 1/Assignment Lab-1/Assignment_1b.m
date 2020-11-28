function [matrix_1, matrix_2, sub_matrix_2, inv_sub_matrix_2] = Assignment_1b()

matrix_1 = randi(5,5); 
% randi(x) = random integer single value between 0 to x
% randi(x,y) = matrix of random positive integer values between 0 to min(x & y)
% rand = matrix of random positive fractional values between 0 & 1
% randn = matrix of random negative values
matrix_2 = matrix_1;
matrix_2(3,:) = rand(1,5);
matrix_2;
sub_matrix_2 = matrix_2(2:3, 4:5);
inv_sub_matrix_2 = inv(sub_matrix_2);

end