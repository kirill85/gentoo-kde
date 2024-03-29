# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit kde4-base

DESCRIPTION="Provides interfaces and session daemon to colord"
HOMEPAGE="http://projects.kde.org/projects/playground/graphics/colord-kde"
SRC_URI="mirror://kde/stable/${PN}/${PV}/src/${P}.tar.bz2"

LICENSE="GPL-2+"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=x11-libs/libXrandr-1.3.0
"
RDEPEND="${DEPEND}
	x11-misc/colord
"

pkg_postinst() {
	elog "Optional dependencies:"
	elog "gnome-extra/gnome-color-manager: add support for"
	elog "colorhug calibration devices"
	kde4-base_pkg_postinst
}
