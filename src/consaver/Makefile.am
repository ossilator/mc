pkglibexec_PROGRAMS = cons.saver

cons_saver_SOURCES = cons.saver.c

AM_CPPFLAGS = -I$(top_srcdir)

install-exec-hook:
	chown root:root $(DESTDIR)$(pkglibexecdir)/cons.saver
	chmod u+s $(DESTDIR)$(pkglibexecdir)/cons.saver
