def is_isogram(string):
    letters = set()
    for letter in string.lower():
        if letter in (" ", "-"): continue
        elif letter in letters: return False
        else: letters.add(letter)
    return True
