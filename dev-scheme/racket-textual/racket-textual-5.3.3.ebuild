# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils

DESCRIPTION="The racket programming environment suited for the console (i.e. does not have any dependencies on GUI libraries)"
HOMEPAGE="http://racket-lang.org/"
SRC_URI="http://download.racket-lang.org/installers/${PV}/${PN}/${P}-src-unix.tgz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="backtrace doc +futures +jit +places +threads"

RDEPEND="virtual/libffi"
DEPEND="${RDEPEND} !dev-scheme/racket"

S="${WORKDIR}/${P}/src"

src_prepare() {
	sed -e "s,docdir=\"\${datadir}/racket/doc,docdir=\"\${datadir}/doc/${PF}," -i configure || die
}

src_configure() {
# according to vapier, we should use the bundled libtool
# such that we don't preclude cross-compile. Thus don't use
# --enable-lt=/usr/bin/libtool
	econf \
		$(use_enable doc docs) \
		--enable-shared \
		$(use_enable jit) \
		--enable-foreign \
		$(use_enable places) \
		$(use_enable futures) \
		$(use_enable backtrace) \
		$(use_enable threads pthread) \
		--disable-gracket \
		--disable-perl
}

src_compile() {
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
