#!/bin/bash -ex

# modify these paths for your system
PARMETIS_SRC_DIR=
PARMETIS_INSTALL_DIR=

cmake $PARMETIS_SRC_DIR \
-DCMAKE_C_COMPILER:FILEPATH=mpicc \
-DCMAKE_CXX_COMPILER:FILEPATH=mpicxx \
-DCMAKE_INSTALL_PREFIX:PATH=$PARMETIS_INSTALL_DIR \
-DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo \
-DBUILD_SHARED_LIBS:BOOL=ON \
2>&1 | tee config_log