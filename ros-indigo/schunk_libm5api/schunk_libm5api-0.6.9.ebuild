# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="This package wraps the libm5api to use it as a ros dependency. Original sources "
HOMEPAGE="http://ros.org/wiki/schunk_libm5api"
SRC_URI="https://github.com/ipa320/schunk_modular_robotics-release/archive/release/indigo/schunk_libm5api/0.6.9-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="LGPL-2"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/libntcan
	ros-indigo/libpcan
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

