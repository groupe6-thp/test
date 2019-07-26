require "game"
require "board"

class Application
 def perform
 	puts "bienvenue dans le jeux morpion!!!!!"
 	@game = Game.new
 	@game.turn
 end
end

