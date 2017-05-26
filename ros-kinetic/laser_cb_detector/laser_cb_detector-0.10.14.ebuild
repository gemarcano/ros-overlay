# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Extracts checkerboard corners from a dense laser snapshot.
     This package is experimental and unstable. Expect its APIs to change."
HOMEPAGE="http://www.ros.org/wiki/laser_cb_detector"
SRC_URI="https://github.com/ros-gbp/calibration-release/archive/release/kinetic/laser_cb_detector/0.10.14-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/image_cb_detector
    ros-kinetic/message_filters
    ros-kinetic/cv_bridge
    ros-kinetic/roscpp
    ros-kinetic/std_msgs
    ros-kinetic/actionlib_msgs
    ros-kinetic/settlerlib
    ros-kinetic/actionlib
"
DEPEND="
    ros-kinetic/image_cb_detector
    ros-kinetic/message_filters
    ros-kinetic/cv_bridge
    ros-kinetic/roscpp
    ros-kinetic/std_msgs
    ros-kinetic/actionlib_msgs
    ros-kinetic/settlerlib
    ros-kinetic/actionlib
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
