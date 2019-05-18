from __future__ import division


class Rational(object):
    def _common_divisor(self, x, y):
        if x == 0: return y
        if y == 0: return x
        for div in range(int(min(abs(x), abs(y))), 1, -1):
            if x % div == 0 and y % div == 0:
                return div
        return 1

    def __init__(self, numer, denom):
        divisor = self._common_divisor(numer, denom)
        self.numer = numer / divisor
        self.denom = denom / divisor
        if self.denom < 0:
            self.numer = -self.numer
            self.denom = -self.denom

    def __eq__(self, other):
        return self.numer == other.numer and self.denom == other.denom

    def __repr__(self):
        return '{}/{}'.format(self.numer, self.denom)

    def __add__(self, other):
        return Rational(self.numer * other.denom + other.numer * self.denom,
                        self.denom * other.denom)

    def __sub__(self, other):
        return Rational(self.numer * other.denom - other.numer * self.denom,
                        self.denom * other.denom)

    def __mul__(self, other):
        return Rational(self.numer * other.numer, self.denom * other.denom)

    def __truediv__(self, other):
        return Rational(self.numer * other.denom, other.numer * self.denom)

    def __abs__(self):
        return Rational(abs(self.numer), abs(self.denom))

    def __pow__(self, power):
        return Rational(self.numer ** power, self.denom ** power)

    def __rpow__(self, base):
        return (base ** self.numer) ** (1 / self.denom)
