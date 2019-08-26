class PigLatin
  VOWELS = %w(a e i o u)

  def self.translate(string)
    converted_words = string.split.map do |word|
      
      first_letter = word[0]
      first_two = word[0, 2]
      first_three = word[0, 3]
  
      if %w(thr sch squ).include?(first_three)
        word.delete_prefix!(first_three)
        word.concat(first_three + 'ay')
  
      elsif %w(ch qu th).include?(first_two)
        word.delete_prefix!(first_two)
        word.concat(first_two + 'ay')
  
      elsif VOWELS.include?(first_letter) || first_two == 'xr' || first_two == 'yt'
        word.concat('ay')
  
      else
        word.delete_prefix!(first_letter)
        word.concat(first_letter + 'ay')
      end
    end
    converted_words.join(' ')
  end
end

p PigLatin.translate('pig')
p PigLatin.translate('ear')
p PigLatin.translate('koala')
p PigLatin.translate('queen')
p PigLatin.translate('square')