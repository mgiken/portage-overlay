# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

DESCRIPTION="My C implementation of John Gruber's Markdown markup language."
HOMEPAGE="http://www.pell.portland.or.us/~orc/Code/discount/"
SRC_URI="http://www.pell.portland.or.us/~orc/Code/discount/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

src_configure() {
	./configure.sh \
		--prefix=/usr \
		--mandir=/usr/share/man \
		--libdir=/usr/lib64 \
		--enable-all-features \
		--shared \
		|| die "configure failed"
}
