# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Wrapper around Particle Filter implementation.
    The SelfLocalizer can be used as library or as a ros-node."
HOMEPAGE="http://wiki.ros.org/self_localizer"
SRC_URI="https://github.com/skasperski/navigation_2d-release/archive/release/kinetic/nav2d_localizer/0.3.2-0.tar.gz"

LICENSE="GPLv3"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/roscpp
    ros-kinetic/tf
    ros-kinetic/sensor_msgs
    ros-kinetic/nav_msgs
    ros-kinetic/geometry_msgs
"
DEPEND="
    ros-kinetic/roscpp
    ros-kinetic/tf
    ros-kinetic/sensor_msgs
    ros-kinetic/nav_msgs
    ros-kinetic/geometry_msgs
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
