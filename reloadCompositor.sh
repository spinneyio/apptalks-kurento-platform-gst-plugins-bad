#!/bin/bash
sudo service kurento-media-server-6.0 stop
cd gst/compositor
make
sudo cp .libs/libgstcompositor.so /usr/lib/x86_64-linux-gnu/gstreamer-1.5/
cd ../..
sudo service kurento-media-server-6.0 start
