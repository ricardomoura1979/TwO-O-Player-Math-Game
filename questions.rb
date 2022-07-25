class Question
  attr_accessor :turn

  def initialize(turn)
    @turn = turn
  end

  def start
    num1 = rand(1..10)
    num2 = rand(1..10)

    puts "------ NEW TURN ------"
    puts "Player #{turn}: What is #{num1} + #{num2}?"
    print "> "

    answer = $stdin.gets.chomp.to_i

    if answer == num1 + num2
      puts "Correct!"
      return true
    else 
      puts "Incorrect!"
      return false
    end
  end

end