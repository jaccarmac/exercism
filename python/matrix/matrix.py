class Matrix(object):
    def __init__(self, matrix_string):
        rows = matrix_string.split('\n')
        self.elems = [list(map(int, row.split(' '))) for row in rows]
        

    def row(self, index):
        return self.elems[index - 1]

    def column(self, index):
        return [row[index - 1] for row in self.elems]
