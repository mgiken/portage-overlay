# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

DESCRIPTION="My C implementation of John Gruber's Markdown markup language."
GITHUB_USER="Orc"
GITHUB_TAG="v${PV}"

HOMEPAGE="https://github.com/${GITHUB_USER}/${PN}"
SRC_URI="https://github.com/${GITHUB_USER}/${PN}/tarball/${GITHUB_TAG} -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
	epatch ${FILESDIR}/${P}-configure.patch
}

src_configure() {
	./configure.sh \
		--prefix=/usr \
		--mandir=/usr/share/man \
		--libdir=/usr/lib64 \
		--enable-all-features \
		--shared \
		|| die "configure failed"
}
