# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KMNAME="kdesdk"
KDE_SCM="svn"
inherit kde4-meta

DESCRIPTION="Extra Dolphin plugins"
KEYWORDS=""
IUSE="debug bazaar git mercurial subversion"

DEPEND="
	$(add_kdebase_dep libkonq)
"
RDEPEND="${DEPEND}
	$(add_kdebase_dep kompare)
	bazaar? ( dev-vcs/bzr )
	git? ( dev-vcs/git )
	mercurial? ( dev-vcs/mercurial )
	subversion? ( dev-vcs/subversion )
"

KMLOADLIBS="libkonq"

src_install() {
	{ use bazaar || use git || use mercurial || use subversion; } && kde4-meta_src_install
}

pkg_postinst() {
	if ! use bazaar && ! use git && ! use mercurial && ! use subversion ; then
		einfo
		einfo "You have disabled all plugin use flags. If you want to have vcs"
		einfo "integration in dolphin, enable those of your needs."
		einfo
	fi
}
