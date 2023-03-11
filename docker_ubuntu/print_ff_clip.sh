# pass a single file as a CLA
#
# first line is doing the following:
# 1. get all text before the colons in the file, 
# 2. use grep to remove excess empty lines, 
# 3. use tr to replace all newlines w/ commas
# 4. use tr to delete all spaces
# 5. replace all commas with newlines
# 6. sort 
# 7. remove repeats w/ uniq
# 
# Then, use grep to print all lines w/ matches for each tag, and awk to add a tab before the grep output

tags=$(awk -F: '{print $1}' $1 | grep "\S" | tr '\n' ',' | tr -d ' ' | tr ',' '\n' | sort | uniq)
for tag in $tags;
do 
echo $tag
grep tag $1 | awk '{print "\t"$0}'
echo ""
done
