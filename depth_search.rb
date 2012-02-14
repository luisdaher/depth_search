#Blind Search (Depth)

def copy_matrix matrix
  response = []
  
  matrix.each do |array|
    response << Array.new
    array.each do |value|
      response[response.size-1] << value
    end
  end
  response  
end

def copy_moves moves
  response = []
  
  moves.each do |move|
    response << move
  end
  response  
end

# finds the number of possible exits of a given matrix, considering the "exit" as the bottom left corner of the matrix
def expand matrix, x, y, level, moves
  total = 0
  matrix[x][y] = true

  if x == (matrix.size-1) and y == (matrix[0].size-1)
   puts "exit found!"
   puts moves.join ","
   puts ""
   return 1
  end 

  #down
  if !matrix[x+1].nil? and matrix[x+1][y] == false
    updated_moves = copy_moves(moves)
    updated_moves << "down"
    total+= expand(copy_matrix(matrix), x+1,y, level+1, updated_moves)
  end

  #up
  if !matrix[x-1].nil? and matrix[x-1][y] == false
    updated_moves = copy_moves(moves)
    updated_moves << "up"  
    total+=expand copy_matrix(matrix), x-1,y,level+1, updated_moves
  end
  
  #right
  if !matrix[x][y+1].nil? and matrix[x][y+1] == false
    updated_moves = copy_moves(moves)
    updated_moves << "right"  
    total+=expand copy_matrix(matrix), x,y+1,level+1, updated_moves
  end

  #left
  if !matrix[x][y-1].nil? and matrix[x][y-1] == false
    updated_moves = copy_moves(moves)
    updated_moves << "left"  
    total+=expand copy_matrix(matrix), x,y-1,level+1, updated_moves
  end
  
  return total
  
end


given_matrix = [[false, false, false, false],[false, false, false, false],[false, false, false, false],[false, false, false, false]]

puts "# of possibilities: " +expand(given_matrix, 0, 0, 0, Array.new).to_s
