# Pauline Chane (@PaulineChane on GitHub)
# Ada Developers Academy C14
# Automated Testing - deck.rb
# 09/29/2020
# deck.rb

require_relative 'card'

class Deck

  def initialize
    @cards = []
    [:hearts, :spades, :diamonds, :clubs].each do |suit|
      (1..13).each do |value|
        @cards << Card.new(value, suit)
      end
    end
  end
  # returns nil for empty deck
  # returns Card object from deck otherwise
  def draw
    return @cards.empty? ? nil : @cards.pop
  end

  # shuffle cards in deck
  def shuffle
    @cards.shuffle!
  end

  # returns number of cards still in deck
  def count
    return @cards.length
  end
end
