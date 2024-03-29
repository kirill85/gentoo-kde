# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/libmediawiki/libmediawiki-2.9.0.ebuild,v 1.1 2012/09/03 19:11:40 creffett Exp $

EAPI=4

KDE_LINGUAS=""
KDE_MINIMAL="4.9"

CMAKE_MIN_VERSION=2.8

inherit kde4-base

MY_PV=${PV/_/-}
MY_P="digikam-${MY_PV}"
SRC_URI="mirror://kde/unstable/digikam/${MY_P}.tar.bz2"

DESCRIPTION="KDE C++ interface for MediaWiki based web service as wikipedia.org"
HOMEPAGE="http://www.digikam.org/"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT=4

DEPEND=""
RDEPEND=${DEPEND}

#Tests from bug 420205 now hang
RESTRICT=test

S=${WORKDIR}/${MY_P}/extra/${PN}

src_configure() {
	mycmakeargs=(
		-DFORCED_UNBUNDLE=ON
	)
	kde4-base_src_configure
}
