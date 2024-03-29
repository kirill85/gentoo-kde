# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit kde4-base

DESCRIPTION="KDE4 plasmoid. Switch between KWin's compositing and traditional mode with ease."
HOMEPAGE="http://www.kde-look.org/content/show.php/Toggle-Compositing?content=78299"
SRC_URI="http://ivplasma.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
SLOT="4"
IUSE="debug"

RDEPEND="
	!kde-plasmoids/toggle-compositing
	$(add_kdebase_dep plasma-workspace)
"

S="${WORKDIR}/${PN}"
