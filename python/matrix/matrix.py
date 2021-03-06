class Matrix(object):
    def __init__(self, matrix_string):
        self.elems = [[int(elem) for elem in row.split()]
                      for row in matrix_string.split('\n')]

    def row(self, index):
        return self.elems[index - 1]

    def column(self, index):
        return [row[index - 1] for row in self.elems]
