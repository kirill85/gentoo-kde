# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KMNAME="kde-workspace"
inherit kde4-meta

DESCRIPTION="The reliable KDE session manager that talks the standard X11R6"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	$(add_kdebase_dep kcminit)
	$(add_kdebase_dep libkworkspace)
	$(add_kdebase_dep solid)
"
RDEPEND="${DEPEND}"

KMEXTRACTONLY="
	kcminit/main.h
	libs/kworkspace/
	libs/kephal/
	kcheckpass/
	solid/
"

KMLOADLIBS="libkworkspace"
