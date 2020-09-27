# Pauline Chane (@PaulineChane on GitHub)
# Ada Developers Academy C14
# Automated Testing - card.rb
# 09/29/2020
# card.rb
class Card
  attr_reader :value, :suit
  SUITS = [:hearts, :spades, :clubs, :diamonds]
  def initialize(value, suit)
    raise ArgumentError, "Value must be between 1-13 inclusive" unless Array(1..13).include?(value)
    raise ArgumentError, "Invalid suit" unless SUITS.include?(suit)

    @value = value
    @suit = suit

  end

  def to_s
    return "#{@value} of #{@suit.to_s}"
  end

end
