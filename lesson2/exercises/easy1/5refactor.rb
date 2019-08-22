# The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.

# Write a program that deciphers and prints each of these names .

# each letter is rotated 13 letters later and swapped. 
# create a nested array where [[letters 1-13], [letters14-26]]
# iterate through the input string. for each character find the letter in the nested array, figure out its index, then replace it with the same index from the other nested array.
# use array.find_index(letter)

ENCRYPTED_PIONEERS = [
'Nqn Ybirynpr',
'Tenpr Ubccre',
'Nqryr Tbyqfgvar',
'Nyna Ghevat',
'Puneyrf Onoontr',
'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
'Wbua Ngnanfbss',
'Ybvf Unvog',
'Pynhqr Funaaba',
'Fgrir Wbof',
'Ovyy Tngrf',
'Gvz Orearef-Yrr',
'Fgrir Jbmavnx',
'Xbaenq Mhfr',
'Fve Nagbal Ubner',
'Zneiva Zvafxl',
'Lhxvuveb Zngfhzbgb',
'Unllvz Fybavzfxv',
'Tregehqr Oynapu'
]

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |accum, character|
    accum + encrypt(character)
  end
end

def encrypt(letter)
  case letter
  when ('a'..'m'), ('A'..'M') then (letter.ord + 13).chr
  when ('n'..'z'), ('N'..'Z') then (letter.ord - 13).chr
  when ' ' then ' '
  else          letter
  end
end

ENCRYPTED_PIONEERS.each do |name|
  puts rot13(name)
end