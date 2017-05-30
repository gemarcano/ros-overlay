# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="PCL (Point Cloud Library) ROS interface stack. PCL-ROS is the preferred
  bridge"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/perception_pcl-release/archive/release/indigo/pcl_ros/1.2.7-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/dynamic_reconfigure
    ros-indigo/nodelet
    ros-indigo/pluginlib
    ros-indigo/message_filters
    ros-indigo/pcl_msgs
    ros-indigo/rosbag
    ros-indigo/roscpp
    ros-indigo/std_msgs
    ros-indigo/sensor_msgs
    ros-indigo/tf
    ros-indigo/pcl_conversions
    ros-indigo/nodelet_topic_tools
    sci-libs/pcl
    sci-libs/vtk
    dev-python/pyvtk
    dev-cpp/eigen
    sci-libs/pcl
"
DEPEND="${RDEPEND}
    ros-indigo/cmake_modules
    ros-indigo/roslib
    ros-indigo/genmsg
    ros-indigo/rosconsole
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
