function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % TODO: lasso_regression_cost_function implementation

	Error = 0;

	[m, n] = size(FeatureMatrix);

	for i = 1:m
		Error = Error + (Y(i) - FeatureMatrix(i, :) * Theta(2:end) - Theta(1))^2;
	endfor

	Error = Error / m;
	Error = Error + lambda * sum(abs(Theta));
endfunction