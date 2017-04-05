require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new}
    @player1 = name1
    @player2 = name2
    place_stones
  end

  def place_stones
    @cups.each_index do |id|
      unless id == 6 || id == 13
        4.times {@cups[id] << :stone}
      end
    end
  end

  def valid_move?(start_pos)
    unless start_pos.between?(1,13)
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player)
    hand = []

    @cups[start_pos], hand = hand, @cups[start_pos]

    until hand.empty?
      start_pos = (start_pos + 1) % 14

      next if current_player == @player1 && start_pos == 13
      next if current_player == @player2 && start_pos == 6

      @cups[start_pos] << hand.shift
    end
    render
    next_turn(start_pos)

  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].empty?
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner
    
  end
end
