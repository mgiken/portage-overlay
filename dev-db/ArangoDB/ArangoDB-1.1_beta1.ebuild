# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="4"

inherit eutils

DESCRIPTION="The universal nosql database"
HOMEPAGE="http://www.arangodb.org/"

GITHUB_USER="triAGENS"
#GITHUB_TAG="v${PV}"
GITHUB_TAG="v1.1.beta1"
SHA1="4e20c54"

SRC_URI="https://github.com/${GITHUB_USER}/${PN}/tarball/${GITHUB_TAG} -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"

DEPEND=">=dev-libs/libev-4.04
		>=dev-lang/v8-3.12.19.15
		>=sys-libs/readline-6.2_p1
		>=dev-libs/openssl-1.0.0j
		>=dev-libs/icu-49.1.2"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${GITHUB_USER}-${PN}-${SHA1}"

pkg_setup() {
	ebegin "Creating arangodb user and group"
	enewgroup arangodb
	enewuser arangodb -1 -1 -1 arangodb
	eend $?
}

src_configure() {
	emake setup
	econf --localstatedir="${EPREFIX}"/var --disable-all-in-one-v8 --disable-all-in-one-libev --disable-all-in-one-icu || die "configure failed"
}

src_install() {
	emake DESTDIR="${D}" install

	newinitd "${FILESDIR}"/arangodb.initd arangodb

	fowners arangodb:arangodb /var/log/arangodb
	fowners arangodb:root     /var/lib/arangodb
}
