# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KDE_SCM="svn"
inherit kde4-base

DESCRIPTION="KDE internationalization package"
DEPEND=">=sys-devel/gettext-0.17"
RDEPEND="${DEPEND}"

KEYWORDS=""
IUSE=""

LANGS="af ar be bg bn bn_IN br ca cs csb cy da de el en_GB eo es et eu fa fi fr
	fy ga gl gu he hi hr hsb hu hy is it ja ka kk km kn ko ku lb lt lv mk ml
	ms mt nb nds ne nl nn nso oc pa pl pt pt_BR ro ru rw se sk sl sr sv ta te tg
	th tr uk uz vi wa xh zh_CN zh_HK zh_TW"
for LNG in ${LANGS}; do
	IUSE="${IUSE} linguas_${LNG}"
done
S="${WORKDIR}"/${PN}

pkg_setup() {
	local lng
	for lng in ${LINGUAS}; do
		enabled_linguas+=" ${lng}"
	done
	if [[ -z ${enabled_linguas} ]]; then
		elog
		elog "You either have the LINGUAS variable unset, or it only"
		elog "contains languages not supported by ${P}."
		elog "You won't have any additional language support."
		elog
		elog "${P} supports these language codes:"
		elog "${LANGS}"
		elog
	fi
	kde4-base_pkg_setup
}

src_unpack() {
	local lng

	for lng in ${enabled_linguas}; do
		ESVN_REPO_URI="svn://anonsvn.kde.org/home/kde/trunk/l10n-kde4/${lng}"
		S="${WORKDIR}"/${PN}/${lng}
		subversion_src_unpack
	done
	ESVN_REPO_URI="svn://anonsvn.kde.org/home/kde/trunk/l10n-kde4/scripts"
	S="${WORKDIR}"/${PN}/scripts
	subversion_src_unpack
	S="${WORKDIR}"/${PN}
	kde4-base_src_unpack
}

src_prepare() {
	for lng in ${enabled_linguas}; do
		# we dont want l10n for all playground stuff we need it only for kde!
		rm -r "${S}/${lng}"/data/calligra
		rm -r "${S}/${lng}"/docs/extragear*
		rm -r "${S}/${lng}"/docs/playground*
		rm -r "${S}/${lng}"/docs/kdereview
		rm -r "${S}/${lng}"/docs/calligra
		rm -r "${S}/${lng}"/docs/koffice
		rm -r "${S}/${lng}"/messages/extragear*
		rm -r "${S}/${lng}"/messages/playground*
		rm -r "${S}/${lng}"/messages/kdereview
		rm -r "${S}/${lng}"/messages/calligra
		rm -r "${S}/${lng}"/messages/koffice

		# remove kdepim stuff as well, we have it in seperate kdepim-l10n package
		rm -r "${S}/${lng}"/messages/kdepim*
		rm -r "${S}/${lng}"/docmessages/kdepim*
		rm -r "${S}/${lng}"/docs/kdepim*
	done
}

src_configure() {
	local lng

	if [[ ! -z ${enabled_linguas} ]]; then
		cat <<-EOF > "${S}"/CMakeLists.txt
		project(kde-l10n)

		find_package(KDE4 REQUIRED)
		include (KDE4Defaults)
		include(MacroOptionalAddSubdirectory)

		find_package(Gettext REQUIRED)

		EOF

		for lng in ${enabled_linguas} ; do
			"${S}"/scripts/autogen.sh ${lng}
			echo "add_subdirectory( ${lng} )" >> "${S}"/CMakeLists.txt
		done
		kde4-base_src_configure
	fi
}

src_compile() {
	[[ -z ${enabled_linguas} ]] || kde4-base_src_compile
}

src_test() {
	[[ -z ${enabled_linguas} ]] || kde4-base_src_test
}

src_install() {
	[[ -z ${enabled_linguas} ]] || kde4-base_src_install
}
