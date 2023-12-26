function [Adj] = get_adjacency_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Adj -> the adjacency matrix associated to the given labyrinth
  
  % TODO: get_adjacency_matrix implementation

  m = size(Labyrinth, 1);
  n = size(Labyrinth, 2);
  nodes = m * n + 2;
  win = nodes - 1;
  lose = nodes;  

	% 4 directions of neighbours
  dir_x = [0 0 1 -1];
  dir_y = [-1 1 0 0];
  
  Adj = sparse(nodes, nodes);
  for i = 1:m
    for j = 1:n
      current_id = (i-1) * n + j;

			% iterate the neighbour
      for dir = 1:4
				% coordinates of the neighbour
        ni = i + dir_x(dir);
        nj = j + dir_y(dir);

        neighbour_id = (ni-1) * n + nj;

        % ni = 0 or ni = m+1 = WIN
        if (ni == 0 || ni == m+1)
          neighbour_id = win;
        endif
        
        % nj = 0 or nj = n+1 = LOSE
        if (nj == 0 || nj == n+1)
          neighbour_id = lose;
        endif

				% if there is no wall, add the edge
        if (bitget(Labyrinth(i, j), dir) == 0)
          Adj(current_id, neighbour_id) = 1;
        endif

      endfor
    endfor
  endfor
	
	% add the edges from win and lose to themselves
  Adj(win, win) = 1;
  Adj(lose, lose) = 1;
endfunction
