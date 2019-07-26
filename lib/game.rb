require "player"
require "board"

class Game
	attr_accessor :player, :status, :board, :arra_players

   def initialize
   	@player1 = player.new("joueur 1")
   	@player2 = player.new("joueur 2")
   	@board = Board.new
   	@player = @player1
   	@arra_players = [@player1, @player2]
   	@status = "en cours"
   	@count_turns = 0
   end
   def turn
      while  @status == "en cours"
      	   show.new.show_board(@board)
      	   @board.play_turn(@player)

      	   if @board.victory?(@player, @status) == true
      	   	@status = @player
      	   	puts ""
      	   	show.new.show_board(@board)
      	   	new_orund

          end
             if @player == @player1
      	 @player == @player2
      	else
      		@player = player1
      	     end
      @count_turns += 1
             if @count_turns == 9 && @status == "en cours"
        	@statu = "nul"
        	puts "matsh nul.\n"
        	Show.new.show_board(@board)
             end
          end
   end
   def new_round
   	 puts "relance une mouvelle partie?"
   	 print ">"

   	 answer = gets.chomp
   	     if answer == "O"
   	     	@board = Board.new
   	     	@status = "en cours"
   	     	@count_turns = 0
   	     	puts "la partie du va commencer"

   	     else 
   	     	game_end
   	     end
   	 end

   def game_end
   	puts "fin du partie"
   

end

