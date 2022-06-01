PROBLEM=$1

cd $PROBLEM && sbcl --noinform --noprint --disable-debugger \
                    --load $PROBLEM-test.lisp \
                    --eval "($PROBLEM-test:run-tests)" \
                    --quit
