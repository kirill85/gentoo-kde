# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KDE_HANDBOOK="optional"
OPENGL_REQUIRED="optional"
KDE_SCM="git"
KMNAME="kdeedu"
if [[ ${PV} == *9999 ]]; then
	kde_eclass="kde4-base"
else
	kde_eclass="kde4-meta"
fi
inherit ${kde_eclass}

DESCRIPTION="MathML-based graph calculator for KDE."
KEYWORDS=""
IUSE="debug +plasma readline"

DEPEND="
	readline? ( sys-libs/readline )
"
RDEPEND="${DEPEND}"

KMEXTRACTONLY="
	libkdeedu/kdeeduui/
	libkdeedu/LibKdeEduConfig.cmake.in
"
KMEXTRA="
	libkdeedu/qtmmlwidget/
"

PATCHES=(
	"${FILESDIR}"/${PN}-4.5.73-solaris-graph2d.patch
)

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_with readline)
		$(cmake-utils_use_with plasma)
		$(cmake-utils_use_with opengl OpenGL)
	)

	${kde_eclass}_src_configure
}

src_test() {
	# disable broken test
	sed -i -e '/mathmlpresentationtest/ s/^/#DO_NOT_RUN_TEST /' \
		"${S}"/"${PN}"/analitza/tests/CMakeLists.txt || \
		die "sed to disable mathmlpresentationtest failed."

	${kde_eclass}_src_test
}