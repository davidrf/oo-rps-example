class Player
  VALID_INPUTS = ["r", "p", "s"]
  CHOICE_BEATS_CONVERSIONS = {
    "r" => "s",
    "s" => "p",
    "p" => "r"
  }
  UNABBREVIATION_CONVERSIONS = {
    "r" => "rock",
    "p" => "paper",
    "s" => "scissors"
  }

  attr_reader :name, :choice
  attr_accessor :score

  def initialize(name)
    @name = name
    @score = 0
    @choice = nil
  end

  def make_new_choice
    if name == "computer"
      self.choice = VALID_INPUTS.sample
    else
      print "Choose rock (r), paper (p), or scissors (s): "
      self.choice = gets.chomp
      until VALID_INPUTS.include?(choice)
        puts "Invalid entry, try again."
        self.choice = gets.chomp
      end
    end
  end

  def beats(other_choice)
    CHOICE_BEATS_CONVERSIONS[choice] == other_choice
  end

  def choice_unabbreviated
    UNABBREVIATION_CONVERSIONS[choice]
  end

  private

  attr_writer :choice
end
