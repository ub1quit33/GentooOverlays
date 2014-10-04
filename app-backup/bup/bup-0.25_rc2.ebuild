# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-2

DESCRIPTION="Bup: it backs stuff up"
HOMEPAGE=""
SRC_URI=""
EGIT_REPO_URI="git://github.com/bup/bup.git"
EGIT_COMMIT="53ffc4d336b06b3cecac0d817d192d22cb75a1bd"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="|| (
			dev-lang/python:2.4
			dev-lang/python:2.5
			dev-lang/python:2.6
			dev-lang/python:2.7
		)
		dev-vcs/git"
RDEPEND="${DEPEND}
		dev-python/pyxattr
		dev-python/pylibacl
		app-arch/par2cmdline
		dev-python/fuse-python"

src_prepare(){
	epatch_user
	epatch "${FILESDIR}/bup-0.25_rc2-python2.patch"
}

src_configure(){
	true
}

src_install(){
	if [[ -f Makefile ]] || [[ -f GNUmakefile ]] || [[ -f makefile ]] ; then
	  emake import-docs
	  emake DESTDIR="${D}" install
	fi
	doman Documentation/*.1
}
