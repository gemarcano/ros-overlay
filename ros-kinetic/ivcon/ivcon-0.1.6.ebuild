# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Mesh Conversion Utility

Used to generate '.iv' files from '.stl' files.  This package has not
been changed since 2001 and appears to be very stable.  We plan on
keeping this package in this revision for mesh conversions.  This
package is only available as a single source file for download.  There
are no local modifications to this package."
HOMEPAGE="https://sourceforge.net/projects/ivcon/"
SRC_URI="https://github.com/ros-gbp/ivcon-release/archive/release/kinetic/ivcon/0.1.6-0.tar.gz"

LICENSE="GPL"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
"
DEPEND="
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo

src_unpack() {
    wget -O ${P}.tar.gz ${SRC_URI}
    tar -xf ${P}.tar.gz
    rm -f ${P}.tar.gz
    mv *${P}* ${P}
}

src_configure() {
    mkdir ${WORKDIR}/src
    cp -R ${WORKDIR}/${P} ${WORKDIR}/src/${P}
}

src_compile() {
    echo ""
}

src_install() {
    echo ""
}

pkg_postinst() {
    cd ../work
    source /opt/ros/kinetic/setup.bash
    catkin_make_isolated --install --install-space="/opt/ros/kinetic" || die
}