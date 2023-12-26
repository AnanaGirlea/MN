function [classes] = predict_classes(X, weights, ...
                  input_layer_size, hidden_layer_size, ...
                  output_layer_size)
  % X -> the test examples for which the classes must be predicted
  % weights -> the trained weights (after optimization)
  % [input|hidden|output]_layer_size -> the sizes of the three layers
  
  % classes -> a vector with labels from 1 to 10 corresponding to
  %            the test examples given as parameter
  
  % TODO: predict_classes implementation

	Theta1 = reshape(weights(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
	
	Theta2 = reshape(weights((1 + (hidden_layer_size * (input_layer_size + 1))):end), output_layer_size, (hidden_layer_size + 1));
	

	m = size(X, 1);
	classes = [];

	for i = 1:m
		% perform forward propagation for each example
		xi = X(i, :)';

		a1 = [1; xi];
		z2 = Theta1 * a1;
		a2 = [1; sigmoid(z2)];

		z3 = Theta2 * a2;
		a3 = sigmoid(z3);

		% find the maximum value and its index
		[max_value, max_index] = max(a3);
		classes = [classes; max_index];
	endfor

endfunction
