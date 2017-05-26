# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="gazebo_ros_control"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/gazebo_ros_pkgs-release/archive/release/kinetic/gazebo_ros_control/2.5.12-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/hardware_interface
    ros-kinetic/transmission_interface
    ros-kinetic/joint_limits_interface
    ros-kinetic/controller_manager
    ros-kinetic/angles
    ros-kinetic/pluginlib
    ros-kinetic/roscpp
    ros-kinetic/std_msgs
    ros-kinetic/urdf
    ros-kinetic/gazebo_ros
    ros-kinetic/control_toolbox
    sci-electronics/gazebo
"
DEPEND="
    ros-kinetic/hardware_interface
    ros-kinetic/transmission_interface
    ros-kinetic/joint_limits_interface
    ros-kinetic/controller_manager
    ros-kinetic/angles
    ros-kinetic/control_toolbox
    ros-kinetic/roscpp
    ros-kinetic/std_msgs
    ros-kinetic/urdf
    ros-kinetic/pluginlib
    sci-electronics/gazebo
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
