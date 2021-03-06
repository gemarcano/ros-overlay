# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="Libraries and examples for ROSserial usage on Windows Platforms"
HOMEPAGE="http://ros.org/wiki/rosserial_windows"
SRC_URI="https://github.com/ros-gbp/rosserial-release/archive/release/kinetic/rosserial_windows/0.7.6-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-kinetic/message_runtime
	ros-kinetic/rospy
	ros-kinetic/rosserial_client
	ros-kinetic/rosserial_msgs
"
DEPEND="${RDEPEND}
	ros-kinetic/catkin
	ros-kinetic/geometry_msgs
	ros-kinetic/message_generation
	ros-kinetic/nav_msgs
	ros-kinetic/sensor_msgs
	ros-kinetic/std_msgs
"

SLOT="0"
ROS_DISTRO="kinetic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

