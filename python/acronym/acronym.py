import re

def abbreviate(words):
    return ''.join(capitalize_first(word) for word in abbrev_words(words))

def capitalize_first(word):
    first_letter = re.search(r'[a-zA-Z]', word)
    return first_letter[0].upper() if first_letter else ''

def abbrev_words(words):
    return re.split(r' |-', words)
