# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KMNAME="kde-runtime"
inherit kde4-meta

DESCRIPTION="Open Collaboration Services provider management"
KEYWORDS=""
IUSE="debug"

DEPEND="
	>=dev-libs/libattica-0.1.4
"
RDEPEND="${DEPEND}"
