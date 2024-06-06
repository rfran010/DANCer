#!/bin/sh

usage(){
    echo "
Usage: sh $0 [scDANCer output]

" >&2
    exit 1
}

if [ $# -eq 0 ]; then
    echo "No input file provided" >&2
    usage
fi

FILE="$1"
BASE=$(basename ${FILE} _classifier_out\.tsv)

sed  '1d;s/0$/ALS-TE/;s/1$/ALS-Glia/;s/2$/ALS-Ox/' ${FILE} | awk -v OFS="	" '$10=="ALS-Ox"{print $1,$10,$9};$10=="ALS-Glia"{print $1,$10,$8};$10=="ALS-TE"{print $1,$10,$7}' > ${BASE}_MEs_classification.txt
