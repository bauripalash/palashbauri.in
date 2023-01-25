for file in *.md
do 
 mv "$file" "${file/.md/.bn.md}"
done
