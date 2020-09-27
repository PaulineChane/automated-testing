require_relative 'test_helper'

describe Card do
  describe "You can create a Card instance" do

    it "Can be created" do
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        (1..13).each do |value|
          card = Card.new(value, suit)
          expect(card).must_be_instance_of Card
        end
      end
    end

    it "Raises an ArgumentError for invalid parameters" do
      # To raise an ArgumentError in card.rb
      # raise ArgumentError.new
      expect {Card.new(0, :diamonds)}.must_raise ArgumentError
      expect {Card.new(14, :diamonds)}.must_raise ArgumentError
      expect {Card.new(14, :clovers)}.must_raise ArgumentError
    end
  end

  describe "Testing to_s" do

    it "to_s returns a readable String value logically for values 2-10" do
      (2..10).each do |value| # each value between 2-10 inclusive
        card = Card.new(value, :hearts)
        expect(card.to_s).must_equal "#{value} of hearts" # verify matching string
      end
    end

    it "to_s returns a readable String value for Ace, Jack, Queen, King" do
      # hold instances of Ace, Jack Queen, King cards
      face_str = [Card.new(1, :spades), Card.new(11, :clubs), Card.new(12, :hearts), Card.new(13, :diamonds)]
      # holds corresponding expected result
      to_s_result= ["Ace of spades", "Jack of clubs", "Queen of hearts", "King of diamonds"]
      # test that to_s leads to matching face_str and to_s_result elements per same index.
      face_str.length.times do |i|
        expect(face_str[i].to_s).must_equal to_s_result[i]
      end
    end
  end

  describe "Reader methods" do

    it "Can retrieve the value of the card using a `.value`." do
      13.times do |i| # for all card values
        card = Card.new(i + 1, :diamonds) # create card instances with just a single symbol
        expect(card.value).must_equal i + 1 # verify value
        expect(card.value).must_be_instance_of Integer # verify data type
      end
    end

    it "Can retrieve the value of the card using a `.suit`." do
      [:hearts, :spades, :clubs, :diamonds].each do |suit| # for all suits
        card = Card.new(2, suit) # create card instances with same value
        expect(card.suit).must_equal suit # verify suit
        expect(card.suit).must_be_instance_of Symbol # verify data type
      end
    end
  end

end
