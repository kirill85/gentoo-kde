# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit kde4-base

DESCRIPTION="KDE-based PackageKit frontend"
HOMEPAGE="https://projects.kde.org/projects/playground/sysadmin/apper"

LICENSE="GPL-2"
KEYWORDS=""
SLOT="4"
IUSE="debug"

DEPEND="
	app-admin/packagekit-qt4
"
RDEPEND="${DEPEND}"
