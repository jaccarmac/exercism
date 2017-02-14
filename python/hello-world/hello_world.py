#
# Skeleton file for the Python "Hello World" exercise.
#


def hello(name=""):
    if name is not None and len(name) is not 0:
        return "Hello, " + name + "!"
    else:
        return "Hello, World!"
