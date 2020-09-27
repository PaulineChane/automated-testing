# Pauline Chane (@PaulineChane on GitHub)
# Ada Developers Academy C14
# Automated Testing - deck_test.rb
# 09/29/2020
# wrote tests to validate functionality of deck.rb
require_relative 'test_helper'

describe Deck do
  # Credit to Chris for the idea, thank you!
  before do
    @test_deck = Deck.new # Deck object
  end
  describe "constructor" do
    it "can instantiate a Deck object" do
      expect(@test_deck).must_be_instance_of Deck # verify instance of Deck created
      # we can actually test whether we initialized @cards correctly through our "draw" method tests.
    end
  end
  describe "draw" do
    it "must respond to draw method call" do
      expect(@test_deck).must_respond_to :draw
    end

    it "must successfully return a Card upon call" do
      open_deck = [] # instantiate the same way as in the constructor, but save string ver for comparison
      [:hearts, :spades, :diamonds, :clubs].each do |suit|
        (1..13).each do |value|
          card_to_str = Card.new(value, suit)
          open_deck << card_to_str.to_s
        end
      end

      52.times do
        card = @test_deck.draw
        open_deck.delete(card.to_s) # delete corresponding card in open_deck array
        expect(card).must_be_instance_of Card # verify correct object type returned
      end

      expect(open_deck).must_be_empty # if empty, we confirm every Card in @cards is a unique card from a standard deck
    end

    it "must return nil if deck is empty" do
      52.times do # empty out deck
        card = @test_deck.draw
      end

      nil_card = @test_deck.draw # should be nil
      expect(nil_card).must_be_nil # this will also verify that Deck is initializing with correct # of Card objects
    end
  end

  describe "shuffle" do
    it "must respond to shuffle method call" do
      expect(@test_deck).must_respond_to :shuffle
    end
  end

  describe "count" do
    it "must respond to count method call" do
      expect(@test_deck).must_respond_to :count
    end

    it "must return the correct number of cards still in the deck" do
      52.times do |i| # assume i = 0, meaning at line 61 we need to subtract i + 1 from 52 to verify count
        @test_deck.draw
        expect(@test_deck.count).must_equal 52 - (i + 1) # should deplete by 1 every draw
      end
    end
  end
end
