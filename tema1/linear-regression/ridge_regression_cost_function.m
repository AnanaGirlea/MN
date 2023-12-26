function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % TODO: ridge_regression_cost_function implementation

	Error = 0;
	[m, n] = size(FeatureMatrix);

	for i = 1:m
		Error = Error + (Theta(1) + FeatureMatrix(i, :) * Theta(2:end) - Y(i))^2;
	endfor

	Error = Error / (2 * m);

	Error = Error + lambda * sum(Theta .* Theta);
endfunction