USING: formatting kernel ;
IN: exercism.two-fer

: 2-for-1 ( name -- sentence )
    dup "" = [ drop "you" ] when
    "One for %s, one for me." sprintf ;
