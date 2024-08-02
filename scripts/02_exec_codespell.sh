#!/bin/bash

# -------------------------------------------------------------
# This Scrips find all .sh scripts and runs codespell on them
# Autor: Ori Nahum
# Collaborator : Avishay Layani
# -------------------------------------------------------------

OUTPUT_FILE="/home/jenkins/workspace/pipeline_02_code_shell_check/reports/codespell_results.md"
pwd
PATHS_LOCATION=("$1" "$2")

# initialize the output file
echo "==================" > $OUTPUT_FILE
echo "CodeSpell Results" >> $OUTPUT_FILE
echo "==================" >> $OUTPUT_FILE

# loop through all directories and find .sh files
for LOCATION in "${PATHS_LOCATION[@]}"
do
    if [[ $LOCATION != '' ]];
    then
        find $LOCATION -name "*.sh" -exec codespell {} + >> $OUTPUT_FILE
    else
        echo "[-] Location was not provided"
    fi
done

echo "[v] Code Spell Results saved in $OUTPUT_FILE"

