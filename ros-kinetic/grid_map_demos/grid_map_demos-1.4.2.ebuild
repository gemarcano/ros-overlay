# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Demo nodes to demonstrate the usage of the grid map library."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ethz-asl/grid_map-release/archive/release/kinetic/grid_map_demos/1.4.2-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/grid_map_ros
    ros-kinetic/grid_map_msgs
    ros-kinetic/grid_map_rviz_plugin
    ros-kinetic/sensor_msgs
    ros-kinetic/cv_bridge
    ros-kinetic/roscpp
    ros-kinetic/grid_map_cv
    ros-kinetic/grid_map_visualization
    ros-kinetic/geometry_msgs
    ros-kinetic/grid_map_loader
"
DEPEND="
    ros-kinetic/grid_map_ros
    ros-kinetic/grid_map_msgs
    ros-kinetic/grid_map_rviz_plugin
    ros-kinetic/sensor_msgs
    ros-kinetic/cv_bridge
    ros-kinetic/roscpp
    ros-kinetic/grid_map_cv
    ros-kinetic/grid_map_visualization
    ros-kinetic/geometry_msgs
    ros-kinetic/grid_map_loader
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