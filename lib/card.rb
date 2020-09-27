# Pauline Chane (@PaulineChane on GitHub)
# Ada Developers Academy C14
# Automated Testing - card.rb
# 09/29/2020
# card.rb
class Card
  attr_reader :value, :suit
  SUITS = [:hearts, :spades, :clubs, :diamonds]
  VALUES_TO_STR = ["Ace", 2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King"]
  def initialize(value, suit)
    raise ArgumentError, "Value must be between 1-13 inclusive" unless Array(1..13).include?(value)
    raise ArgumentError, "Invalid suit" unless SUITS.include?(suit)

    @value = value
    @suit = suit

  end
  # to_s accounts for Ace, Jack, Queen, King cards being face cards.
  def to_s
    return "#{VALUES_TO_STR[@value - 1]} of #{@suit.to_s}"
  end

end