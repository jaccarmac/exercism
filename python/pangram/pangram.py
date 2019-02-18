def is_pangram(sentence):
    english_letters = {letter for letter in "abdefghijklmnopqrstuvwxyz"}
    sentence_letters = {letter for letter in sentence.lower()}
    return english_letters.intersection(sentence_letters) == english_letters