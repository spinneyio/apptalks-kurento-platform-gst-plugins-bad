#!/bin/bash
sudo service kurento-media-server-6.0 stop
cd gst/compositor
make
SYSTEM_COMPOSITOR=`dpkg  -L gstreamer1.5-plugins-bad | grep libgstcompositor.so`
sudo cp .libs/libgstcompositor.so ${SYSTEM_COMPOSITOR}
echo Copy libgstcompositor.so to ${SYSTEM_COMPOSITOR}
md5sum .libs/libgstcompositor.so
md5sum ${SYSTEM_COMPOSITOR}
KMS_ELEMENT_DIST=../../../kms-elements/gst-plugins-bad
[ -e ${KMS_ELEMENT_DIST}/libgstcompositor.so ] && cp .libs/libgstcompositor.so ${KMS_ELEMENT_DIST}/libgstcompositor.so && echo Also copy libgstcompositor.so to ${KMS_ELEMENT_DIST} && md5sum ${KMS_ELEMENT_DIST}/libgstcompositor.so

cd ../..
sudo service kurento-media-server-6.0 start
