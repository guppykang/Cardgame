defmodule Cards do
  def create_deck do 
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Clubs", "Hearts", "Diamonds", "Spades"]

    List.flatten(for suit <- suits, value <- values do 
      "#{value} of #{suit}"
    end)


  end

  def shuffle(deck) do 
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do 
    Enum.member?(deck, card)
  end


  def deal(deck, hand_size) do 
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do 
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def readBinaryDeck(filename) do

    case File.read(filename) do 
      { :ok, binary } -> realData = :erlang.binary_to_term(binary)
      { :error, _reason } -> "That file does not exist"
    end


  end 
  
  def create_hand(hand_size) do 
    Cards.create_deck
    |> Cards.shuffle 
    |> Cards.deal(hand_size)
  end

end