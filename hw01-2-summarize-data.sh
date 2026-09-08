#!/bin/bash
# Summarize downloaded Wikipedia data files

# Write the header row
echo "filename,size,num_lines" > wikimedia_data_summary.csv

count=0

for filepath in data/*.csv; do
    filename=$(basename "$filepath")
    size=$(ls -lh "$filepath" | awk '{print $5}')
    num_lines=$(wc -l < "$filepath")
    echo "$filename,$size,$num_lines" >> wikimedia_data_summary.csv
    count=$((count + 1))
done

echo "Finished $count files"
echo "Wrote wikimedia_data_summary.csv ($((count + 1)) rows including header)"
