# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="The pr2_mechanism_diagnostics node subscribes to mechanism_statistics and publis"
HOMEPAGE="http://ros.org/wiki/pr2_mechanism_diagnostics"
SRC_URI="https://github.com/pr2-gbp/pr2_mechanism-release/archive/release/indigo/pr2_mechanism_diagnostics/1.8.16-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/angles
    ros-indigo/rospy
    ros-indigo/pr2_mechanism_msgs
    ros-indigo/roscpp
    ros-indigo/urdf
    ros-indigo/diagnostic_msgs
    ros-indigo/pr2_mechanism_model
    ros-indigo/std_msgs
    ros-indigo/std_srvs
    ros-indigo/diagnostic_updater
"
DEPEND="${RDEPEND}
    ros-indigo/rostest
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
