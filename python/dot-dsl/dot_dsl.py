NODE, EDGE, ATTR = range(3)


class Node(object):
    def __init__(self, name, attrs={}):
        self.name = name
        self.attrs = attrs

    def __eq__(self, other):
        return self.name == other.name and self.attrs == other.attrs


class Edge(object):
    def __init__(self, src, dst, attrs={}):
        self.src = src
        self.dst = dst
        self.attrs = attrs

    def __eq__(self, other):
        return (self.src == other.src and
                self.dst == other.dst and
                self.attrs == other.attrs)


class Graph(object):
    def __init__(self, data=[]):
        if not isinstance(data, list):
            raise TypeError('graph is not a list')
        self.nodes = []
        self.edges = []
        self.attrs = {}
        addMethods = {NODE: self._addNode, EDGE: self._addEdge, ATTR: self._addAttr}
        for line in data:
            if len(line) < 2:
                raise TypeError('subgraph has no arguments')
            try:
                addMethods[line[0]](*line[1:])
            except KeyError:
                raise ValueError('unknown subgraph type')
            except TypeError:
                raise ValueError('bad arguments for subgraph')                

    def _addNode(self, name, attrs):
        self.nodes.append(Node(name, attrs))

    def _addEdge(self, src, dst, attrs):
        self.edges.append(Edge(src, dst, attrs))

    def _addAttr(self, key, value):
        self.attrs[key] = value
