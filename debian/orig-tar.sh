#!/bin/sh -e

VERSION=$2
TAR=../proguard_$VERSION.orig.tar.xz
DIR=proguard$VERSION

tar -xf $3
rm $3
tar -c -J -f $TAR --exclude 'lib/*.jar'  --exclude 'docs/*' --exclude 'examples/*' $DIR
rm -rf $DIR

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $TAR $origDir
  echo "moved $TAR to $origDir"
fi

