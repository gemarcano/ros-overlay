# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Converts a 3D Point Cloud into a 2D laser scan. This is useful for making devices like the Kinect appear like a laser scanner for 2D-based algorithms (e.g. laser-based SLAM)."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/pointcloud_to_laserscan-release/archive/release/lunar/pointcloud_to_laserscan/1.3.1-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-lunar/message_filters
    ros-lunar/roscpp
    ros-lunar/sensor_msgs
    ros-lunar/nodelet
    ros-lunar/tf2_ros
    ros-lunar/tf2
    ros-lunar/tf2_sensor_msgs
"
DEPEND="
    ros-lunar/message_filters
    ros-lunar/roscpp
    ros-lunar/sensor_msgs
    ros-lunar/nodelet
    ros-lunar/tf2_ros
    ros-lunar/tf2
    ros-lunar/tf2_sensor_msgs
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
    source /opt/ros/lunar/setup.bash
    catkin_make_isolated --install --install-space="/opt/ros/lunar" || die
}