function [Y, InitialMatrix] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file
  
  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

	% read the entire .csv to get size, because strings get converted to 0
	X = csvread(file_path);
	X = X(2:end, :);
	[m, n] = size(X);

	Y = zeros(m, 1);
	InitialMatrix = cell(m, n-1);
	
	fid = fopen(file_path);

	% Skip the name of columns
	fgetl(fid);

	for i = 1:m
		line = fgetl(fid);

		% Split the line by comma
		[values, rest] = strtok(line, ',');

		% Get the first value
		Y(i) = str2num(values);

		% Get the rest of the values
		for j = 1:n-1
			[values, rest] = strtok(rest, ',');
			InitialMatrix{i, j} = values;

			% If the value is a number, convert it
			if !isnan(str2num(values))
				InitialMatrix{i, j} = str2num(values);
			endif	
		endfor
	endfor


	
endfunction