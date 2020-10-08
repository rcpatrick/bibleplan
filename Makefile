.POSIX:

OS = $(shell uname -s)
ifndef PREFIX
  PREFIX = /usr/local
endif
MANPREFIX = $(PREFIX)/share/man

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin/
	for script in bin/*; do \
		cp -f $$script $(DESTDIR)$(PREFIX)/bin/; \
		chmod 755 $(DESTDIR)$(PREFIX)/$$script; \
	done
	mkdir -p $(DESTDIR)$(PREFIX)/share/bibleplan
	chmod 755 $(DESTDIR)$(PREFIX)/share/bibleplan
	for file in share/*; do \
		cp -f $$file $(DESTDIR)$(PREFIX)/share/bibleplan/; \
	done
	chmod 777 $(DESTDIR)$(PREFIX)/share/bibleplan/*
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	cp -f bibleplan.1 $(DESTDIR)$(MANPREFIX)/man1/bibleplan.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/bibleplan.1
	if [ "$(PREFIX)" ]; then \
		sed -iba 's:/usr/local:$(PREFIX):' $(DESTDIR)$(PREFIX)/bin/bibleplan; \
	fi

uninstall:
	for script in bin/*; do \
		rm -f $(DESTDIR)$(PREFIX)/bin/$$script; \
	done
	for file in share/*; do \
		rm -f $(DESTDIR)$(PREFIX)/share/bibleplan/$$file; \
	done
	rm -rf $(DESTDIR)$(PREFIX)/bin/bibleplan
	rm -r $(DESTDIR)$(MANPREFIX)/man1/bibleplan.1

PHONY: install uninstall
