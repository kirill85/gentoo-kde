# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KMNAME="kde-runtime"
KMMODULE="desktoptheme"
inherit kde4-meta

DESCRIPTION="Oxygen KDE4 desktop theme."
IUSE=""
KEYWORDS=""

RDEPEND="
	!<=kde-misc/knetworkmanager-4.4.0_p20100820
"