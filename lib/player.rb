require "game"

class Player

   def initialize(player)
   	puts "#{player} : nom du joueur!!"
   	print ">"
   	@name = gets.chomp 
   	puts "choisir votre signe X ou O"
   	print ">"
   	@sign = gets.chomp[0]


   end

end