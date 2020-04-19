#!/bin/bash

# To run this program you just need to:
# ./ctags_with_dep.sh

# gcc -M $* | tr '\\ ' '\n' | sed -e '/^$/d' -e '/\.o:[ \t]*$/d' | \
#         ctags -L - --c++-kinds=+p --fields=+iaS --extra=+q

for filename in *.cpp; do
	[ -f "$filename" ] || break
	gcc -M "$filename" | tr '\\ ' '\n' | sed -e '/^$/d' -e '/\.o:[ \t]*$/d' | \
        ctags -R --c++-kinds=+p --fields=+iaSn --extra=+q
done
