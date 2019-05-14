from functools import reduce

def latest(scores):
    return scores[-1]


def personal_best(scores):
    return max(scores)


def personal_top_three(scores):
    def top_three_reducer(top, score):
        return sorted(top + [score], reverse=True)[:3]
    return reduce(top_three_reducer, scores, [])
