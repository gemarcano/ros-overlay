# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="The rplidar ros package, support rplidar A2/A1"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/kintzhao/rplidar_ros-release/archive/release/kinetic/rplidar_ros/1.5.7-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/roscpp
    ros-kinetic/std_srvs
    ros-kinetic/sensor_msgs
    ros-kinetic/rosconsole
"
DEPEND="
    ros-kinetic/roscpp
    ros-kinetic/std_srvs
    ros-kinetic/sensor_msgs
    ros-kinetic/rosconsole
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