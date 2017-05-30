# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="ROS nodelet for Kobuki: ROS wrapper for the Kobuki driver."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/yujinrobot-release/kobuki-release/archive/release/indigo/kobuki_node/0.6.8-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/angles
    ros-indigo/nav_msgs
    ros-indigo/std_msgs
    ros-indigo/kobuki_safety_controller
    ros-indigo/diagnostic_aggregator
    ros-indigo/kobuki_rapps
    ros-indigo/diagnostic_msgs
    ros-indigo/sensor_msgs
    ros-indigo/ecl_exceptions
    ros-indigo/ecl_threads
    ros-indigo/nodelet
    ros-indigo/ecl_sigslots
    ros-indigo/rospy
    ros-indigo/capabilities
    ros-indigo/roscpp
    ros-indigo/tf
    ros-indigo/kobuki_ftdi
    ros-indigo/diagnostic_updater
    ros-indigo/pluginlib
    ros-indigo/ecl_streams
    ros-indigo/geometry_msgs
    ros-indigo/kobuki_msgs
    ros-indigo/kobuki_keyop
    ros-indigo/kobuki_driver
"
DEPEND="${RDEPEND}
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
