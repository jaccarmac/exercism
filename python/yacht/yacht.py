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
            return sum([x for x in self.dice if x == number])

    return NumbersCategory

ONES = NumbersCategory(1)
TWOS = NumbersCategory(2)
THREES = NumbersCategory(3)
FOURS = NumbersCategory(4)
FIVES= NumbersCategory(5)
SIXES = NumbersCategory(6)

class SortedCategory(Category):
    def __init__(self, dice):
        super(SortedCategory, self).__init__(dice)
        self.dice.sort()

class FULL_HOUSE(SortedCategory):
    def satisfies(self):
        first_two = set(self.dice[:2])
        last_three = set(self.dice[2:])
        first_three = set(self.dice[:3])
        last_two = set(self.dice[3:])
        return (first_two != last_three
                and ((len(first_two) == 1 and len(last_three) == 1)
                     or (len(first_three) == 1 and len(last_two) == 1)))

    def score(self):
        return sum(self.dice)

class FOUR_OF_A_KIND(SortedCategory):
    def __init__(self, dice):
        super(FOUR_OF_A_KIND, self).__init__(dice)
        self.first_four = set(self.dice[:4])
        self.last_four = set(self.dice[1:])

    def satisfies(self):
        return len(self.last_four) == 1 or len(self.first_four) == 1

    def score(self):
        return 4 * sum(
            self.first_four if len(self.first_four) == 1 else self.last_four
        )

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
