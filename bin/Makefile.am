bin_SCRIPTS = copy-bzrmk \
				copy-cvsmk	\
				copy-gitmk 	\
				copy-hgmk 	\
				copy-svnmk

copy-bzrmk: copy-bzrmk.in
	$(AM_V_GEN)$(SED)                       \
		-e s!\@localedir\@!$(localedir)!    \
		-e s!\@pythondir\@!$(pythondir)!    \
		-e s!\@PYTHON\@!$(PYTHON)!          \
		< $< > $@
	@chmod a+x $@

copy-cvsmk: copy-cvsmk.in
	$(AM_V_GEN)$(SED)                       \
		-e s!\@localedir\@!$(localedir)!    \
		-e s!\@pythondir\@!$(pythondir)!    \
		-e s!\@PYTHON\@!$(PYTHON)!          \
		< $< > $@
	@chmod a+x $@

copy-gitmk: copy-gitmk.in
	$(AM_V_GEN)$(SED)                       \
		-e s!\@localedir\@!$(localedir)!    \
		-e s!\@pythondir\@!$(pythondir)!    \
		-e s!\@PYTHON\@!$(PYTHON)!          \
		< $< > $@
	@chmod a+x $@

copy-hgmk: copy-hgmk.in
	$(AM_V_GEN)$(SED)                       \
		-e s!\@localedir\@!$(localedir)!    \
		-e s!\@pythondir\@!$(pythondir)!    \
		-e s!\@PYTHON\@!$(PYTHON)!          \
		< $< > $@
	@chmod a+x $@

copy-svnmk: copy-svnmk.in
	$(AM_V_GEN)$(SED)                       \
		-e s!\@localedir\@!$(localedir)!    \
		-e s!\@pythondir\@!$(pythondir)!    \
		-e s!\@PYTHON\@!$(PYTHON)!          \
		< $< > $@
	@chmod a+x $@

BUILT_SOURCES = $(bin_SCRIPTS)

EXTRA_DIST = copy-bzrmk.in.in \
			copy-cvsmk.in.in	\
			copy-gitmk.in.in	\
			copy-hgmk.in.in		\
			copy-svnmk.in.in

CLEANFILES = \
	$(bin_SCRIPTS) 		\
	Makefile	   		\
	Makefile.in    		\
	copy-bzrmk.in 		\
	copy-cvsmk.in		\
	copy-gitmk.in		\
	copy-hgmk.in		\
	copy-svnmk.in		\
	$(NULL)

MAINTAINERCLEANFILES = 	\
	Makefile	   		\
	Makefile.in    		\
	copy-bzrmk.in 		\
	copy-cvsmk.in		\
	copy-gitmk.in		\
	copy-hgmk.in		\
	copy-svnmk.in		\
	$(NULL)

-include $(top_srcdir)/bzr.mk
-include $(top_srcdir)/git.mk
