from functools import reduce

class Category(object):
    def __init__(self, dice):
        self.dice = dice

    def satisfies(self):
        raise NotImplementedError()

    def score(self):
        raise NotImplementedError()

class YACHT(Category):
    def satisfies(self):
        return len(set(self.dice)) == 1

    def score(self):
        return 50

def NumbersCategory(number):
    class NumbersCategory(Category):
        def satisfies(self):
            return True

        def score(self):
            return sum(x for x in self.dice if x == number)

    return NumbersCategory

ONES = NumbersCategory(1)
TWOS = NumbersCategory(2)
THREES = NumbersCategory(3)
FOURS = NumbersCategory(4)
FIVES= NumbersCategory(5)
SIXES = NumbersCategory(6)

class FULL_HOUSE(Category):
    def satisfies(self):
        for die in self.dice:
            if len([x for x in self.dice if x == die]) not in (2, 3):
                return False
        return True

    def score(self):
        return sum(self.dice)

class FOUR_OF_A_KIND(Category):
    def __init__(self, dice):
        super(FOUR_OF_A_KIND, self).__init__(dice)
        for die in self.dice:
            if len([x for x in self.dice if x == die]) in (4, 5):
                self.die = die
                return
        self.die = None

    def satisfies(self):
        if self.die:
            return True
        return False

    def score(self):
        return 4 * self.die

class SortedCategory(Category):
    def __init__(self, dice):
        super(SortedCategory, self).__init__(dice)
        self.dice.sort()

class LITTLE_STRAIGHT(SortedCategory):
    def satisfies(self):
        return self.dice == [1, 2, 3, 4, 5]

    def score(self):
        return 30

class BIG_STRAIGHT(SortedCategory):
    def satisfies(self):
        return self.dice == [2, 3, 4, 5, 6]

    def score(self):
        return 30

class CHOICE(Category):
    def satisfies(self):
        return True

    def score(self):
        return sum(self.dice)

def score(dice, category):
    score = category(dice)
    return score.score() if score.satisfies() else 0
