# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KMNAME="kross-interpreters"
KMMODULE="python"
PYTHON_DEPEND="2"
inherit python kde4-meta

DESCRIPTION="Kross scripting framework: Python interpreter"
KEYWORDS=""
IUSE="debug"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
	kde4-meta_pkg_setup
}
