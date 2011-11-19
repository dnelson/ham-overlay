# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="This software allows a standard PC soundcard to be used as a packet radio 'modem'."
HOMEPAGE="http://www.baycom.org/~tom/ham/soundmodem/"
SRC_URI="http://www.baycom.org/~tom/ham/soundmodem/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~ppc ~sparc"
IUSE="mmx vms nls"


DEPEND=">=dev-libs/libax25-0.0.7
	dev-libs/libxml2
	x11-libs/gtk+:2
	>=media-libs/alsa-lib-1.0
	media-libs/audiofile
	"
src_configure() {
	econf \
		$(use_enable mmx ) \
		$(use_enable vms ) \
		$(use_with nls included-gettext) \
	|| die "Configure failed!"
}

src_compile() {
	if [ -f Makefile ] || [ -f GNUmakefile ] || [ -f makefile ]; then
		emake || die "emake failed"
	fi
	#cp "${FILESDIR}/soundmodem" "${WORKDIR}/etc/init.d/"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	#newinitd ${FILESDIR}/soundmodem.rc soundmodem
	#newconfd
	dodoc ABOUT-NLS AUTHORS COPYING NEWS README
	doinitd "${FILESDIR}"/soundmodem.initd soundmodem
	insinto /etc/ax25
	doins "${FILESDIR}"/soundmodem.conf || die
}
