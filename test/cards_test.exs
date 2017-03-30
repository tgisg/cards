defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck) #this is not a perfect test because shuffle could in theory return the same deck
    #can also do assert deck != Cards.shuffle(deck)
  end

  test "can deal a hand" do
    deck = Cards.create_deck
    {hand, remainder} = Cards.deal(deck, 1)
    hand_length = length(hand)
    remainder_length = length(remainder)
    assert hand_length == 1
    assert remainder_length == 19
    assert hand == ["Ace of Spades"]
  end
end
