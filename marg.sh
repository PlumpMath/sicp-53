#!/bin/bash
mvn clean && mvn compile && mvn clojure:marginalia -Dmarginalia.outputType=multidoc && \
git co gh-pages && rm -f *.html && \
mv target/marginalia/toc.html index.html && \
find target/marginalia -name '*.html' -exec sed -i 's/toc.html/index.html/' '{}' \; && \
mv target/marginalia/* . && git add -u && echo "Check for uncommitted html files, commit and switch to master..."
#git ci -m "Updated generated documentation" && git co master
