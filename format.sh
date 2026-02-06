find ./json/*.json -type f -exec sh -c 'cat <<< $(jq . "{}") > "{}"' \;
find ./json/*.json -type f \
    -exec sh -c 'jq -r .rawTitle {} | sed '\''s/^/**/; s/$/**/'\'' > ./txt/$(basename {} .json).txt' \; \
    -exec sh -c 'echo >> ./txt/$(basename {} .json).txt' \; \
    -exec sh -c 'jq -r .rawDescription {} | sed '\''s/\\n/\n/g'\'' >> ./txt/$(basename {} .json).txt' \;
