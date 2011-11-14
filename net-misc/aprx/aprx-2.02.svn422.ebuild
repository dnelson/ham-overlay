# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="APRS Digipeater and iGate server"
HOMEPAGE="http://ham.zmailer.org/oh2mqk/aprx/"
SRC_URL="http://http://ham.zmailer.org/oh2mqk/aprx/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~x86-linux ~amd64 ~amd64-linux"
RDEPENDS="net-libs/libax25"
DEPENDS="${RDEPENDS}"

src-configure() {
	econf $(use_enable) || die "econf failed"
}

src-install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README
}
