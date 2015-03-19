#!/bin/bash
#
# Deploy to s3 when master gets updated.
#
# This expects (and does NOT check for) s3cmd to be installed and configured!
# This expects (and does NOT check for) hugo to be installed and on your $PATH

bucket='carolinarscm.org'
prefix=''

#branch=$(git rev-parse --abbrev-ref HEAD)
branch=master

if [[ "$branch" == "master" ]]; then
  rm -rf public/
  hugo
  echo "Syncing public/* with s3://$bucket/$prefix."
  s3cmd --acl-public --delete-removed --no-progress sync public/* s3://$bucket/$prefix
  echo -e "\nUpdated s3://$bucket/$prefix."
else
  echo "*** s3://$bucket/$prefix only syncs when master branch is updated! ***"
fi

exit 0
