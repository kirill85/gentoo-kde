# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit kde4-base

DESCRIPTION="Simple backup system for KDE"
HOMEPAGE="http://gitorious.org/timevault"
EGIT_REPO_URI="git://gitorious.org/timevault/mainline.git"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS=""
IUSE="debug"

DEPEND="app-backup/rdiff-backup"
RDEPEND="${DEPEND}"

src_install() {
	kde4-base_src_install
	rm "${ED}/usr/share/apps/cmake/modules/PkgConfigGetVar.cmake" || die "workaround deletion failed"
}
