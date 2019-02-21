PROBLEM=$1

cd $PROBLEM && emacs -batch -l ert -l $PROBLEM-test.el -f ert-run-tests-batch-and-exit
