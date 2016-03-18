class Game
  attr_reader :human, :computer, :players

  def initialize
    @human = Player.new("player")
    @computer = Player.new("computer")
    @players = [human, computer]
  end

  def winner
    @winner ||= players.find { |player| player.score == 2 }
  end

  def play
    play_round until winner
    puts "\n#{winner.name.capitalize} wins!"
  end

  def play_round
    puts "#{human.name.capitalize} Score: #{human.score}, #{computer.name.capitalize} Score: #{computer.score}"
    players.each do |player|
      player.make_new_choice
      puts "#{player.name.capitalize} chose #{player.choice_unabbreviated}."
    end

    if human.choice == computer.choice
      puts "Tie, choose again."
    else
      winner = nil
      loser = nil
      if human.beats(computer.choice)
        winner = human
        loser = computer
      else
        winner = computer
        loser = human
      end
      puts "#{winner.choice_unabbreviated.capitalize} beats #{loser.choice_unabbreviated}, #{winner.name} wins round."
      winner.score += 1
    end
  end
end
