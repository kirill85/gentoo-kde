# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

KDE_HANDBOOK="optional"
KMNAME="kdeadmin"

inherit virtualx kde4-meta

DESCRIPTION="KDE system log viewer"
KEYWORDS=""
IUSE="debug test"

src_prepare() {
	kde4-meta_src_prepare

	if use test; then
		# beat this stupid test into shape: the test files contain no year, so
		# comparison succeeds only in 2007 !!!
		local theyear=$(date +%Y)
		sed -e "s:2007:${theyear}:g" -i ksystemlog/tests/systemAnalyzerTest.cpp
	fi
}

src_test() {
	export maketype="kde4-meta_src_test"
	virtualmake
}