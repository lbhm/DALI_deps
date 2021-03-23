# Copyright (c) 2021, NVIDIA CORPORATION. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#!/bin/bash -xe

if [ ${WITH_FFMPEG} -gt 0 ]; then
    # FFmpeg  https://developer.download.nvidia.com/compute/redist/nvidia-dali/ffmpeg-4.3.1.tar.bz2
    pushd third_party/FFmpeg
    ./configure \
        --prefix=${INSTALL_PREFIX} \
        --disable-static \
        --disable-programs \
        --disable-doc \
        --disable-avdevice \
        --disable-swresample \
        --disable-swscale \
        --disable-postproc \
        --disable-w32threads \
        --disable-os2threads \
        --disable-dct \
        --disable-dwt \
        --disable-error-resilience \
        --disable-lsp \
        --disable-lzo \
        --disable-mdct \
        --disable-rdft \
        --disable-fft \
        --disable-faan \
        --disable-pixelutils \
        --disable-autodetect \
        --disable-iconv \
        --enable-shared \
        --enable-avformat \
        --enable-avcodec \
        --enable-avfilter \
        --disable-encoders \
        --disable-hwaccels \
        --disable-muxers \
        --disable-protocols \
        --enable-protocol=file \
        --disable-indevs \
        --disable-outdevs  \
        --disable-devices \
        --disable-filters \
        --disable-bsfs \
        --enable-bsf=h264_mp4toannexb,hevc_mp4toannexb,mpeg4_unpack_bframes
    make -j"$(grep ^processor /proc/cpuinfo | wc -l)"
    make install
    popd
fi