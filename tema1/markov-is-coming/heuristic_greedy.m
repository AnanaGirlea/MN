function [path] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix

	% path -> the states chosen by the algorithm

  % TODO: heuristic_greedy implementation

  win = size(Adj) - 1;

  path = [start_position];
  visited = zeros(size(Adj));
  visited(start_position) = true;

  while ~isempty(path)
    position = path(end);
    if position == win
      return
    else
      neighbors = find(Adj(position,:));
      next_position = -1;
      for i = 1:length(neighbors)
        if ~visited(neighbors(i))
          if (next_position == -1 || probabilities(neighbors(i)) > probabilities(next_position))
            next_position = neighbors(i);
          end
        end
      end

      if next_position == -1
        path = path(1:end-1)
      else
        visited(next_position) = true;
        path = [path, next_position];
      endif
    end
  end

endfunction
