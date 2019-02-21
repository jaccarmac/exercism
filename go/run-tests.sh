PROBLEM=$1

cd $PROBLEM && go test -v --bench . --benchmem
