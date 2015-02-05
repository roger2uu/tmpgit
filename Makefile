PACKAGE = tmpgit
VER = 0.0.1

default:
	@echo "Run 'make install DESTDIR=$destdir' to install."

INSTALL = install

install:
	mkdir -p $(DESTDIR)/var/run/$(PACKAGE)


