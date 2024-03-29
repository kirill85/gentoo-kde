# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit kde4-base

DESCRIPTION="Oxygen style and decoration with support for transparency"
HOMEPAGE="https://projects.kde.org/projects/playground/artwork/oxygen-transparent"

LICENSE="as-is"
KEYWORDS=""
SLOT="0"
IUSE="debug"

RDEPEND="
	x11-libs/libX11
"
DEPEND="${RDEPEND}
	$(add_kdebase_dep kwin)
"
