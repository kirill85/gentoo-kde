# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="KDE Archiving tool"
KEYWORDS=""
IUSE="+archive +bzip2 debug lzma"

DEPEND="
	$(add_kdebase_dep libkonq)
	sys-libs/zlib
	archive? ( >=app-arch/libarchive-2.6.1[bzip2?,lzma?,zlib] )
"
RDEPEND="${DEPEND}"

RESTRICT="test"
# dbus problem

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_with archive LibArchive)
		$(cmake-utils_use_with bzip2 BZip2)
		$(cmake-utils_use_with lzma LibLZMA)
	)
	kde4-base_src_configure
}

pkg_postinst() {
	kde4-base_pkg_postinst
	elog "For creating rar archives, install app-arch/rar"
}
