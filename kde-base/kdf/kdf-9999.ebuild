# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="KDE free disk space utility"
KEYWORDS=""
IUSE="debug"

src_unpack() {
	kde4-base_src_unpack
}
