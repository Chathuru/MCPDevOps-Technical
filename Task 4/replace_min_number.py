#!/usr/bin/python
import sys

if len(sys.argv) != 2:
    print("Usage: python replace_min_number.py <string>\nor\n./replace_min_number.py <string>")
    sys.exit()

input=sys.argv[-1]
output=replace(min(re.findall(r'\d+', input)), 'MIN')

print(output)
