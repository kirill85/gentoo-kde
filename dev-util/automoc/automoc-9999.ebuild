# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils flag-o-matic git-2

DESCRIPTION="KDE Meta Object Compiler"
HOMEPAGE="http://www.kde.org"
EGIT_REPO_URI="git://anongit.kde.org/automoc"

LICENSE="as-is"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	x11-libs/qt-core:4
"
RDEPEND="${DEPEND}"

src_prepare() {
	if [[ ${ELIBC} = uclibc ]]; then
		append-flags -pthread
	fi
}
