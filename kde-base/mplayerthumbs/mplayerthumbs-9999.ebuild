# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit kde4-base

DESCRIPTION="A Thumbnail Generator for Video Files on KDE filemanagers."
KEYWORDS=""
IUSE="debug"

RDEPEND="
	|| (
		$(add_kdebase_dep dolphin)
		$(add_kdebase_dep konqueror)
	)
"

src_configure() {
	mycmakeargs=(
		-DENABLE_PHONON_SUPPORT=ON
	)

	kde4-base_src_configure
}
