EAPI=8

inherit cmake git-r3 toolchain-funcs

DESCRIPTION="Terminal-based serial port, TCP socket, and UNIX domain socket tool"
HOMEPAGE="https://github.com/eddyem/tty_term"
EGIT_REPO_URI="https://github.com/eddyem/tty_term.git"

LICENSE="GPL-3"
SLOT="0"

IUSE="debug"

DEPEND="
    >=dev-libs/usefull_macros-0.3.5:=
    sys-libs/ncurses:=
    sys-libs/readline:=
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

pkg_pretend() {
    # need C23 support
    if [[ ${MERGE_TYPE} != binary ]]; then
        if tc-is-gcc && [[ $(gcc-major-version) -lt 14 ]]; then
            ewarn "tty_term requires a C23-capable compiler (GCC 14+ or Clang 18+)."
        fi
    fi
}

src_configure() {
    local mycmakeargs=(
        -DDEBUG=$(usex debug ON OFF)
    )
    cmake_src_configure
}
