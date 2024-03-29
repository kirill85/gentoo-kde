# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KDE_SCM="svn"
inherit kde4-base

DESCRIPTION="Grub frontend for KDE4."
HOMEPAGE="http://kgrubeditor.sourceforge.net/"
ESVN_REPO_URI="https://kgrubeditor.svn.sourceforge.net/svnroot/kgrubeditor/trunk"

LICENSE="GPL-2"
KEYWORDS=""
SLOT="4"
IUSE="debug"

RDEPEND="
	|| (
		sys-boot/grub
		sys-boot/grub-static
	)
"
