function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples
  
  % TODO: prepare_for_regression implementation

	[m, n] = size(InitialMatrix);

	FeatureMatrix = [];
	for i = 1:m
		line = [];
		for j = 1:n
			% If the cell is a number, copy it over
			if isnumeric(InitialMatrix{i, j})
				line = [line InitialMatrix{i, j}];
			endif

			% If the cell is a "no", write a 0
			if strcmp(InitialMatrix{i, j}, "no")
				line = [line 0];
			endif

			% If the cell is a "yes", write a 1	
			if strcmp(InitialMatrix{i, j}, "yes")
				line = [line 1];
			endif

			% If the cell is a "semi-furnished", write a 1 0
			if strcmp(InitialMatrix{i, j}, "semi-furnished")
				line = [line 1 0];
			endif

			%	If the cell is a "unfurnished", write a 0 1
			if strcmp(InitialMatrix{i, j}, "unfurnished")
				line = [line 0 1];
			endif

			% If the cell is a "furnished", write a 0 0
			if strcmp(InitialMatrix{i, j}, "furnished")
				line = [line 0 0];
			endif

		endfor

		FeatureMatrix = [FeatureMatrix; line];
	endfor
endfunction