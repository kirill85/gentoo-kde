# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_HANDBOOK="optional"
KMNAME="kdesdk"
KMMODULE="scripts"
KDE_SCM="svn"
inherit kde4-meta

DESCRIPTION="KDE SDK Scripts"
KEYWORDS=""
IUSE="debug"

RDEPEND="
	app-arch/advancecomp
"

src_prepare() {
	# bug 275069
	sed -ie 's:colorsvn::' scripts/CMakeLists.txt || die

	kde4-meta_src_prepare
}
