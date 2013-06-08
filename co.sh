#!/bin/bash
# A quick script to checkout the trunk of SVN and apply the named patch to it via quilt.

if [ -z "$2" ]; then
	echo "Usage: $0 project dir"
	exit 1
fi

svn co http://svn.apache.org/repos/asf/subversion/trunk $2
ln -s ../$1 $2/patches
cd $2
quilt setup patches/series
quilt push -a
