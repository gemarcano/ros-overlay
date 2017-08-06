# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="This package provides some worlds for gazebo simulation."
HOMEPAGE="http://ros.org/wiki/cob_gazebo_worlds"
SRC_URI="https://github.com/ipa320/cob_simulation-release/archive/release/kinetic/cob_gazebo_worlds/0.6.8-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="LGPL-2"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-kinetic/cob_default_env_config
	ros-kinetic/controller_manager
	ros-kinetic/gazebo_msgs
	ros-kinetic/gazebo_ros
	ros-kinetic/gazebo_ros_control
	ros-kinetic/joint_state_controller
	ros-kinetic/joint_state_publisher
	ros-kinetic/position_controllers
	ros-kinetic/robot_state_publisher
	ros-kinetic/roslaunch
	ros-kinetic/rospy
	ros-kinetic/std_msgs
	ros-kinetic/tf
	ros-kinetic/velocity_controllers
	ros-kinetic/xacro
"
DEPEND="${RDEPEND}
	ros-kinetic/catkin
"

SLOT="0"
ROS_DISTRO="kinetic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

