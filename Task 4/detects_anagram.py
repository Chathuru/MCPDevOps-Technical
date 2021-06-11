#!/usr/bin/python
import sys

if len(sys.argv) != 3:
    print("Usage: python detects_anagram.py <string> <string>\nor\n./detects_anagram.py <string> <string>")
    sys.exit()

string_1=sys.argv[]
string_2=sys.argv[]

if(sorted(string_1)== sorted(string_2)):
    print("The strings are anagrams.")
else:
    print("The strings aren't anagrams.")
