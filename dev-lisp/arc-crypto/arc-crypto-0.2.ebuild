# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="4"

inherit eutils

DESCRIPTION="Arc bindings for the libcrypto"
GITHUB_USER="mgiken"
GITHUB_TAG="v${PV}"

HOMEPAGE="https://github.com/${GITHUB_USER}/${PN}"
SRC_URI="https://github.com/${GITHUB_USER}/${PN}/tarball/${GITHUB_TAG} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=dev-lisp/arc-mg-3.1.1
		>=dev-libs/openssl-1.0.0d"

src_unpack() {
	unpack ${A}
	cd "${WORKDIR}"/${GITHUB_USER}-${PN}-*
	S="$(pwd)"
}
