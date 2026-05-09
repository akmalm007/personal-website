#!/bin/bash 

set -e

TODAY_DATE=$(date "+%F")
TODAY_TIME=$(date "+%T")
TIME_ZONE=+0700
FILENAME=""
BLOG_TITLE=""
BLOG_CATEGORY=""
BLOG_TAGS=""

read -p "Enter file name with dash as space (-): " FILENAME

touch _drafts/$TODAY_DATE-$FILENAME.md

echo "Create file completed: _drafts/$TODAY_DATE-$FILENAME.md"

read -p "Enter blog title: " BLOG_TITLE
read -p "Enter blog category: " BLOG_CATEGORY
read -p "Enter blog category: " BLOG_TAGS

cat << EOF > _drafts/$TODAY_DATE-$FILENAME.md
---
date: $TODAY_DATE $TODAY_TIME $TIME_ZONE
title: $BLOG_TITLE
category: $BLOG_CATEGORY
tags: $BLOG_TAGS
---
EOF

echo "Create front matter completed!"
cat < _drafts/$TODAY_DATE-$FILENAME.md
