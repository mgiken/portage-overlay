# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="4"

inherit eutils

DESCRIPTION="Arc bindings for the libcurl"
HOMEPAGE="https://github.com/mgiken/arc-curl"

GITHUB_USER="mgiken"
GITHUB_TAG="v${PV}"
SHA1="e78d444"

SRC_URI="https://github.com/${GITHUB_USER}/${PN}/tarball/${GITHUB_TAG} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND=">=dev-lisp/arc-mg-3.1.8.1
		>=net-misc/curl-7.24.0"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${GITHUB_USER}-${PN}-${SHA1}"
