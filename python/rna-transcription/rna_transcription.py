def to_rna(dna_strand):
    translations = {'C': 'G', 'G': 'C', 'A': 'U', 'T': 'A'}
    return ''.join(translations[nucleotide] for nucleotide in dna_strand)
