# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KDE_HANDBOOK="optional"
KDE_SCM="git"
if [[ ${PV} == *9999 ]]; then
	kde_eclass="kde4-base"
else
	KMNAME="kdeaccessibility"
	kde_eclass="kde4-meta"
fi

inherit ${kde_eclass}

DESCRIPTION="KDE program that clicks the mouse for you."
KEYWORDS=""
IUSE="debug"

RDEPEND="
	$(add_kdebase_dep knotify)
"
