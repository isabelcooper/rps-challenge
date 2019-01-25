require_relative 'player'

class Round

  def self.create(player)
    @round = Round.new(player)
  end

  def self.this_round
    @round
  end

  attr_reader :players, :current_turn

  def initialize(player, computer = Player.new("Computer"))
    @players = [player, computer]
    @current_turn = player
  end

  def store_and_switch(move)
    store_move(move)
    switch_turn
  end

  def computer_move
    random_move
    switch_turn
  end

  def opponent
    @players.select { |player| player != @current_turn }.first
  end

  def switch_turn
    @current_turn = opponent
  end

  # def return_last_moves
  #   @players.each { |player| player.moves.last }
  # end

  private

  def random_move
    move = generate_random
    store_move(move)
  end

  def generate_random
    options = ["scissor", "rock", "paper"]
    options[rand(0..2)]
  end

  def store_move(move)
    @current_turn.store_move(move)
  end
end
