from functools import reduce

def latest(scores):
    return scores[-1]


def personal_best(scores):
    return max(scores)


def personal_top_three(scores):
    return reduce(lambda t, s: sorted(t + [s], reverse=True)[:3], scores, [])
