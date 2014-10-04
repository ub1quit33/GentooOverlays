# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-2

DESCRIPTION="Bup: it backs stuff up"
HOMEPAGE=""
SRC_URI=""
EGIT_REPO_URI="git://github.com/bup/bup.git"
EGIT_COMMIT="c16fd3fc28fac913bb8c42560de58bf61ed04922"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
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
		dev-python/fuse-python
		www-servers/tornado"

src_prepare(){
	epatch_user
	epatch "${FILESDIR}/${PF}-python2.patch"
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
