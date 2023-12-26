function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns
	
	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state

  % TODO: decode_path implementation

  decoded_path = zeros(length(path) - 1, 2);
  for i = 1 : length(path) - 1
	decoded_path(i, 1) = floor((path(i)-1)/cols) + 1;
	decoded_path(i, 2) = mod(path(i)-1, cols) + 1;
  endfor

endfunction