# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Examples showing how to use C++ and Python client libraries to access semantic
    maps within the world canvas framework."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/yujinrobot-release/world_canvas_libs-release/archive/release/kinetic/world_canvas_client_examples/0.2.0-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/world_canvas_client_py
    ros-kinetic/uuid_msgs
    ros-kinetic/world_canvas_client_cpp
    ros-kinetic/world_canvas_msgs
    ros-kinetic/nav_msgs
    ros-kinetic/roscpp
    ros-kinetic/yocs_msgs
    ros-kinetic/unique_id
"
DEPEND="
    ros-kinetic/uuid_msgs
    ros-kinetic/world_canvas_client_cpp
    ros-kinetic/world_canvas_msgs
    ros-kinetic/nav_msgs
    ros-kinetic/roscpp
    ros-kinetic/yocs_msgs
    ros-kinetic/unique_id
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
