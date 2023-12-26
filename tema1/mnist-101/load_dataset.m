function [X, y] = load_dataset(path)
  % path -> a relative path to the .mat file that must be loaded
  
  % X, y -> the training examples (X) and their corresponding labels (y)
  
  % TODO: load_dataset implementation

  % Load the dataset from the .mat file
  load(path, "X", "y");
endfunction
