#!/bin/bash
#Script to clean buildroot fully

source shared.sh

EXTERNAL_REL_BUILDROOT=../base_external
git submodule init
git submodule sync
git submodule update

set -e 
cd `dirname $0`

cd buildroot

make distclean
