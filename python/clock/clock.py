class Clock:
    MINUTES_IN_HOUR = 60
    HOURS_IN_DAY = 24
    MINUTES_IN_DAY = HOURS_IN_DAY * MINUTES_IN_HOUR
    def __init__(self, hour, minute):
        self.minutes = (hour * 60 + minute) % self.MINUTES_IN_DAY
    def __str__(self):
        return "{:02}:{:02}".format(
            (self.minutes // self.MINUTES_IN_HOUR) % self.HOURS_IN_DAY,
            self.minutes % self.MINUTES_IN_HOUR
        )
    def __eq__(self, other):
        return self.minutes == other.minutes
    def add(self, minutes):
        self.minutes += minutes
        self.minutes %= self.MINUTES_IN_DAY
        return self