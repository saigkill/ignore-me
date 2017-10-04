XSLTPROC_FLAGS = \
        --nonet \
        --stringparam man.output.quietly 1 			\
        --stringparam funcsynopsis.style ansi 		\
        --stringparam man.th.extra1.suppress 1 		\
        --stringparam man.authors.section.enabled 0 \
        --stringparam man.copyright.section.enabled 0

.xml.1:
	$(AM_V_GEN) $(XSLTPROC) $(XSLTPROC_FLAGS) http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl $<

man_MANS = \
	copy-bzrmk.1 \
	copy-cvsmk.1 \
	copy-gitmk.1 \
	copy-hgmk.1 \
	copy-svgmk.1

xml_files = $(man_MANS:.1=.xml)

EXTRA_DIST = $(xml_files) \
			copy-bzrmk.xml.in \
			copy-cvsmk.xml.in \
			copy-gitmk.xml.in \
			copy-hgmk.xml.in \
			copy-svgmk.xml.in

CLEANFILES = \
			$(man_MANS) 	\
			copy-bzrmk.xml 	\
			copy-cvsmk.xml	\
			copy-gitmk.xml	\
			copy-hgmk.xml	\
			copy-svgmk.xml	\
			Makefile 		\
			Makefile.in

DISTCLEANFILES = \
			$(man_MANS) 	\
			copy-bzrmk.xml 	\
			copy-cvsmk.xml	\
			copy-gitmk.xml	\
			copy-hgmk.xml	\
			copy-svgmk.xml	\
			Makefile 		\
			Makefile.in


-include $(top_srcdir)/bzr.mk
