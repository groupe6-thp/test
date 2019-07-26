
class Show
  def show_doar(board)
  	print "\t", "*"*13,"\n"
  	3.times do |x|
  		print "\t"
  		3.times do |y|
  			if board.rows_array[x][y].state == nil
  				print ". |"
  			else
  				print "#{board.rows_array[x][y].state} |"
  			end
  		end
  		puts
  		print "\t", "*"*13, "\n"
  	end
end
end