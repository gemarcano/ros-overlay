# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="Interactive manipulation with the JACO Arm"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/gt-rail-release/wpi_jaco-release/archive/release/indigo/jaco_interaction/0.0.25-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/actionlib
	ros-indigo/interactive_markers
	ros-indigo/rail_manipulation_msgs
	ros-indigo/roscpp
	ros-indigo/sensor_msgs
	ros-indigo/std_srvs
	ros-indigo/wpi_jaco_msgs
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

