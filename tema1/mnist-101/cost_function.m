function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)

  % params -> vector containing the weights from the two matrices
  %           Theta1 and Theta2 in an unrolled form (as a column vector)
  % X -> the feature matrix containing the training examples
  % y -> a vector containing the labels (from 1 to 10) for each
  %      training example
  % lambda -> the regularization constant/parameter
  % [input|hidden|output]_layer_size -> the sizes of the three layers
  
  % J -> the cost function for the current parameters
  % grad -> a column vector with the same length as params
  % These will be used for optimization using fmincg
  
  % TODO: cost_function implementation

  % TODO1: get Theta1 and Theta2 (from params). Hint: reshape

	Theta1 = reshape(params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
	
	Theta2 = reshape(params((1 + (hidden_layer_size * (input_layer_size + 1))):end), output_layer_size, (hidden_layer_size + 1));
	
	[m, n] = size(X);

	D2 = zeros(output_layer_size, hidden_layer_size + 1);
	D1 = zeros(hidden_layer_size, input_layer_size + 1);
	  
	% perform forward propagation
	A1 = [ones(1, m); X'];
	Y = zeros(output_layer_size, m);
	for i = 1:m
		Y(y(i), i) = 1;
	endfor

	Z2 = Theta1 * A1;
	A2 = [ones(1, m); sigmoid(Z2)];
	Z3 = Theta2 * A2;
	A3 = sigmoid(Z3);

	% perform back propagation
	d3 = A3 - Y;
	D2 = D2 + d3 * A2';

	d2 = (Theta2' * d3);
	d2 = d2 .* (A2 .* (1 - A2));
	d2 = d2(2:end, :);
	D1 = D1 + d2 * A1';

	% compute the cost function
	J = sum(sum(-Y .* log(A3) - (1 - Y) .* log(1 - A3)));
	J = J / m;
	J = J + (lambda / (2 * m)) * (sum(sum(Theta1(:, 2:end) .^ 2)) + sum(sum(Theta2(:, 2:end) .^ 2)));

	% compute the gradients
	Theta1_grad = D1 / m;
	Theta1_grad(:, 2:end) += (lambda / m) * Theta1(:, 2:end);

	Theta2_grad = D2 / m;
	Theta2_grad(:, 2:end) += (lambda / m) * Theta2(:, 2:end);

	grad = [reshape(Theta1_grad, hidden_layer_size * (input_layer_size+1), 1);
					reshape(Theta2_grad, output_layer_size * (hidden_layer_size+1), 1)];

endfunction
