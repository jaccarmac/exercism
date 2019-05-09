from functools import reduce

def latest(scores):
    return scores[-1]


def personal_best(scores):
    return max(scores)


def personal_top_three(scores):
    def top_three_reducer(top, score):
        if len(top) < 3 or score > top[-1]:
            return sorted(top + [score], reverse=True)[:3]
        else:
            return top
    return reduce(top_three_reducer, scores, [])
