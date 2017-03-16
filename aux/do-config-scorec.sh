# Modify these paths for your system.
SCORECINSTALLDIR=
TRILINSTALLDIR=
PARMETISDIR=
ZOLTANDIR=
MESHDIR=

cmake .. \
 -D CMAKE_C_COMPILER="mpicc" \
 -D CMAKE_CXX_COMPILER="mpicxx" \
 -D CMAKE_C_FLAGS="-O2 -g -Wall" \
 -D CMAKE_CXX_FLAGS="-O2 -g -Wall" \
 -D Trilinos_PREFIX=$TRILINSTALLDIR \
 -D PCU_COMPRESS=ON \
 -D LION_COMPRESS=ON \
 -D ENABLE_STK=ON \
 -D ENABLE_ZOLTAN=ON \
 -D ENABLE_DSP=OFF \
 -D CMAKE_INSTALL_PREFIX=$SCORECINSTALLDIR \
 -D PARMETIS_INCLUDE_DIR=$PARMETISDIR/include \
 -D PARMETIS_LIBRARY=$PARMETISDIR/lib/libparmetis.a \
 -D METIS_LIBRARY=$PARMETISDIR/lib/libmetis.a \
 -D ZOLTAN_INCLUDE_DIR=$ZOLTANDIR/include \
 -D ZOLTAN_LIBRARY=$ZOLTANDIR/lib/libzoltan.a \
