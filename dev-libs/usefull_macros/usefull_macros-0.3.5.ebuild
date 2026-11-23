EAPI=8

inherit cmake

DESCRIPTION="Common library for most useful C snippets"
HOMEPAGE="https://github.com/eddyem/snippets_library"
SRC_URI="https://github.com/eddyem/snippets_library/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/snippets_library-${PV}"

LICENSE="GPL-3"
SLOT="0"

KEYWORDS="amd64"

BDEPEND="virtual/pkgconfig"
