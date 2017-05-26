# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="A ROS nodelet and node that wraps the driver API for UEye cameras
    by IDS Imaging Development Systems GMBH."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/anqixu/ueye_cam-release/archive/release/kinetic/ueye_cam/1.0.16-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/camera_calibration_parsers
    ros-kinetic/image_transport
    ros-kinetic/nodelet
    ros-kinetic/sensor_msgs
    ros-kinetic/roscpp
    ros-kinetic/dynamic_reconfigure
    ros-kinetic/camera_info_manager
"
DEPEND="
    ros-kinetic/camera_calibration_parsers
    ros-kinetic/image_transport
    ros-kinetic/nodelet
    ros-kinetic/sensor_msgs
    ros-kinetic/roscpp
    ros-kinetic/dynamic_reconfigure
    ros-kinetic/camera_info_manager
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
