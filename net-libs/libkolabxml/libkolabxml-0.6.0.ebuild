# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils

DESCRIPTION="Kolab XML Format Schema Definitions Library"
HOMEPAGE="kolab.org"
SRC_URI="http://git.kolab.org/${PN}/snapshot/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="csharp java python php test"

DEPEND="
	dev-cpp/xsd
	|| ( >=dev-libs/boost-1.42.0 ( <dev-libs/boost-1.42.0 dev-libs/ossp-uuid ) )
	dev-libs/xerces-c
	csharp? ( dev-lang/swig )
	java? ( dev-lang/swig )
	python? ( dev-lang/swig )
	php? ( dev-lang/swig )
	test? ( x11-libs/qt-test )

"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_with csharp CSHARP_BINDINGS)
		$(cmake-utils_use_with java JAVA_BINDINGS)
		$(cmake-utils_use_with python PYTHON_BINDINGS)
		$(cmake-utils_use_with php PHP_BINDINGS)
		$(cmake-utils_use_with test BUILD_TESTS)
	)
	cmake-utils_src_configure
}