# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="The aubo_new_driver package for AUBO-I5 connect the TCP/IP Server"
HOMEPAGE="http://wiki.ros.org/aubo_new_driver"
SRC_URI="https://github.com/auboliuxin/aubo_robot-release/archive/release/indigo/aubo_new_driver/0.3.15-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/aubo_description
    ros-indigo/controller_manager
    ros-indigo/rospy
    ros-indigo/geometry_msgs
    ros-indigo/actionlib
    ros-indigo/roscpp
    ros-indigo/std_msgs
    ros-indigo/sensor_msgs
    ros-indigo/aubo_msgs
    ros-indigo/control_msgs
    ros-indigo/trajectory_msgs
    ros-indigo/ros_controllers
    ros-indigo/hardware_interface
    ros-indigo/tf
"
DEPEND="${RDEPEND}
    ros-indigo/message_generation
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/indigo"

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
    cd ../../work
    source /${ROS_PREFIX}/setup.bash
    catkin_make_isolated --install --install-space="${D}/${ROS_PREFIX}" || die
    if [[ -e /${ROS_PREFIX}/setup.bash ]]; then
        rm -f ${D}/${ROS_PREFIX}/{.catkin,_setup_util.py,env.sh,setup.bash,setup.sh}
        rm -f ${D}/${ROS_PREFIX}/{setup.zsh,.rosinstall}
    fi
}
