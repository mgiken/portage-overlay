# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="4"

inherit vcs-snapshot

DESCRIPTION="Arc for mgiken"
HOMEPAGE="https://github.com/mgiken/arc-mg"

SRC_URI="https://github.com/mgiken/${PN}/tarball/v${PV} -> ${P}.tar.gz"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="amd64"

DEPEND=">=dev-scheme/racket-textual-5.3.1
		>=app-misc/rlwrap-0.37"
RDEPEND="${DEPEND}"
