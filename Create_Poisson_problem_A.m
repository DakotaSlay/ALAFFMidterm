function [ A ] = Create_Poisson_problem_A( N )

  A = zeros(N^2);
  % Create the archtypical matrix A for an N x N Poisson problem (5-point
  % stencil.

  

  for rowIndex = 1:N^2
      gridRow = ceil(rowIndex/N);
      for columnIndex = 1:N^2
          gridColumn = ceil(columnIndex/N);
  % Set the diagonal        
          if(gridRow==gridColumn)
              if (rowIndex==columnIndex)
                A(rowIndex,columnIndex) = 4;
  % Set the entries of the first sub and super diagonals              
              elseif((columnIndex == rowIndex + 1 || rowIndex == columnIndex + 1))
                A(rowIndex,columnIndex) = -1;
              end
 % Set the other off-diagonal entries             
          elseif(gridColumn>gridRow)
              if(columnIndex == rowIndex + N)
                  A(rowIndex,columnIndex) = -1;
              end
          elseif(gridRow>gridColumn)
              if(columnIndex == rowIndex - N)
                  A(rowIndex,columnIndex) = -1;
              end
          end
      end
  end

  
end



