# Installation script for ansifilter.
# See INSTALL for details.

# Installation directories:

# Destination directory for installation (intended for packagers)
DESTDIR =

# Root directory for final installation
PREFIX = /usr

# Location of the binary:
bin_dir = ${PREFIX}/bin/

# Data file directory
data_dir = ${PREFIX}/share/

# Location of the man page:
man_dir = ${data_dir}man/man1/

# Location of the documentation:
doc_dir = ${data_dir}doc/ansifilter/

# Location of additional gui files
desktop_apps = ${data_dir}applications/
desktop_pixmaps = ${data_dir}pixmaps/

# Location of bash completions:
bash_comp_dir = ${data_dir}bash-completion/completions/

# Location of fish completions:
fish_comp_dir = ${data_dir}fish/vendor_completions.d/

# Location of zsh completions:
zsh_comp_dir = ${data_dir}zsh/site-functions/

# Commands:
GZIP=gzip -9f
QMAKE=qmake

INSTALL_DATA=install -m644
INSTALL_PROGRAM=install -m755
MKDIR=mkdir -p -m 755
RMDIR=rm -r -f

all:
	${MAKE} -C ./src -f ./makefile

all-gui gui:
	${QMAKE} -makefile -o src/qt-gui/Makefile src/qt-gui/ansifilter-gui.pro
	${MAKE} -C ./src/qt-gui -f ./Makefile

all-tcl tcl:
	${MAKE} -C ./src/tcl -f ./makefile

install:
	@echo "This script will install ansifilter in the following directories:"
	@echo "Documentation directory: ${DESTDIR}${doc_dir}"
	@echo "Manual directory:        ${DESTDIR}${man_dir}"
	@echo "Binary directory:        ${DESTDIR}${bin_dir}"
	@echo "Bash completions:        ${DESTDIR}${bash_comp_dir}"
	@echo "Fish completions:        ${DESTDIR}${fish_comp_dir}"
	@echo "Zsh completions:         ${DESTDIR}${zsh_comp_dir}"
	@echo

	${MKDIR} ${DESTDIR}${doc_dir}
	${MKDIR} ${DESTDIR}${man_dir}
	${MKDIR} ${DESTDIR}${bin_dir}
	${MKDIR} ${DESTDIR}${bash_comp_dir}
	${MKDIR} ${DESTDIR}${fish_comp_dir}
	${MKDIR} ${DESTDIR}${zsh_comp_dir}

	${INSTALL_DATA} ./man/ansifilter.1 ${DESTDIR}${man_dir}
	-${GZIP} ${DESTDIR}${man_dir}ansifilter.1
	${INSTALL_DATA} ./README.adoc ${DESTDIR}${doc_dir}
	${INSTALL_DATA} ./ChangeLog.adoc ${DESTDIR}${doc_dir}
	${INSTALL_DATA} ./COPYING ${DESTDIR}${doc_dir}
	${INSTALL_DATA} ./INSTALL ${DESTDIR}${doc_dir}
	${INSTALL_DATA} ./sh-completion/ansifilter.bash ${DESTDIR}${bash_comp_dir}ansifilter
	${INSTALL_DATA} ./sh-completion/ansifilter.fish ${DESTDIR}${fish_comp_dir}
	${INSTALL_DATA} ./sh-completion/ansifilter.zsh ${DESTDIR}${zsh_comp_dir}_ansifilter
	${INSTALL_PROGRAM} ./src/ansifilter ${DESTDIR}${bin_dir}

	@echo
	@echo "Done."
	@echo "Type ansifilter --help or man ansifilter for instructions."
	@echo "Do not hesitate to report problems. Unknown bugs are hard to fix."

install-gui:
	${INSTALL_PROGRAM} ./src/qt-gui/ansifilter-gui ${DESTDIR}${bin_dir}
	${MKDIR} ${DESTDIR}${desktop_apps} \
		${DESTDIR}${desktop_pixmaps}
	${INSTALL_DATA} ./ansifilter.desktop ${DESTDIR}${desktop_apps}
	${INSTALL_DATA} ./src/qt-gui/ansifilter.xpm ${DESTDIR}${desktop_pixmaps}

uninstall:
	@echo "Removing ansifilter files from system..."
	${RMDIR} ${DESTDIR}${doc_dir}
	rm -f ${DESTDIR}${man_dir}ansifilter.1.gz
	rm -f ${DESTDIR}${bin_dir}ansifilter
	rm -f ${DESTDIR}${bin_dir}ansifilter-gui
	@echo "Done. Have a nice day!"

clean:
	$(MAKE) -C ./src -f ./makefile clean
	$(MAKE) -C ./src/tcl -f ./makefile clean


completions:
	sh-completion/gen-completions bash >sh-completion/ansifilter.bash
	sh-completion/gen-completions fish >sh-completion/ansifilter.fish
	sh-completion/gen-completions zsh >sh-completion/ansifilter.zsh

help:
	@echo "This makefile offers the following options:"
	@echo
	@echo "(all)            Compile."
	@echo "all-gui          Compile Qt GUI (requires Qt 5.x)"
	@echo "install*         Copy all data files to ${data_dir}."
	@echo "completions      Generate shell completion files."
	@echo "clean            Remove object files and binary."
	@echo "uninstall*       Remove ansifilter files from system."
	@echo
	@echo "* Command needs root privileges."
	@echo "See src/makefile for compilation and linking options."

# Target needed for redhat 9.0 rpmbuild
install-strip:

.PHONY: clean all install apidocs help uninstall install-strip
