# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="The twist_mux msgs and actions package"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/twist_mux_msgs-release/archive/release/kinetic/twist_mux_msgs/2.0.0-0.tar.gz"

LICENSE="CC BY-NC-SA 4.0"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/actionlib_msgs
    ros-kinetic/message_runtime
    ros-kinetic/actionlib
"
DEPEND="
    ros-kinetic/actionlib_msgs
    ros-kinetic/message_generation
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
