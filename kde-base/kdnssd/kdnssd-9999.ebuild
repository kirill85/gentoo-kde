# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KMNAME="kdenetwork"
KDE_SCM="svn"
inherit kde4-meta

DESCRIPTION="A DNSSD (DNS Service Discovery - part of Rendezvous) ioslave and kded module"
KEYWORDS=""
IUSE="debug zeroconf"

DEPEND="
	zeroconf? ( $(add_kdebase_dep kdelibs zeroconf) )
"
RDEPEND="${DEPEND}"

src_configure() {
	mycmakeargs=(-DWITH_Xmms=OFF -DWITH_DNSSD=ON)

	kde4-meta_src_configure
}
