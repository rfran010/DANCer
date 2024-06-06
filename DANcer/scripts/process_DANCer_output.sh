#!/bin/sh

usage(){
    echo "
Usage: sh $0 [DANCer classifier output]

" >&2
    exit 1
}

if [ $# -eq 0 ]; then
    echo "No input file provided" >&2
    usage
fi

FILE="$1"
BASE=$(basename ${FILE} _classifier_out\.tsv)

sed '1d;s/0$/ALS-TE/;s/1$/ALS-Glia/;s/2$/ALS-Ox/' ${FILE} | awk -v OFS="	" '$11=="ALS-Ox"{print $1,$11,$10};$11=="ALS-Glia"{print $1,$11,$9};$11=="ALS-TE"{print $1,$11,$8}' > ${BASE}_classification.txt
