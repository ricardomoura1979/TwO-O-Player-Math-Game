class Player
  attr_accessor :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lose_life
    @lives -= 1
  end
end

class Game
  attr_accessor :player1, :player2, :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def generate_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    @answer = num1 + num2
    puts "#{@current_player.name}: What does #{num1} plus #{num2} equal?"
  end

  def verify_answer(answer)
    if answer.to_i == @answer
      puts "YES! You are correct."
    else
      puts "Seriously? No!"
      @current_player.lose_life
    end
  end

  def game_over?
    @player1.lives == 0 || @player2.lives == 0
  end

  def winner
    if @player1.lives == 0
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3"
    else
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
    end
  end
end

player1 = Player.new("Player 1")
player2 = Player.new("Player 2")
game = Game.new(player1, player2)

while !game.game_over?
  game.generate_question
  answer = gets.chomp
  game.verify_answer(answer)
  game.switch_player
end

game.winner