# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION=""
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/tork-a/jsk_3rdparty-release/archive/release/kinetic/jsk_3rdparty/2.0.20-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/assimp_devel
    ros-kinetic/libcmt
    ros-kinetic/rosping
    ros-kinetic/ffha
    ros-kinetic/downward
    ros-kinetic/julius
    ros-kinetic/nlopt
    ros-kinetic/ff
    ros-kinetic/opt_camera
    ros-kinetic/rospatlite
    ros-kinetic/libsiftfast
    ros-kinetic/voice_text
    ros-kinetic/pgm_learner
    ros-kinetic/slic
    ros-kinetic/bayesian_belief_networks
    ros-kinetic/mini_maxwell
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