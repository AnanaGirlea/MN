function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights
  
	% rewrite normal equatiojn as a system
	A = FeatureMatrix' * FeatureMatrix;
	b = FeatureMatrix' * Y;


	[m, n] = size(FeatureMatrix);
	Theta = zeros(n, 1);

	% check if A is positive definite
	eigA = eig(A);
	for i = 1:rank(A)
		if eigA(i) <= 0
			Theta = [0; Theta];
			return;
		endif
	endfor

	% conjugate gradient method
	prev_r = b - A * Theta;
	v = prev_r;

	tol_sq = tol * tol;
	k = 1;

	while (k <= iter && prev_r' * prev_r > tol_sq) 
		t = (prev_r' * prev_r) / (v' * A * v);
		Theta = Theta + t * v;
		r = prev_r - t * A * v;
		s = (r' * r) / (prev_r' * prev_r);
		v = r + s * v;
		prev_r = r;
		k = k+1;
	endwhile 

	Theta = [0; Theta];
endfunction