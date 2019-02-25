USING: kernel math.functions ;

IN: exercism.leap

: my-leap-year? ( year -- leap? )
    400 4 100 [ [ divisor? ] curry ] tri@ tri
    not and or ;
