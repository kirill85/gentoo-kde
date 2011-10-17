# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
KDE_SCM="git"
inherit kde4-base

DESCRIPTION="A small IDE taylored for development of Plasma components, such as Widgets, Runners, Dataengines."
HOMEPAGE="https://projects.kde.org/projects/playground/base/plasmate"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug"

DEPEND="
    >=dev-libs/libattica-0.1.4
    x11-libs/qt-webkit
    app-crypt/gpgme
    kde-base/knewstuff
    $(add_kdebase_dep kdelibs)
"

RDEPEND="
    dev-vcs/git
    ${DEPEND}
"