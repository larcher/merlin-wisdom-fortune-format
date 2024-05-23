#!/bin/bash

echo "Converting to fortune(6) format..."
echo
sed -f- wisdom.md << EOF > merlin-wisdom
1,/Wisdom.So.Far/ d;
/Works.Cited/,$ d;
/^$/ d;
/^----$/ d;
s/^- /%\n/;
EOF

strfile -c % merlin-wisdom merlin-wisdom.dat

echo
echo Created these files
ls -al merlin-wisdom merlin-wisdom.dat
echo
echo "Drop them in the directory with the rest of your fortune files"
echo "That's probably this path: "
fortune -f 2>&1 | sed -ne 's/^100.00% // p;'

