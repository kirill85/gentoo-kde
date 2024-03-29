# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KDE_LINGUAS="bg ca cs da de en_GB es et eu fi fr it ja km nb nds nl pa
pl pt pt_BR ru sl sr sr@latin sv th tr uk wa zh_TW"
KDE_REQUIRED="never"
inherit flag-o-matic kde4-base

DESCRIPTION="Advanced audio player based on KDE framework."
HOMEPAGE="http://amarok.kde.org/"
if [[ ${PV} != *9999* ]]; then
	SRC_URI="mirror://kde/unstable/${PN}/${PV}/src/${P}.tar.bz2"
	KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
else
	KEYWORDS=""
fi

LICENSE="GPL-2"
SLOT="4"
IUSE="cdda daap debug +embedded ipod lastfm mp3tunes mtp ofa opengl semantic-desktop +utils"

# Tests require gmock - http://code.google.com/p/gmock/
# It's not in the tree yet
RESTRICT="test"

# ipod requires gdk enabled and also gtk compiled in libgpod
COMMONDEPEND="
	>=media-libs/taglib-1.7[asf,mp4]
	>=media-libs/taglib-extras-1.0.1
	app-crypt/qca:2
	>=app-misc/strigi-0.5.7
	$(add_kdebase_dep kdelibs 'opengl?,semantic-desktop?')
	$(add_kdebase_dep kdebase-kioslaves)
	sys-libs/zlib
	>=virtual/mysql-5.1[embedded?]
	x11-libs/qt-core:4
	x11-libs/qt-dbus:4
	x11-libs/qt-script:4
	>=x11-libs/qtscriptgenerator-0.1.0
	cdda? (
		$(add_kdebase_dep libkcddb)
		$(add_kdebase_dep libkcompactdisc)
		|| (
			$(add_kdebase_dep audiocd-kio)
			$(add_kdebase_dep kdemultimedia-kioslaves)
		)
	)
	ipod? ( >=media-libs/libgpod-0.7.0[gtk] )
	lastfm? ( >=media-libs/liblastfm-0.3.0 )
	mp3tunes? (
		dev-libs/glib:2
		dev-libs/libxml2
		dev-libs/openssl
		net-libs/loudmouth
		net-misc/curl
		x11-libs/qt-core:4[glib]
	)
	mtp? ( >=media-libs/libmtp-1.0.0 )
	ofa? ( >=media-libs/libofa-0.9.0 )
	opengl? ( virtual/opengl )
"
DEPEND="${COMMONDEPEND}
	dev-util/automoc
	virtual/pkgconfig
"
RDEPEND="${COMMONDEPEND}
	!media-sound/amarok-utils
	$(add_kdebase_dep phonon-kde)
"

src_configure() {
	# Append minimal-toc cflag for ppc64, see bug 280552 and 292707
	use ppc64 && append-flags -mminimal-toc
	local mycmakeargs

	mycmakeargs=(
		-DWITH_PLAYER=ON
		-DWITH_Libgcrypt=OFF
		$(cmake-utils_use embedded WITH_MYSQL_EMBEDDED)
		$(cmake-utils_use_with ipod)
		$(cmake-utils_use_with ipod Gdk)
		$(cmake-utils_use_with lastfm LibLastFm)
		$(cmake-utils_use_with mtp)
		$(cmake-utils_use_with mp3tunes MP3Tunes)
		$(cmake-utils_use_with ofa LibOFA)
	)

	mycmakeargs+=(
		$(cmake-utils_use_with utils UTILITIES)
	)

	# $(cmake-utils_use_with semantic-desktop Nepomuk)
	# $(cmake-utils_use_with semantic-desktop Soprano)

	kde4-base_src_configure
}

pkg_postinst() {
	kde4-base_pkg_postinst

	if use daap; then
		echo
		elog "You have installed amarok with daap support."
		elog "You may be interested in installing www-servers/mongrel as well."
		echo
	fi

	if ! use embedded; then
		echo
		elog "You've disabled the amarok support for embedded mysql DBs."
		elog "You'll have to configure amarok to use an external db server."
		echo
		elog "Please read http://amarok.kde.org/wiki/MySQL_Server for details on how"
		elog "to configure the external db and migrate your data from the embedded database."
		echo

		if has_version "virtual/mysql[minimal]"; then
			elog "You built mysql with the minimal use flag, so it doesn't include the server."
			elog "You won't be able to use the local mysql installation to store your amarok collection."
			echo
		fi
	fi
}
