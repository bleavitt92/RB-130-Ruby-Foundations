require 'pry'
class Poker 
  CARD_VALUES = {
    'J' => 11,
    'Q' => 12,
    'K' => 13, 
    'A' => 14
  }
  attr_accessor :hand1, :hand2

  def initialize(hands)
    @hands = hands
    @hand1 = hands[0]
    @hand2 = hands[1]
  end

  def number_of_hands
    @hands.size
  end

  def format_facecards(hand)
    card_values = hand.map { |card| card.split('')[0] }
    card_values.map! { |val| CARD_VALUES.keys.include?(val) ? CARD_VALUES[val] : val.to_i }
  end

  def best_hand
    @hands.each_with_index do |hand, i|
      binding.pry
      next if i == 0
      break if i == number_of_hands-1
      self.hand1 = best_round[0]
      self.hand2 = @hands[i+1]
    end
    binding.pry
    best_round
  end

  def best_round
    return [@hand1] if @hand2 == nil
    return straight_flush_winner unless straight_flush_winner == nil
    return four_of_a_kind_winner unless four_of_a_kind_winner == nil
    return fullhouse_winner unless fullhouse_winner == nil
    return flush_winner unless flush_winner == nil
    return straight_winner unless straight_winner == nil
    return three_of_a_kind_winner unless three_of_a_kind_winner == nil
    return two_pair_winner unless two_pair_winner == nil
    return pair_winner if pair_winner != nil
    high_card_winner
  end

  def straight_flush_winner
    if straight_flush?(@hand1) > straight_flush?(@hand2)
      [@hand1]
    elsif straight_flush?(@hand1) < straight_flush?(@hand2)
      [@hand2]
    elsif straight_flush?(@hand1) == straight_flush?(@hand2) && straight_flush?(@hand1) != 0
      [@hand1, @hand2]
    end
  end

  def straight_flush?(hand)
    card_values = format_facecards(hand)
    straight?(hand)>0 && flush?(hand)>0 ? card_values.max.to_i : 0
  end

  def four_of_a_kind_winner
    if four_of_a_kind?(@hand1) > four_of_a_kind?(@hand2)
      [@hand1]
    elsif four_of_a_kind?(@hand1) < four_of_a_kind?(@hand2)
      [@hand2]
    end
  end 
  
  def four_of_a_kind?(hand)
    card_values = format_facecards(hand)

    four_of_a_kind = card_values.select {|card| card_values.count(card) == 4}.uniq!

    return 0 if four_of_a_kind == nil
    four_of_a_kind.map(&:to_i).max
  end

  def fullhouse_winner
    if fullhouse?(@hand1) > fullhouse?(@hand2)
      [@hand1]
    elsif fullhouse?(@hand1) < fullhouse?(@hand2)
      [@hand2]
    end
  end

  def fullhouse?(hand)
    if pair?(hand)>0 && three_of_a_kind?(hand)>0
      three_of_a_kind?(hand)
    else
      0
    end
  end

  def flush_winner
    if flush?(@hand1) > flush?(@hand2)
      [@hand1]
    elsif flush?(@hand1) < flush?(@hand2)
      [@hand2]
    end
  end 

  def flush?(hand)
    card_values = format_facecards(hand)
    card_faces = hand.map { |card| card.split('')[1] }
    return card_values.max.to_i if card_faces.all? { |suit| suit == 'S' } ||
                                   card_faces.all? { |suit| suit == 'D' } ||
                                   card_faces.all? { |suit| suit == 'H' } ||
                                   card_faces.all? { |suit| suit == 'C' }
    0
  end

  def straight_winner
    if straight?(@hand1) > straight?(@hand2)
      [@hand1]
    elsif straight?(@hand1) < straight?(@hand2)
      [@hand2]
    end
  end

  def straight?(hand)
    card_values = format_facecards(hand)
    card_values.push(1).delete(14) if card_values.include?(14)

    if card_values.max - card_values.min == 4 && pair?(hand) == 0 && three_of_a_kind?(hand) == 0
      card_values.max
    else
      0
    end
  end

  def three_of_a_kind_winner
    if three_of_a_kind?(@hand1) > three_of_a_kind?(@hand2)
      [@hand1]
    elsif three_of_a_kind?(@hand1) < three_of_a_kind?(@hand2)
      [@hand2]
    end
  end

  def three_of_a_kind?(hand)
    card_values = format_facecards(hand)
    three_of_a_kind = card_values.select {|card| card_values.count(card) == 3}.uniq!
    return 0 if three_of_a_kind == nil
    three_of_a_kind.map(&:to_i).max
  end

  def two_pair_winner
    if two_pair?(@hand1) > two_pair?(@hand2)
      [@hand1]
    elsif two_pair?(@hand1) < two_pair?(@hand2)
      [@hand2]
    end
  end

  def two_pair?(hand) # returns 0 if no two-pair, returns larger pair number if have two pairs
    card_values = format_facecards(hand)
    two_pair = card_values.select {|card| card_values.count(card) == 2}.uniq!
    return 0 if two_pair == nil || two_pair.size != 2
    two_pair.map(&:to_i).max
  end

  def pair_winner
    if pair?(@hand1) > pair?(@hand2)
      [@hand1]
    elsif pair?(@hand1) < pair?(@hand2)
      [@hand2]
    end
  end

  def pair?(hand)
    card_values = format_facecards(hand)
    pairs = card_values.select {|card| card_values.count(card) == 2}.uniq!
    
    return 0 if pairs == nil
    pairs.join.to_i
  end

  def high_card_winner
    if highest_card?(@hand1) > highest_card?(@hand2)
      [@hand1]
    elsif highest_card?(@hand1) < highest_card?(@hand2)
      [@hand2]
    end
  end

  def highest_card?(hand)
    format_facecards(hand)
    hand.max
  end
end

    spade_straight_to_9 = %w(9S 8S 7S 6S 5S)
    diamond_straight_to_9 = %w(9D 8D 7D 6D 5D)
    three_of_4 = %w(4D 4S 4H QS KS)
    hands = [spade_straight_to_9, diamond_straight_to_9, three_of_4]
    game = Poker.new(hands)
    p game.best_hand
