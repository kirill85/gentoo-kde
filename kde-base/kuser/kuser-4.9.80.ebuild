# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_HANDBOOK="optional"
KMNAME="kdeadmin"
KDE_SCM="svn"
inherit kde4-meta

DESCRIPTION="KDE application that helps you manage system users"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	$(add_kdebase_dep kdepimlibs)
"
# notify is needed for dialogs
RDEPEND="${DEPEND}
	$(add_kdebase_dep knotify)
"
