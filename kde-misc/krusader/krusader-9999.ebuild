# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KDE_HANDBOOK="optional"
KDE_LINGUAS="bg bs ca ca@valencia cs da de el en_GB eo es et fr ga gl hr hu it
ja ko lt mai nb nds nl pl pt pt_BR ro ru sk sl sv tr ug uk zh_CN zh_TW"
inherit kde4-base

DESCRIPTION="An advanced twin-panel (commander-style) file-manager for KDE with many extras."
HOMEPAGE="http://www.krusader.org/"

LICENSE="GPL-2"
KEYWORDS=""
SLOT="4"
IUSE="+bookmarks debug"

RDEPEND="
	$(add_kdebase_dep libkonq)
	sys-libs/zlib
	bookmarks? ( $(add_kdebase_dep keditbookmarks) )
"
DEPEND="${RDEPEND}
	sys-devel/gettext
"
