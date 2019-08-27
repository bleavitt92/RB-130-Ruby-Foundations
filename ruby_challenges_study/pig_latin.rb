class PigLatin 
  VOWELSOUNDS = %w(a e i o u yt xr)
  TWO_LETTER_COMBOS = %w(ch qu th)
  THREE_LETTER_COMBOS = %w(thr sch)

  def self.translate(string)
    string.split(' ').map! { |word| translate_word(word) }.join(' ')
  end

  def self.translate_word(word)
    if VOWELSOUNDS.include?(word[0]) || VOWELSOUNDS.include?(word[0..1])
      word + 'ay'
    elsif word.match(/\A[^aeiou]qu/) || THREE_LETTER_COMBOS.include?(word[0..2])
      word[3..-1] + word[0..2] + 'ay'
    elsif TWO_LETTER_COMBOS.include?(word[0..1])
      word[2..-1] + word[0..1] + 'ay'
    else 
      word[1..-1] + word[0] + 'ay'
    end
  end
end
