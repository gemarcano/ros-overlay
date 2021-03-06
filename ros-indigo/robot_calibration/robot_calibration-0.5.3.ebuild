# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="Calibrate a Robot"
HOMEPAGE="http://ros.org/wiki/robot_calibration"
SRC_URI="https://github.com/fetchrobotics-gbp/robot_calibration-release/archive/release/indigo/robot_calibration/0.5.3-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="Apache-2"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/actionlib
	ros-indigo/camera_calibration_parsers
	ros-indigo/control_msgs
	ros-indigo/cv_bridge
	ros-indigo/geometry_msgs
	ros-indigo/kdl_parser
	ros-indigo/moveit_msgs
	ros-indigo/nav_msgs
	ros-indigo/orocos_kdl
	ros-indigo/robot_calibration_msgs
	ros-indigo/rosbag
	ros-indigo/roscpp
	ros-indigo/sensor_msgs
	ros-indigo/std_msgs
	ros-indigo/tf
	sci-libs/ceres-solver
	dev-libs/protobuf
	sci-libs/suitesparse
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
	dev-cpp/gflags
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

