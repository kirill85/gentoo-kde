# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_SELINUX_MODULE="games"
inherit kde4-base

DESCRIPTION="KDE Tron game"
KEYWORDS=""
IUSE="debug"

DEPEND="$(add_kdebase_dep libkdegames)"
RDEPEND="${DEPEND}"

add_blocker ktron
