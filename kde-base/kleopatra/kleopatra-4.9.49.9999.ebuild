# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KDE_HANDBOOK="optional"
KMNAME="kdepim"
inherit kde4-meta

DESCRIPTION="Kleopatra - KDE X.509 key manager"
KEYWORDS=""
IUSE="debug"

DEPEND="
	>=app-crypt/gpgme-1.3.2
	dev-libs/boost
	dev-libs/libassuan
	dev-libs/libgpg-error
	$(add_kdebase_dep kdepimlibs)
	$(add_kdebase_dep kdepim-common-libs)
"
RDEPEND="${DEPEND}
	app-crypt/gnupg
"

KMEXTRACTONLY="
	libkleo/
"

src_unpack() {
	if use handbook; then
		KMEXTRA="
			doc/kwatchgnupg
		"
	fi

	kde4-meta_src_unpack
}
