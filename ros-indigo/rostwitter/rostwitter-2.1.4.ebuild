# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="The rostwitter package"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/tork-a/jsk_3rdparty-release/archive/release/indigo/rostwitter/2.1.4-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="Apache-1.0"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/rospy
	ros-indigo/std_msgs
	dev-python/oauth2
	dev-python/requests
	dev-python/simplejson
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
	ros-indigo/mk
	dev-vcs/git
	dev-python/setuptools
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

