# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit kde4-base

DESCRIPTION="A webcam application to attract sweet girls to kde :)"
HOMEPAGE="http://projects.kde.org/projects/extragear/multimedia/kamoso"

LICENSE="GPL-3"
KEYWORDS=""
SLOT="0"
IUSE="debug"

DEPEND="
	>=media-libs/qt-gstreamer-0.10
	$(add_kdebase_dep libkipi)
"
RDEPEND="${DEPEND}
	media-plugins/gst-plugins-meta[alsa,theora,vorbis,v4l,xv]
"
