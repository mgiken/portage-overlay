# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils git-2

DESCRIPTION="The universal nosql database"
HOMEPAGE="http://www.arangodb.org/"

EGIT_REPO_URI="git://github.com/triAGENS/ArangoDB.git"
EGIT_COMMIT="22d98210b841cd8aacb98c7058b9f7e60640fae9"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"

DEPEND=">=dev-libs/libev-4.04
		>=dev-lang/v8-3.12.19.15
		>=sys-libs/readline-6.2_p1
		>=dev-libs/openssl-1.0.0j
		>=dev-libs/icu-49.1.2"
RDEPEND="${DEPEND}"

pkg_setup() {
	ebegin "Creating arangodb user and group"
	enewgroup arangodb
	enewuser arangodb -1 -1 -1 arangodb
	eend $?
}

src_prepare() {
	sed -i -r 's:\<(O[FN])\>:_Z_\1:g' lib/Zip/*
}

src_configure() {
	econf --localstatedir="${EPREFIX}"/var --disable-all-in-one-v8 --disable-all-in-one-icu --disable-all-in-one-libev|| die "configure
	failed"
}

src_install() {
	emake DESTDIR="${D}" install

	newinitd "${FILESDIR}"/arangodb.initd arangodb

	fowners arangodb:arangodb /var/log/arangodb
	fowners arangodb:root     /var/lib/arangodb
}
