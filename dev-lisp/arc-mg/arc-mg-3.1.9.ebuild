# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="4"

inherit eutils

DESCRIPTION="Arc for mgiken"
HOMEPAGE="https://github.com/mgiken/arc-mg"

GITHUB_USER="mgiken"
GITHUB_TAG="v${PV}"
SHA1="871cc15"

SRC_URI="https://github.com/${GITHUB_USER}/${PN}/tarball/${GITHUB_TAG} -> ${P}.tar.gz"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="amd64"

DEPEND=">=dev-scheme/racket-5.1.2
		>=app-misc/rlwrap-0.37"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${GITHUB_USER}-${PN}-${SHA1}"
