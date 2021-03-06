# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="A ROS node that controls a hostapdbased access	point It is mainly intended"
HOMEPAGE="http://ros.org/wiki/hostapd_access_point"
SRC_URI="https://github.com/TheDash/linux_networking-release/archive/release/indigo/hostapd_access_point/1.0.11-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/access_point_control
	ros-indigo/dynamic_reconfigure
	ros-indigo/ieee80211_channels
	ros-indigo/rospy
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

