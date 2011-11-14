# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=4
inherit versionator eutils autotools
MY_PV="$(replace_version_separator 2 '.svn')"
MY_P="${PN}-${MY_PV}"
S="${WORKDIR}/${MY_P}"

DESCRIPTION="APRS Digipeater and iGate server"
HOMEPAGE="http://ham.zmailer.org/oh2mqk/aprx/"
SRC_URI="http://ham.zmailer.org/oh2mqk/aprx/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~x86-linux ~amd64 ~amd64-linux"

src_configure() {
	econf || die "econf failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README
	dodoc TODO
	dodoc doc/aprx-manual.pdf
}
