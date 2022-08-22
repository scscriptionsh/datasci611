x = 0

def example():
    global x
    x = 10
    x = 12
    return x

def example():
    y = 10
    def inner_function():
        y = 11;
        return y
    return inner_function;


def clean_strings(strings):
    return [ s.replace("[^a-z]+"," ") for s in strings ]

def _some_local_function(s):
    return s
