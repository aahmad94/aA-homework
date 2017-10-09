require_relative "dictionary.txt"

class Game

  attr_reader :player1, :player2, :current_player, :previous_player, :fragment, :dictionary

  def inintialize(player1, player2, dictionary)
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @previous_player = player2
    @fragment = ""
    @dictionary = dictionary
  end

  def play_round
    until dictionary.include?(fragment)
    end
  end

  def previous_player
    @player2
  end

  def next_player!
    @current_player = current_player == player1 ? player2 : player1
    @previous_player = previous_player == player2 ? player1 : player2
  end

  def valid_play?(string)
    if string.length > 1
      raise "Length is greater than 1!"
    end

    alphabet = ("a".."z").to_a

    unless alphabet.include?(string)
      raise "Not a valid move!"
    end

    test_fragment = fragment
    test_fragment = fragment + string

    dict_bool = dictionary.any? do |word|
      word.include?(test_fragment)
    end

    if dict_bool
      false
    else
      true
    end
  end

  def take_turn(player)
    puts "Enter a letter, #{player.name}: "
    input = gets.chomp
    if valid_play?(input)
      @fragment += input
    else
      puts "Boo you lose.."
    end
  end
end

if $0 == __FILE__
  dictionary = File.readlines("dictionary.txt").map(&:chomp)
  game = Game.new(player1, player2, dictionary)
end
