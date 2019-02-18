import re

def abbreviate(words):
    return ''.join(capitalize_first(word) for word in abbrev_words(words))

def capitalize_first(word):
    return (re.search(r'[a-zA-Z]', word) or ('',))[0].upper()

def abbrev_words(words):
    return re.split(r' |-', words)
