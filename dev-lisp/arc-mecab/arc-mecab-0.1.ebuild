# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="4"

inherit eutils

DESCRIPTION="Arc bindings for MeCab"
HOMEPAGE="https://github.com/mgiken/arc-mecab"

GITHUB_USER="mgiken"
GITHUB_TAG="v${PV}"
SHA1="502b9cb"

SRC_URI="https://github.com/${GITHUB_USER}/${PN}/tarball/${GITHUB_TAG} -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND=">=dev-lisp/arc-mg-3.1.7
		>=app-text/mecab-0.991"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${GITHUB_USER}-${PN}-${SHA1}"
