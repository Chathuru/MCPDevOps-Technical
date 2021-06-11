#!/usr/bin/python
import sys

if len(sys.argv) != 2:
    print("Usage: python count_repetitive_characters.py <string>\nor\n./count_repetitive_characters.py <string>")
    sys.exit()

check_string=sys.argv[-1]

count = {}
for s in check_string:
    if s in count:
        count[s] += 1
    else:
        count[s] = 1

sorted_dic=dict(sorted(count.items(), key=lambda item: item[1]))

output_string=""
for i in sorted_dic:
    output_string+=i+str(sorted_dic[i])

print(output_string)
