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
            prop_key = parse_property_key(next_tok, input_iter)
            prop_values = []
            while True:
                next_tok = next(input_iter)
                prop_values.append(parse_property_value(next_tok, input_iter))
                next_tok = next(input_iter)
                if next_tok != '[':
                    break
            properties[prop_key] = prop_values
    return SgfTree(properties, children)

def parse_property_key(tok, input_iter):
    key = ''
    next_tok = tok
    while True:
        if next_tok == '[':
            if not key.isupper():
                raise ValueError('lowercase property key')
            return key
        else:
            key += next_tok
            next_tok = next(input_iter)

def parse_property_value(tok, input_iter):
    value = ''
    next_tok = tok
    while True:
        if next_tok == '\\':
            value += next(input_iter)
            next_tok = next(input_iter)
        elif next_tok == '\t':
            value += ' '
            next_tok = next(input_iter)
        elif next_tok == ']':
            break
        else:
            value += next_tok
            next_tok = next(input_iter)
    return value
