class PigLatin
  VOWELS = %w(a e i o u)

  def self.translate(string)
    converted_words = string.split.map do |word|
      translate_word(word)
    end
    converted_words.join(' ')
  end
  
  def self.translate_word(word)
    if start_with_vowel_sound(word)
      word.concat('ay')
    else
      split(word)
    end
  end

  def self.start_with_vowel_sound(word)
    word.match(/\A[aeiou]|\Ayt|\Axr/)
  end

  def self.split(word)
    split = word.match(/\A([^aeiou]*qu|[^aeiou]+)([aeiou]*.*)\Z/)
    split[2] + split[1] + 'ay'
  end
end
