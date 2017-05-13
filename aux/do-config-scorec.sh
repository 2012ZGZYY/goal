#!/bin/bash -ex

# Modify these paths for your system.
SCOREC_SRC_DIR=
SCOREC_INSTALL_DIR=
TRILINOS_DIR=
PARMETIS_DIR=
ZOLTAN_DIR=

cmake $SCOREC_SRC_DIR \
-DCMAKE_C_COMPILER:FILEPATH=mpicc \
-DCMAKE_CXX_COMPILER:FILEPATH=mpicxx \
-DCMAKE_C_FLAGS:STRING="-O2 -g -Wall" \
-DCMAKE_CXX_FLAGS:STRING="-O2 -g -Wall" \
-DTrilinos_PREFIX:FILEPATH=$TRILINOS_DIR \
-DPCU_COMPRESS:BOOL=ON \
-DLION_COMPRESS:BOOL=ON \
-DENABLE_STK:BOOL=ON \
-DENABLE_ZOLTAN:BOOL=ON \
-DCMAKE_INSTALL_PREFIX:FILEPATH=$SCOREC_INSTALL_DIR \
-DPARMETIS_INCLUDE_DIR:FILEPATH=$PARMETIS_DIR/include \
-DPARMETIS_LIBRARY:FILEPATH=$PARMETIS_DIR/lib/libparmetis.so \
-DMETIS_LIBRARY:FILEPATH=$PARMETIS_DIR/lib/libmetis.so \
-DZOLTAN_INCLUDE_DIR:FILEPATH=$ZOLTAN_DIR/include \
-DZOLTAN_LIBRARY:FILEPATH=$ZOLTAN_DIR/lib/libzoltan.so \
2>&1 | tee config_log
