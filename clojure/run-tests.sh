PROBLEM=$1
PROBLEM_SRC=$PROBLEM/src
PROBLEM_TEST_FILE=$PROBLEM/test/${PROBLEM//-/_}_test.clj
PROBLEM_TEST_NS=$PROBLEM-test

java -cp $GUIX_ENVIRONMENT/share/java/clojure.jar:$PROBLEM_SRC clojure.main -i $PROBLEM_TEST_FILE -e "(clojure.test/run-tests '$PROBLEM_TEST_NS)"
