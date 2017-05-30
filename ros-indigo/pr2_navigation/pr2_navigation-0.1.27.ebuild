# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="The pr2_navigation stack holds common configuration options for running the"
HOMEPAGE="http://ros.org/wiki/pr2_navigation"
SRC_URI="https://github.com/pr2-gbp/pr2_navigation-release/archive/release/indigo/pr2_navigation/0.1.27-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/pr2_navigation_slam
    ros-indigo/pr2_move_base
    ros-indigo/laser_tilt_controller_filter
    ros-indigo/pr2_navigation_teleop
    ros-indigo/pr2_navigation_perception
    ros-indigo/pr2_navigation_self_filter
    ros-indigo/pr2_navigation_local
    ros-indigo/semantic_point_annotator
    ros-indigo/pr2_navigation_global
    ros-indigo/pr2_navigation_config
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
