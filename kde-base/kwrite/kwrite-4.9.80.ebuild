# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_HANDBOOK="optional"
KMNAME="kate"
KMEXTRACTONLY="doc/kate"
inherit kde4-meta

DESCRIPTION="KDE MDI editor/IDE"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

RDEPEND="
	$(add_kdebase_dep katepart)
"
