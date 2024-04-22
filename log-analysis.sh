#!/bin/bash

# Set the log file and keywords to search for
log_file="/path/to/your/logfile.log"
keywords=("error" "warning" "http 404" "http 500")

# Initialize variables for counting keyword occurrences
declare -A keyword_counts
for keyword in "${keywords[@]}"; do
  keyword_counts[$keyword]=0
done

# Monitor the log file for new entries
tail -Fn0 "$log_file" | while read line; do
  # Count occurrences of keywords in each new log entry
  for keyword in "${keywords[@]}"; do
    occurrences=$(echo "$line" | grep -io "$keyword" | wc -l)
    keyword_counts[$keyword]=$((keyword_counts[$keyword] + occurrences))
  done

  # Print a summary report every 10 new log entries
  num_entries=$((num_entries + 1))
  if (( num_entries % 10 == 0 )); then
    echo "Summary report:"
    for keyword in "${keywords[@]}"; do
      echo "- $keyword: ${keyword_counts[$keyword]}"
    done
  fi
done
#Certainly! I'm unsure about the functionality of the program, consider testing it with sample log entries .