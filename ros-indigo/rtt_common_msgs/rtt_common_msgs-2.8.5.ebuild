# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="The rtt_common_msgs package"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/orocos-gbp/rtt_ros_integration-release/archive/release/indigo/rtt_common_msgs/2.8.5-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/rtt_actionlib_msgs
	ros-indigo/rtt_diagnostic_msgs
	ros-indigo/rtt_geometry_msgs
	ros-indigo/rtt_nav_msgs
	ros-indigo/rtt_sensor_msgs
	ros-indigo/rtt_shape_msgs
	ros-indigo/rtt_stereo_msgs
	ros-indigo/rtt_trajectory_msgs
	ros-indigo/rtt_visualization_msgs
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

