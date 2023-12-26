function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights

	Theta = zeros(n, 1);

	for k = 1:iter

		% compute the gradient
		grad = [];
		for j = 1:n
			g = 0;
			for i = 1:m
				g = g + (FeatureMatrix(i, :) * Theta - Y(i)) * FeatureMatrix(i, j);
			endfor
			g = g / m;
			grad = [grad; g];
		endfor

		% update the weights
		Theta = Theta - alpha * grad;
	endfor

	Theta = [0; Theta];
endfunction