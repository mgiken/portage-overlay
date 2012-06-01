# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="4"

inherit eutils

DESCRIPTION="Gravatar API wrapper for Arc"
HOMEPAGE="https://github.com/mgiken/arc-gravatar"

GITHUB_USER="mgiken"
GITHUB_TAG="v${PV}"
SHA1="393634f"

SRC_URI="https://github.com/${GITHUB_USER}/${PN}/tarball/${GITHUB_TAG} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND=">=dev-lisp/arc-mg-3.1.8.1
		>=dev-lisp/arc-crypto-0.4.1"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${GITHUB_USER}-${PN}-${SHA1}"
