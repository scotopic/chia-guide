#!/usr/bin/env bash
# src: https://www.reddit.com/r/chia/comments/mp0y8a/a_little_bash_script_for_checking_on_your/

searches=("Computing table 1" "Computing table 2" "Computing table 3" "Computing table 4" "Computing table 5" "Computing table 6" "Computing table 7" "Backpropagating on table 7" "Backpropagating on table 6" "Backpropagating on table 5" "Backpropagating on table 4" "Backpropagating on table 3" "Backpropagating on table 2" "Compressing tables 1 and 2" "Compressing tables 2 and 3" "Compressing tables 3 and 4" "Compressing tables 4 and 5" "Compressing tables 5 and 6" "Compressing tables 6 and 7" "Write Checkpoint tables")
if [ $# -eq 0 ]; then
    echo "No filenames supplied, try ./findprogress.sh ~/chialogs/*"
fi
for f in $*
do
    # Work only on GNU grep and UNIX platform with tac
    # result=$(tac "${f}" | grep -m 1 -f <(printf '%s\n' "${searches[@]}"))
    # macOS compatible
    #result=$(grep "${searches[@]}" "${f}" | tail -n 1)
    result=$(tail -r "${f}" | grep -m 1 -f <(printf '%s\n' "${searches[@]}"))
    if [[ "$result" == "Computing table 1" ]]; then
        echo ""${f}"        1%"
    elif [[ "$result" == "Computing table 2" ]]; then
        echo ""${f}"        6%"
    elif [[ "$result" == "Computing table 3" ]]; then
        echo ""${f}"       12%"
    elif [[ "$result" == "Computing table 4" ]]; then
        echo ""${f}"       20%"
    elif [[ "$result" == "Computing table 5" ]]; then
        echo ""${f}"       28%"
    elif [[ "$result" == "Computing table 6" ]]; then
        echo ""${f}"       36%"
    elif [[ "$result" == "Computing table 7" ]]; then
        echo ""${f}"       42%"
    elif [[ "$result" == "Backpropagating on table 7" ]]; then
        echo ""${f}"       43%"
    elif [[ "$result" == "Backpropagating on table 6" ]]; then
        echo ""${f}"       48%"
    elif [[ "$result" == "Backpropagating on table 5" ]]; then
        echo ""${f}"       51%"
    elif [[ "$result" == "Backpropagating on table 4" ]]; then
        echo ""${f}"       55%"
    elif [[ "$result" == "Backpropagating on table 3" ]]; then
        echo ""${f}"       58%"
    elif [[ "$result" == "Backpropagating on table 2" ]]; then
        echo ""${f}"       61%"
    elif [[ "$result" == "Compressing tables 1 and 2" ]]; then
        echo ""${f}"       66%"
    elif [[ "$result" == "Compressing tables 2 and 3" ]]; then
        echo ""${f}"       73%"
    elif [[ "$result" == "Compressing tables 3 and 4" ]]; then
        echo ""${f}"       79%"
    elif [[ "$result" == "Compressing tables 4 and 5" ]]; then
        echo ""${f}"       85%"
    elif [[ "$result" == "Compressing tables 5 and 6" ]]; then
        echo ""${f}"       92%"
    elif [[ "$result" == "Compressing tables 6 and 7" ]]; then
        echo ""${f}"       98%"
    elif [[ "$result" == *"Write Checkpoint tables"* ]]; then
        echo ""${f}"      100%"
    else
        echo ""${f}"      Progress Unknown"
    fi
done