# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit vcs-snapshot

DESCRIPTION="Mac OS X Pasteboard Access Under tmux And screen"
HOMEPAGE="https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard"
SRC_URI="https://github.com/ChrisJohnsen/${PN}/tarball/v${PV} -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~x64-macos"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
  sed -i -e 's/ARCHES = i386 x86_64/ARCHES = x86_64/' Makefile || die
}

src_install() {
  exeinto /usr/bin
  doexe reattach-to-user-namespace || die
}
