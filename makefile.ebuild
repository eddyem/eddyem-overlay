EAPI=8

inherit git-r3 toolchain-funcs

DESCRIPTION="Simple serial terminal"
HOMEPAGE="https://github.com"
EGIT_REPO_URI="https://github.com.git"

LICENSE="GPL-3"
SLOT="0"

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	# Если в Makefile поддерживается DESTDIR и PREFIX:
	emake DESTDIR="${D}" PREFIX="/usr" install

	# Если цели install в Makefile нет, можно ставить напрямую:
	# dobin tty_term
	# dodoc README.md
}
