# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="Wrapper for the concorde traveling salesman problem solver. The code was obtaine"
HOMEPAGE="http://www.math.uwaterloo.ca/tsp/concorde/downloads/downloads.htm"
SRC_URI="https://github.com/ipa320/cob_extern-release/archive/release/kinetic/libconcorde_tsp_solver/0.6.11-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="( CC-BY-SA-3.0 CC-BY-SA-3.0 )"
KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-kinetic/libqsopt
"
DEPEND="${RDEPEND}
	ros-kinetic/catkin
"

SLOT="0"
ROS_DISTRO="kinetic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

