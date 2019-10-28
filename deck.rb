require_relative 'card'
class Deck
  # All ranks, from 7 to ace
  RANKS=(7..10).to_a + [:jack,:queen,:king,:ace]

  #All four suits
  SUITS=[:hearts,:clubs,:diamonds,:spades]

  def self.all
    #for every suit next to every rank
    SUITS.product(RANKS).map do |suit,rank|
      Card.build(suit,rank)
    end
  end

end