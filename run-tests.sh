LANGUAGE=$1
PROBLEM=$2

cd $LANGUAGE
guix environment -m guix-manifest.scm -- ./run-tests.sh $PROBLEM
