function [G, c] = get_Jacobi_parameters (Link)
	% Link -> the link matrix (edge with probabilities matrix)
	
  % G -> iteration matrix
	% c -> iteration vector
	
  % TODO: get_Jacobi_parameters
  
  GRow = [];
  GCol = [];
  GElem = [];

  CRow = [];
  CCol = [];
  CElem = [];

  nodes = size(Link);
  [row, col, elem] = find(Link);

  for i = 1:length(row)
		% isolate first nodes-2 by nodes-2 submatrix
    if (row(i) < nodes-1 && col(i) < nodes-1)
      GRow = [GRow, row(i)];
      GCol = [GCol, col(i)];
      GElem = [GElem, elem(i)];
    endif  

		% extract second to last column - the "win" column
    if (row(i) < nodes - 1 && col(i) == nodes-1)
      CRow = [CRow, row(i)];
      CCol = [CCol, 1];
      CElem = [CElem, elem(i)];
    endif
  endfor

  G = sparse(GRow, GCol, GElem, nodes-2, nodes-2);
  c = sparse(CRow, CCol, CElem, nodes-2, 1);
endfunction
