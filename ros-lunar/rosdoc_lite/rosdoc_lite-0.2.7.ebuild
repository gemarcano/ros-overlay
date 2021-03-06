# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="This ROS package wraps documentation tools like doxygen, sphinx,\
	and e[...]"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/rosdoc_lite-release/archive/release/lunar/rosdoc_lite/0.2.7-0.tar.gz -> ${PN}-lunar-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-lunar/genmsg
	dev-python/epydoc
	dev-python/catkin_pkg
	dev-python/kitchen
	dev-python/rospkg
	dev-python/sphinx
	dev-python/pyyaml
"
DEPEND="${RDEPEND}
	ros-lunar/catkin
	app-doc/doxygen
"

SLOT="0"
ROS_DISTRO="lunar"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
