# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="4"

inherit eutils

DESCRIPTION="The universal nosql database"
HOMEPAGE="http://www.arangodb.org/"

GITHUB_USER="triAGENS"
GITHUB_TAG="v${PV}"
SHA1="edc0548"

SRC_URI="https://github.com/${GITHUB_USER}/${PN}/tarball/${GITHUB_TAG} -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"

DEPEND=">=dev-libs/libev-4.04
		>=dev-lang/v8-3.9.24.28
		>=sys-libs/readline-6.2_p1
		>=sys-libs/ncurses-5.9-r2
		>=dev-libs/boost-1.48.0-r2"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${GITHUB_USER}-${PN}-${SHA1}"

pkg_setup() {
	ebegin "Creating arangodb user and group"
	enewgroup arangodb
	enewuser arangodb -1 -1 -1 arangodb
	eend $?
}

src_configure() {
	econf --disable-all-in-one --enable-bison --enable-flex || die "configure failed"
}

src_install() {
	emake DESTDIR="${D}" install

	newinitd "${FILESDIR}"/arangod.initd arangod

	keepdir /var/log/arangodb
	fowners arangodb:arangodb /var/log/arangodb
	fowners arangodb:root     /var/lib/arangodb

	sed -i -e 's:/var/lib/log/arangodb/arangod.log:/var/log/arangodb/arangod.log:' "${D}/etc/arangodb/arangod.conf"
}
