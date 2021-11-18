mkdir build
cd build

cmake ${CMAKE_ARGS} .. \
         -DCMAKE_INSTALL_PREFIX=${PREFIX} \
         -DCMAKE_BUILD_TYPE="Release" \
         -DBUILD_LIBMAMBA=ON \
         -DBUILD_STATIC_DEPS=ON \
         -DBUILD_MICROMAMBA=ON \
         -DMICROMAMBA_LINKAGE=FULL_STATIC

make -j${CPU_COUNT}
make install

${STRIP:-strip} ${PREFIX}/bin/micromamba
