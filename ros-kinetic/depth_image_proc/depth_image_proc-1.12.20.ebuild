# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Contains nodelets for processing depth images such as those
     produced by OpenNI camera. Functions include creating disparity
     images and point clouds, as well as registering (reprojecting)
     a depth image into another camera frame."
HOMEPAGE="http://ros.org/wiki/depth_image_proc"
SRC_URI="https://github.com/ros-gbp/image_pipeline-release/archive/release/kinetic/depth_image_proc/1.12.20-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/nodelet
    ros-kinetic/image_transport
    ros-kinetic/cv_bridge
    ros-kinetic/tf2
    ros-kinetic/tf2_ros
    ros-kinetic/eigen_conversions
    ros-kinetic/image_geometry
    dev-libs/boost
"
DEPEND="
    ros-kinetic/cmake_modules
    ros-kinetic/image_transport
    ros-kinetic/nodelet
    ros-kinetic/message_filters
    ros-kinetic/cv_bridge
    ros-kinetic/sensor_msgs
    ros-kinetic/tf2
    ros-kinetic/tf2_ros
    ros-kinetic/eigen_conversions
    ros-kinetic/stereo_msgs
    ros-kinetic/image_geometry
    dev-libs/boost
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo

src_unpack() {
    wget -O ${P}.tar.gz ${SRC_URI}
    tar -xf ${P}.tar.gz
    rm -f ${P}.tar.gz
    mv *${P}* ${P}
}

src_configure() {
    mkdir ${WORKDIR}/src
    cp -R ${WORKDIR}/${P} ${WORKDIR}/src/${P}
}

src_compile() {
    echo ""
}

src_install() {
    echo ""
}

pkg_postinst() {
    cd ../work
    source /opt/ros/kinetic/setup.bash
    catkin_make_isolated --install --install-space="/opt/ros/kinetic" || die
}
