# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KMNAME="playground/network"
KMMODULE="${PN/-/_}"
KDE_SCM="svn"
OPENGL_REQUIRED="optional"
inherit kde4-base

DESCRIPTION="Service Location Protocol component for KIO"
HOMEPAGE="http://websvn.kde.org/trunk/playground/network/kio_slp/"

LICENSE="GPL-1"
SLOT="4"
KEYWORDS=""
IUSE=""

DEPEND="net-libs/openslp"
RDEPEND="${DEPEND}"
