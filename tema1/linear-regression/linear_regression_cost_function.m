function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function

  % TODO: linear_regression_cost_function implementation

	m = size(FeatureMatrix, 1);

	Error = 0;

	for i = 1:m
		Error = Error + (Theta(1) + FeatureMatrix(i, :) * Theta(2:end) - Y(i)) ^ 2;
	endfor

	Error = Error / (2 * m);
endfunction