class Start_Game
  attr_accessor :player1, :player2, :current_player
  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @current_player = coin_flip
  end

  def coin_flip
    x = rand(0..1)
    x < 0.5 ? current_player = player1 : current_player = player2
  end

  def intro
    puts "Welcome to the infamous Math Gauntlet!! Player #{@current_player} will go first!"
  end

  def question_gen
    #Creates random num
    num1 = rand(1..20).floor
    num2 = rand(1..20).floor
    answer = num1 + num2
    
    #Asks question to current player
    print "#{self.current_player}: What does #{num1} plus #{num2} equal? "

    # Gets Response
    response = gets.chomp

    # Results
    if response == answer
      puts "Correct"
    else
      puts "Sorry!"
    end

    # Change turn
    next_turn
  end

  def next_turn
    # If current player is player 1 change current player to player 2  and vice versa

    if self.current_player == player1
       self.current_player = player2
       return question_gen
    end

    if self.current_player == player2
      self.current_player = player1
      return question_gen
    end
    
  end
end

jay_vs_juju = Start_Game.new("jaylen", "juliet")


puts jay_vs_juju.question_gen
puts jay_vs_juju.next_turn