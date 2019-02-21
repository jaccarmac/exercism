PROBLEM=$1

cd $PROBLEM && sbcl --load $PROBLEM-test.lisp --quit
