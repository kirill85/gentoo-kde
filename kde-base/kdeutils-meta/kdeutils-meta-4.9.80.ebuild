# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit kde4-meta-pkg

DESCRIPTION="kdeutils - merge this to pull in all kdeutils-derived packages"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="cups floppy"

RDEPEND="
	$(add_kdebase_dep ark)
	$(add_kdebase_dep filelight)
	$(add_kdebase_dep kcalc)
	$(add_kdebase_dep kcharselect)
	$(add_kdebase_dep kdf)
	$(add_kdebase_dep kgpg)
	$(add_kdebase_dep kremotecontrol)
	$(add_kdebase_dep ktimer)
	$(add_kdebase_dep kwallet)
	$(add_kdebase_dep superkaramba)
	$(add_kdebase_dep sweeper)
	cups? ( $(add_kdebase_dep print-manager) )
	floppy? ( $(add_kdebase_dep kfloppy) )
"
