PACKAGE = tmpgit
VER = 0.0.1

default:
	@echo "Run 'make install DESTDIR=$destdir' to install."

install:
	mkdir -p $(DESTDIR)/var/run/$(PACKAGE)
	@echo "Run 'make install DESTDIR=$destdir' is ongoing" 





