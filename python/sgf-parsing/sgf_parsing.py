class SgfTree(object):
    def __init__(self, properties=None, children=None):
        self.properties = properties or {}
        self.children = children or []

    def __eq__(self, other):
        if not isinstance(other, SgfTree):
            return False
        for k, v in self.properties.items():
            if k not in other.properties:
                return False
            if other.properties[k] != v:
                return False
        for k in other.properties.keys():
            if k not in self.properties:
                return False
        if len(self.children) != len(other.children):
            return False
        for a, b in zip(self.children, other.children):
            if a != b:
                return False
        return True

    def __ne__(self, other):
        return not self == other


def parse(input_string):
    input_iter = iter(input_string)
    try:
        first = next(input_iter)
        if first != '(':
            raise ValueError('invalid root node')
        return parse_node(next(input_iter), input_iter)
    except StopIteration:
        raise ValueError('empty input')

def parse_node(tok, input_iter):
    if tok != ';':
        raise ValueError('missing semicolon')
    properties = {}
    children = []
    next_tok = next(input_iter)
    while True:
        if next_tok == ')':
            break
        elif next_tok == ';':
            children = [parse_node(next_tok, input_iter)]
            break
        elif next_tok == '(':
            children.append(parse_node(next(input_iter), input_iter))
            next_tok = next(input_iter)
        else:
            prop_key, prop_values, next_tok = parse_property(next_tok, input_iter)
            properties[prop_key] = prop_values
    return SgfTree(properties, children)

def parse_property(tok, input_iter):
    key = ''
    next_tok = tok
    while True:
        if next_tok == '[':
            next_tok = next(input_iter)
            break
        else:
            key += next_tok
            next_tok = next(input_iter)
    if not key.isupper():
        raise ValueError('lowercase property key')
    values = []
    current_value = ''
    while True:
        if next_tok == '\\':
            next_tok = next(input_iter)
            if next_tok == 't':
                current_value += ' '
            else:
                current_value += next_tok
            next_tok = next(input_iter)
        elif next_tok == ']':
            values.append(current_value)
            current_value = ''
            if next(input_iter) != '[':
                break
            next_tok = next(input_iter)
        else:
            current_value += next_tok
            next_tok = next(input_iter)
    print(key, values)
    return (key, values, next_tok)
