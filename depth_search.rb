#Blind Search (Depth)
@moves_array  = Array.new
def copy_matrix matrix
  response = []
  matrix.each{|array| response << array.dup }
  response 
end

# finds the number of possible exits of a given matrix, considering the "exit" as the bottom right corner of the matrix
def expand(matrix, x, y, moves = Array.new)
  matrix[x][y] = true

  @moves_array.push(moves) if x == (matrix.size-1) and y == (matrix[0].size-1)

  expand(copy_matrix(matrix), x+1,y, moves.dup.push("down")) if !matrix[x+1].nil? and !matrix[x+1][y] and x+1<matrix.size

  expand(copy_matrix(matrix), x-1,y, moves.dup.push("up")) if !matrix[x-1].nil? and !matrix[x-1][y] and x-1>=0
  
  expand(copy_matrix(matrix), x,y+1, moves.dup.push("right")) if !matrix[x][y+1].nil? and !matrix[x][y+1] and y+1<matrix[0].size

  expand(copy_matrix(matrix), x,y-1, moves.dup.push("left")) if !matrix[x][y-1].nil? and !matrix[x][y-1] and y-1>=0
end

given_matrix = [[false, false, false, false],[false, false, false, false],[false, false, false, false],[false, false, false, false]]

expand(given_matrix, 0, 0).to_s
puts @moves_array.uniq.size