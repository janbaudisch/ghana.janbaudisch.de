#!/bin/sh

COMMIT=$(git branch | sed -n -e "s/^\* \(.*\)/\1/p" | cut -c19-25 )

git branch --contains $COMMIT | grep "master" &> /dev/null
if [ $? == 0 ]; then
  echo "ghana.janbaudisch.de" && exit 0
fi

git branch --contains $COMMIT | grep "review" &> /dev/null
if [ $? == 0 ]; then
  echo "review.ghana.janbaudisch.de" && exit 0
fi

exit 1
