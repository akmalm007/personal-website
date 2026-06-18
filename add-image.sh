#!/bin/bash

set -euo

# For image dir
read -p "Any image you want to add ? " CHOICE

if [ "${CHOICE,,}" = "yes" ]; then
    mkdir -p assets/images/blog/$TODAY_DATE-$FILENAME
    echo "Directory has been created"
    ls assets/images/blog/$TODAY_DATE-$FILENAME
fi

cat << EOF > _drafts/$TODAY_DATE-$FILENAME.md
---
date: $TODAY_DATE $TODAY_TIME $TIME_ZONE
title: $BLOG_TITLE
category: $BLOG_CATEGORY
tags: $BLOG_TAGS
galley:
   - url: /assets/images/blog/$TODAY_DATE-$FILENAME
     image_path: /assets/images/blog/$TODAY_DATE-$FILENAME
---
EOF

echo "Front matter have been updated"
cat < _drafts/$TODAY_DATE-$FILENAME.md
