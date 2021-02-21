 #!/usr/bin/env bash

say() {
 echo "$@" | sed \
         -e "s/\(\(@\(red\|green\|yellow\|blue\|magenta\|cyan\|white\|reset\|b\|u\)\)\+\)[[]\{2\}\(.*\)[]]\{2\}/\1\4@reset/g" \
         -e "s/@red/$(tput setaf 1)/g" \
         -e "s/@green/$(tput setaf 2)/g" \
         -e "s/@yellow/$(tput setaf 3)/g" \
         -e "s/@blue/$(tput setaf 4)/g" \
         -e "s/@magenta/$(tput setaf 5)/g" \
         -e "s/@cyan/$(tput setaf 6)/g" \
         -e "s/@white/$(tput setaf 7)/g" \
         -e "s/@reset/$(tput sgr0)/g" \
         -e "s/@b/$(tput bold)/g" \
         -e "s/@u/$(tput sgr 0 1)/g"
}


PY_VERSION=$1
if [ -z "$PY_VERSION" ]
  then
    say @red[["Please pass the PY_VERSION to the script. i.e.: build_doker.sh 3.6 11.0"]]
    exit 1;
fi

CUDA_VERSION=$2
if [ -z "$CUDA_VERSION" ]
  then
    say @red[["Please pass the CUDA_VERSION to the script. i.e.: build_doker.sh 3.6 11.0"]]
    exit 1;
fi


docker run --rm -it --gpus all \
    --entrypoint /bin/bash \
    jmrf/py-cuda:$CUDA_VERSION-py$PY_VERSION
