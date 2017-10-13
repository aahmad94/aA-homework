BLACKJACK_VALUE = {
  :deuce => 2,
  :three => 3,
  :four  => 4,
  :five  => 5,
  :six   => 6,
  :seven => 7,
  :eight => 8,
  :nine  => 9,
  :ten   => 10,
  :jack  => 10,
  :queen => 10,
  :king  => 10
}


class Hand
  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    sum = 0
    cards.each do |card|
      if card.value != :ace
        sum += BLACKJACK_VALUE[card.value]
      elsif sum + 11 <= 21
        sum += 11
      else
        sum += 1
      end
    end
    sum
  end

  def busted?
    points > 21
  end

  def hit(deck)
    raise "already busted" if busted?
    @cards += deck.take(1)
  end

  def beats?(other_hand)
    self.points > other_hand.points 
  end

  def return_cards(deck)
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
