#!/bin/bash
REPO_NAME=$1

curl -H "Authorization: token ${GITHUB_TOKEN}" \
    -X POST -H "Content-type: application/json" \
    -d "{
        \"name\": \"${REPO_NAME}\",
        \"description\": \"This is ${REPO_NAME}\",
        \"homepage\": \"https://github.com\",
        \"private\": false,
        \"has_issues\": true,
        \"has_wiki\": true,
        \"has_downloads\": true
    }" \
    -i "https://api.github.com/user/repos"