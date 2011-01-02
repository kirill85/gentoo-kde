# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

KMNAME="kdegraphics"
KMMODULE="strigi-analyzer"
inherit kde4-meta

DESCRIPTION="kdegraphics: strigi plugins"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

KMEXTRACTONLY="
	libs/mobipocket/
"

DEPEND="
	app-misc/strigi
"
RDEPEND="${DEPEND}"