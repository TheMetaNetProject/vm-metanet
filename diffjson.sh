#!/bin/bash
# diff the results from two executions of one of the metaphor scripts
# the previous-test directory contains the results of the last test run to compare to
# $1 function
# $2 language
# $3 directory name 
if [ -f ~/$3/tests/Result_GS$2_m4$1_input.json ] ; then 
  /u/metanet/dev/bin/ppjson ~/$3/tests/Result_GS$2_m4$1_input.json > ~/$3/diff/temp_$1_$2.txt
  /u/metanet/dev/bin/ppjson ~/$3/previous-tests/Result_GS$2_m4$1_input.json > ~/$3/diff/temp_$1_$2_previous.txt
  diff ~/$3/diff/temp_$1_$2.txt ~/$3/diff/temp_$1_$2_previous.txt > ~/$3/diff/diff_$1_$2.txt
fi
