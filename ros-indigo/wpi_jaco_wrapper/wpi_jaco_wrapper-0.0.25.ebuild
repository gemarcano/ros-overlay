# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="ROS Wrapper for the JACO Arm Developed at WPI"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/gt-rail-release/wpi_jaco-release/archive/release/indigo/wpi_jaco_wrapper/0.0.25-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/jaco_sdk
    ros-indigo/controller_manager
    ros-indigo/actionlib
    ros-indigo/std_srvs
    ros-indigo/ecl_geometry
    ros-indigo/roscpp
    ros-indigo/rail_manipulation_msgs
    ros-indigo/std_msgs
    ros-indigo/sensor_msgs
    ros-indigo/control_msgs
    ros-indigo/tf
    ros-indigo/hardware_interface
    ros-indigo/wpi_jaco_msgs
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
