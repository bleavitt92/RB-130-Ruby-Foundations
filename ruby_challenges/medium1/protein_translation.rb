class InvalidCodonError < StandardError
end

class Translation
  CODON_LOOKUP = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA' => 'STOP',
  }

  def self.of_codon(rna_string)
    codons = rna_string.scan(/\w{3}/)
    protien = []
    codons.each do |codon|
      raise InvalidCodonError if !CODON_LOOKUP.include?(codon)
      break if CODON_LOOKUP[codon] == 'STOP'

      protien << CODON_LOOKUP[codon]
    end
    protien.empty? ? "STOP" : protien.join(' ')
  end

  def self.of_rna(string)
    of_codon(string).split
  end
end
