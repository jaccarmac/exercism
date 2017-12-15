def is_isogram(string):
    letters = set()
    for letter in string.lower():
        if letter in (" ", "-"): continue
        if letter in letters: return False
        letters.add(letter)
    return True
