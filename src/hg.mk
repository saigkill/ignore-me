# hg.mk, a small Makefile to autogenerate .hgignore files
# for autotools-based projects.
#
# Copyright 2017-2019 Sascha Manns <Sascha.Manns@outlook.de>
# Based on the git.mk file from Behdad Esfahbod <behdad@behdad.org>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# The latest version of this file can be downloaded from:
HG_MK_URL="https://raw.githubusercontent.com/saigkill/ignore-me/master/src/hg.mk"
#
# Bugs should be reported upstream at:
#   https://github.com/saigkill/ignore-me/issues
#
# To use in your project, import this file in your hg repo's toplevel
# (run `copy-hgmk` in the shell), then do "make -f hg.mk".  This
# modifies Toplevels Makefile.am files in your project to -include hg.mk.
#
# This enables automatic .hgignore generation.  If you need to ignore
# more files, add them to the hgIGNOREFILES variable in your Makefile.am.
# But think twice before doing that.  If a file has to be in .hgignore,
# chances are very high that it's a generated file and should be in one
# of MOSTLYCLEANFILES, CLEANFILES, DISTCLEANFILES, or MAINTAINERCLEANFILES.
#
# The only case that you need to manually add a file to HGIGNOREFILES is
# when remove files in one of mostlyclean-local, clean-local, distclean-local,
# or maintainer-clean-local make targets.
#
# If "make maintainer-clean" removes the files but they are not recognized
# by this script (that is, if "hg status" shows untracked files still), send
# me the output of "hg status" as well as your Makefile.am and Makefile for
# the directories involved and I'll diagnose.
#
# For a list of toplevel files that should be in MAINTAINERCLEANFILES, see
# Makefile.am.sample in $(datadir)/ignore-me.
#
# Don't EXTRA_DIST this file.  It is supposed to only live in hg branches,
# not tarballs.  It serves no useful purpose in tarballs and clutters the
# build dir.
#
# This file knows how to handle autoconf, automake, libtool, gtk-doc,
# gnome-doc-utils, yelp.m4, mallard, intltool, gsettings, dejagnu, appdata,
# appstream.
#
# This makefile provides the following targets:
#
# - all: "make all" will build .hgignore target.
# - .hgignore: make hgignore file for the current dir.
#
# KNOWN ISSUES:
#
# - Recursive configure doesn't work as $(top_srcdir)/hg.mk inside the
#   submodule doesn't find us.  If you have configure.{in,ac} files in
#   subdirs, add a proxy hg.mk file in those dirs that simply does:
#   "include $(top_srcdir)/../hg.mk".  Add more ..'s to your taste.
#   And add those files to hg.
#


###############################################################################
# Variables user modules may want to add to toplevel MAINTAINERCLEANFILES:
###############################################################################

#
# Most autotools-using modules should be fine including this variable in their
# toplevel MAINTAINERCLEANFILES:
HGIGNORE_MAINTAINERCLEANFILES_TOPLEVEL = \
	$(srcdir)/aclocal.m4 \
	$(srcdir)/autoscan.log \
	$(srcdir)/configure.scan \
	`AUX_DIR=$(srcdir)/$$(cd $(top_srcdir); $(AUTOCONF) --trace 'AC_CONFIG_AUX_DIR:$$1' ./configure.ac); \
	 test "x$$AUX_DIR" = "x$(srcdir)/" && AUX_DIR=$(srcdir); \
	 for x in \
		ar-lib \
		compile \
		config.guess \
		config.sub \
		depcomp \
		install-sh \
		ltmain.sh \
		missing \
		mkinstalldirs \
		test-driver \
		ylwrap \
	 ; do echo "$$AUX_DIR/$$x"; done` \
	`cd $(top_srcdir); $(AUTOCONF) --trace 'AC_CONFIG_HEADERS:$$1' ./configure.ac | \
	head -n 1 | while read f; do echo "$(srcdir)/$$f.in"; done`
#
# All modules should also be fine including the following variable, which
# removes automake-generated Makefile.in files:
HGIGNORE_MAINTAINERCLEANFILES_MAKEFILE_IN = \
	`cd $(top_srcdir); $(AUTOCONF) --trace 'AC_CONFIG_FILES:$$1' ./configure.ac | \
	while read f; do \
	  case $$f in Makefile|*/Makefile) \
	    test -f "$(srcdir)/$$f.am" && echo "$(srcdir)/$$f.in";; esac; \
	done`
#
# Modules that use libtool and use  AC_CONFIG_MACRO_DIR() may also include this,
# though it's harmless to include regardless.
HGIGNORE_MAINTAINERCLEANFILES_M4_LIBTOOL = \
	`MACRO_DIR=$(srcdir)/$$(cd $(top_srcdir); $(AUTOCONF) --trace 'AC_CONFIG_MACRO_DIR:$$1' ./configure.ac); \
	 if test "x$$MACRO_DIR" != "x$(srcdir)/"; then \
		for x in \
			libtool.m4 \
			ltoptions.m4 \
			ltsugar.m4 \
			ltversion.m4 \
			lt~obsolete.m4 \
		; do echo "$$MACRO_DIR/$$x"; done; \
	 fi`



###############################################################################
# Default rule is to install ourselves in all Makefile.am files:
###############################################################################

hg-all: hg-mk-install

hg-mk-install:
	@echo "Installing hg makefile"
	@any_failed=; \
		find "`test -z "$(top_srcdir)" && echo . || echo "$(top_srcdir)"`" -name Makefile.am | while read x; do \
		if grep 'include .*/hg.mk' $$x >/dev/null; then \
			echo "$$x already includes hg.mk"; \
		else \
			failed=; \
			echo "Updating $$x"; \
			{ cat $$x; \
			  echo ''; \
			  echo '-include $$(top_srcdir)/hg.mk'; \
			} > $$x.tmp || failed=1; \
			if test x$$failed = x; then \
				mv $$x.tmp $$x || failed=1; \
			fi; \
			if test x$$failed = x; then : else \
				echo "Failed updating $$x"; >&2 \
				any_failed=1; \
			fi; \
	fi; done; test -z "$$any_failed"

hg-mk-update:
	wget $(HG_MK_URL) -O $(top_srcdir)/hg.mk

.PHONY: hg-all hg-mk-install



###############################################################################
# Actual .hgignore generation:
###############################################################################

$(srcdir)/.hgignore: Makefile.am $(top_srcdir)/hg.mk
	@echo "hg.mk: Generating $@"
	@{ \
		if test "x$(DOC_MODULE)" = x -o "x$(DOC_MAIN_SGML_FILE)" = x; then :; else \
			for x in \
				$(DOC_MODULE)-decl-list.txt \
				$(DOC_MODULE)-decl.txt \
				tmpl/$(DOC_MODULE)-unused.sgml \
				"tmpl/*.bak" \
				xml html \
			; do echo "/$$x"; done; \
			FLAVOR=$$(cd $(top_srcdir); $(AUTOCONF) --trace 'GTK_DOC_CHECK:$$2' ./configure.ac); \
			case $$FLAVOR in *no-tmpl*) echo /tmpl;; esac; \
		fi; \
		if test "x$(DOC_MODULE)$(DOC_ID)" = x -o "x$(DOC_LINGUAS)" = x; then :; else \
			for lc in $(DOC_LINGUAS); do \
				for x in \
					$(if $(DOC_MODULE),$(DOC_MODULE).xml) \
					$(DOC_PAGES) \
					$(DOC_INCLUDES) \
				; do echo "/$$lc/$$x"; done; \
			done; \
			for x in \
				$(_DOC_OMF_ALL) \
				$(_DOC_DSK_ALL) \
				$(_DOC_HTML_ALL) \
				$(_DOC_MOFILES) \
				$(DOC_H_FILE) \
				"*/.xml2po.mo" \
				"*/*.omf.out" \
			; do echo /$$x; done; \
		fi; \
		if test "x$(HELP_ID)" = x -o "x$(HELP_LINGUAS)" = x; then :; else \
			for lc in $(HELP_LINGUAS); do \
				for x in \
					$(HELP_FILES) \
					"$$lc.stamp" \
					"$$lc.mo" \
				; do echo "/$$lc/$$x"; done; \
			done; \
		fi; \
		if test "x$(gsettings_SCHEMAS)" = x; then :; else \
			for x in \
				$(gsettings_SCHEMAS:.xml=.valid) \
				$(gsettings__enum_file) \
			; do echo "/$$x"; done; \
		fi; \
		if test "x$(appdata_XML)" = x; then :; else \
			for x in \
				$(appdata_XML:.xml=.valid) \
			; do echo "/$$x"; done; \
		fi; \
		if test "x$(appstream_XML)" = x; then :; else \
			for x in \
				$(appstream_XML:.xml=.valid) \
			; do echo "/$$x"; done; \
		fi; \
		if test -f $(srcdir)/po/Makefile.in.in; then \
			for x in \
				po/Makefile.in.in \
				po/Makefile.in.in~ \
				po/Makefile.in \
				po/Makefile \
				po/Makevars.template \
				po/POTFILES \
				po/Rules-quot \
				po/stamp-it \
				po/.intltool-merge-cache \
				"po/*.gmo" \
				"po/*.header" \
				"po/*.mo" \
				"po/*.sed" \
				"po/*.sin" \
				po/$(GETTEXT_PACKAGE).pot \
				intltool-extract.in \
				intltool-merge.in \
				intltool-update.in \
			; do echo "/$$x"; done; \
		fi; \
		if test -f $(srcdir)/configure; then \
			for x in \
				autom4te.cache \
				configure \
				config.h \
				stamp-h1 \
				libtool \
				config.lt \
			; do echo "/$$x"; done; \
		fi; \
		if test "x$(DEJATOOL)" = x; then :; else \
			for x in \
				$(DEJATOOL) \
			; do echo "/$$x.sum"; echo "/$$x.log"; done; \
			echo /site.exp; \
		fi; \
		if test "x$(am__dirstamp)" = x; then :; else \
			echo "$(am__dirstamp)"; \
		fi; \
		if test "x$(LTCOMPILE)" = x -a "x$(LTCXXCOMPILE)" = x -a "x$(GTKDOC_RUN)" = x; then :; else \
			for x in \
				"*.lo" \
				".libs" "_libs" \
			; do echo "$$x"; done; \
		fi; \
		for x in \
			.hg \
			.hgignore \
			.cvs \
			.cvsignore \
			.git \
			.gitignore \
			.hg \
			.hgignore \
			.idea \
			.svn \
			.svnignore \
			build-aux \
			$(hgIGNOREFILES) \
			$(CLEANFILES) \
			$(PROGRAMS) $(check_PROGRAMS) $(EXTRA_PROGRAMS) \
			$(LIBRARIES) $(check_LIBRARIES) $(EXTRA_LIBRARIES) \
			$(LTLIBRARIES) $(check_LTLIBRARIES) $(EXTRA_LTLIBRARIES) \
			so_locations \
			$(MOSTLYCLEANFILES) \
			$(TEST_LOGS) \
			$(TEST_LOGS:.log=.trs) \
			$(TEST_SUITE_LOG) \
			$(TESTS:=.test) \
			"*.gcda" \
			"*.gcno" \
			$(DISTCLEANFILES) \
			$(am__CONFIG_DISTCLEAN_FILES) \
			$(CONFIG_CLEAN_FILES) \
			TAGS ID GTAGS GRTAGS GSYMS GPATH tags \
			"*.tab.c" \
			$(MAINTAINERCLEANFILES) \
			$(BUILT_SOURCES) \
			$(patsubst %.vala,%.c,$(filter %.vala,$(SOURCES))) \
			$(filter %_vala.stamp,$(DIST_COMMON)) \
			$(filter %.vapi,$(DIST_COMMON)) \
			$(filter $(addprefix %,$(notdir $(patsubst %.vapi,%.h,$(filter %.vapi,$(DIST_COMMON))))),$(DIST_COMMON)) \
			Makefile \
			Makefile.in \
			"*.orig" \
			"*.rej" \
			"*.bak" \
			"*.pyc" \
			"*~" \
			".*.sw[nop]" \
			".dirstamp" \
		; do echo "/$$x"; done; \
		for x in \
			"*.$(OBJEXT)" \
			$(DEPDIR) \
		; do echo "$$x"; done; \
	} | \
	sed "s@^/`echo "$(srcdir)" | sed 's/\(.\)/[\1]/g'`/@/@" | \
	sed 's@/[.]/@/@g' | \
	LC_ALL=C sort | uniq > $@.tmp && \
	mv $@.tmp $@;

all: $(srcdir)/.hgignore

maintainer-clean: hgignore-clean
hgignore-clean:
	-rm -f $(srcdir)/.hgignore

.PHONY: hgignore-clean
