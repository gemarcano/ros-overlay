# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Bound incoming velocity messages according to robot velocity and acceleration li"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/yujinrobot-release/yujin_ocs-release/archive/release/indigo/yocs_velocity_smoother/0.6.4-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/nodelet
    ros-indigo/pluginlib
    ros-indigo/dynamic_reconfigure
    ros-indigo/nav_msgs
    ros-indigo/geometry_msgs
    ros-indigo/roscpp
    ros-indigo/ecl_threads
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
