require "application"
require "board_case"
require "game"
require "player"
require "show"

class Board

	attr_accessor :rows_array
   def initialize
         @a1 = BoardCase.new("1")
         @a2 = BoardCase.new("2")
         @a3 = BoardCase.new("3")
         @b1 = BoardCase.new("4")
         @b2 = BoardCase.new("5")
         @b3 = BoardCase.new("6")
         @c1 = BoardCase.new("7")
         @c2 = BoardCase.new("8")
         @c9 = BoardCase.new("9")
         @rows_array = [ [@a1, @a2, @a3], [@b1, @b2, @b3], [@c1, @c2,@c3]]
         @all_board_case = ["1", "2","3", "4", "5", "6", "7", "8", "9"]

   end

   def play_turn(player)

   	puts "#{player.name}, que veux tu jouer,choisir un numero de case de 1 à 9"
   	print ">"
   	player_case = gets.chomp.upcase
   	while !@all_board_case.include?(player_case)
   		puts "choisis une autre case qui n'est pas encore cochée"
   		print ">"
   		player_case = gets.chomp.upcase

   end
   
   case player_case
        when "1"
         @a1.state = player.sign
         @all_board_case.delete("1")

        when "2"
         @a2.state = player.sign
         @all_board_case.delete("2")

        when "3"
     	@a3.state = player.sign
     	@all_board_case.delete("3")

        when "4"
     	@b1.state = player_sign
     	@all_board_case.delete("4")

        when "5"
     	@b2.state = player_sign
     	@all_board_case.delete("5")

        when "6"
     	@b3.state = player_sign
     	@all_board_case.delete("6")

        when "7"
     	@c1.state = player_sign
     	@all_board_case.delete("7")
        when "8"
     	@c2.state = player_sign
     	@all_board_case.delete("8")

        when "9"
     	@c3.state = player_sign
     	@all_board_case.delete("9")
			     	 
      end


        def victory?(player, status)
     	  if (@a1.state == @a2.state) && (@a2.state == @a3.state) && (@a1.state != "_")
     		puts "#{player.name} a gagné!!\n"
     		return true
        	elsif (@b1.state == @b2.state) && (@b2.state == @b3.state) && (@b1.state != "_")
     		puts "#{player.name} a gagné!!\n"
            return true
     	    elsif (@c1.state == @c2.state) && (@c2.state == @b3.state) && (@c1.state != "_")
            puts "#{plauer.name} a gagné!!"
            return true
            elsif (@a1.state == @b1.state) && (@b1.state == @c1.state) && (@a1.state != "_")
            puts "#{player.name} a gagné!!\n"
            return true

            elsif (@a2.state == @b2.state) && (@b2.state == @c2.state) && (@a2.state != "_")
            puts "#{player.name} a gagné!!\n"
            return true
            elsif (@a3.state == @b3.state) && (@b3.state == @c3.state) && (@a3.state != "_")
            puts "#{player.name} a gagné!!\n"
            return true 
            elsif (@a1.state == @b2.state) && (@b2.state == @c3.state) && (@a1.state != "_")
            puts "#{player.name} a gagné!!\n"
            return true
            elsif (@a3.state == @b2.state) && (@b2.state == @c1.state) && (@a3.state != "_")     	
            puts "#{player.name} a gagné!!\n"
            return true
          else
       end
end
     
