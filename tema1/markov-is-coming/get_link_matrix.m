function [Link] = get_link_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  % Link -> the link matrix associated to the given labyrinth
  
  % TODO: get_link_matrix implementation
  m = size(Labyrinth, 1);
  n = size(Labyrinth, 2);

  nodes = m * n + 2;

  edges = zeros(nodes, 1);

  adj = get_adjacency_matrix(Labyrinth);

  [lines, columns, elem] = find(adj);

	% count number of edges of each node
  for i = 1 : length(lines)
    edges(lines(i))++;
  endfor

	% divide line by number of edges
  for i = 1 : length(elem)
    elem(i) = 1 / edges(lines(i));
  endfor

  Link = sparse(lines, columns, elem, nodes, nodes);

endfunction
