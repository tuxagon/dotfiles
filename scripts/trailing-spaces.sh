# finds files that end in whitespace
find . -type f -exec egrep -l " +$" {} egrep -l " +$" {} \;
