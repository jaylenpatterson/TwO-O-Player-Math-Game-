class Start_Game
  attr_accessor :player1, :player2, :current_player
  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @player1Lives = 3
    @player2Lives = 3
    @current_player = coin_flip
    intro
  end

  def start
    question_gen
  end


  def coin_flip
    x = rand(0..1)
    x < 0.5 ? current_player = player1 : current_player = player2
  end

  def score(current_player)
    if self.current_player == player1
      @player1Lives -= 1
      puts "P1:#{@player1Lives} P2:#{@player2Lives}"
    end

    if self.current_player == player2
      @player2Lives -= 1
      puts "P1:#{@player1Lives} P2:#{@player2Lives}"
    end
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

    player_response(answer)
  end

  def player_response(answer)
    # Gets Response
    response = gets.chomp

    # Results
    if response.to_i == answer
      puts "Yes! You're correct!"
      return next_turn

    else
      puts "Seriously? No!"
      score(self.current_player)
      return next_turn
    end
  end

  def next_turn
    if @player1Lives == 0
      return "GAME OVER! #{self.player2} Wins with #{@player2Lives} lives! "
    end

    if @player2Lives == 0
      return "GAME OVER! #{self.player1} Wins with #{@player1Lives} lives! "
    end
    # If current player is player 1 change current player to player 2  and vice versa

    if self.current_player == player1
       self.current_player = player2
       puts "----- NEW TURN -----"
       return question_gen
    end

    if self.current_player == player2
      self.current_player = player1
      puts "----- NEW TURN -----"
      return question_gen
    end
  end

end

jay_vs_juju = Start_Game.new("jaylen", "juliet")


puts jay_vs_juju.start
