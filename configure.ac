AC_PREREQ([2.69])

dnl ***********************************************************************
dnl Define Versioning Information
dnl ***********************************************************************
m4_define([major_version],[0])
m4_define([minor_version],[1])
m4_define([micro_version],[3])
m4_define([package_version],[major_version.minor_version.micro_version])
m4_define([bug_report_url],[https://github.com/saigkill/ignore-me/issues])
m4_define([package_url],[https://github.com/saigkill/ignore-me])
m4_define([maintainers_email],[Sascha.Manns@outlook.de])
m4_define([download_page],[https://launchpad.net/ignore-me/0.x/0.1.3/+download/ignore-me_0.1.3.tar.xz])
m4_define([answers_page],[https://github.com/saigkill/ignore-me/issues])
m4_define([feature_requests],[https://github.com/saigkill/ignore-me/issues])
m4_define([api_version],[major_version])

AX_IS_RELEASE([micro_version])


dnl ***********************************************************************
dnl Initialize autoconf
dnl ***********************************************************************
AC_INIT([ignore-me],
        [package_version],
        [bug_report_url],
        [ignore-me],
        [package_url])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_SRCDIR([NEWS])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([build-aux])
AC_USE_SYSTEM_EXTENSIONS
AC_SUBST([ACLOCAL_AMFLAGS], "-I m4")
AC_CANONICAL_HOST


dnl ***********************************************************************
dnl Make information available to autoconf files
dnl ***********************************************************************
AC_SUBST([MAJOR_VERSION],major_version)
AC_SUBST([MINOR_VERSION],minor_version)
AC_SUBST([MICRO_VERSION],micro_version)
AC_SUBST([API_VERSION],api_version)
AC_SUBST([PACKAGE_URL],package_url)
AC_SUBST([BUG_REPORT_URL],bug_report_url)
AC_SUBST([MAINTAINERS_EMAIL],maintainers_email)
AC_SUBST([DOWNLOAD_PAGE],download_page)
AC_SUBST([ANSWERS_PAGE],answers_page)
AC_SUBST([FEATURE_REQUESTS],feature_requests)


dnl ***********************************************************************
dnl Initialize automake
dnl ***********************************************************************
AM_SILENT_RULES([yes])
AM_INIT_AUTOMAKE([1.11 foreign subdir-objects tar-ustar no-dist-gzip dist-xz -Wno-portability])
AM_MAINTAINER_MODE([enable])


dnl ***********************************************************************
dnl Internationalization
dnl ***********************************************************************
GETTEXT_PACKAGE=ignore-me
AC_SUBST([GETTEXT_PACKAGE])
AC_DEFINE_UNQUOTED([GETTEXT_PACKAGE], ["$GETTEXT_PACKAGE"], [GETTEXT package name])
AM_GNU_GETTEXT_VERSION([0.19.2])
AM_GNU_GETTEXT([external])


dnl ***********************************************************************
dnl Check for required programs
dnl ***********************************************************************
AC_PROG_INSTALL
AC_PROG_SED
AC_PATH_PROG([ITSTOOL], [itstool], [notfound])
AC_PATH_PROG([XSLTPROC], [xsltproc], [notfound])
PKG_PROG_PKG_CONFIG([0.22])
PYTHON_MIN_VERSION=3.3
AC_SUBST(PYTHON_MIN_VERSION)
AM_PATH_PYTHON([$PYTHON_MIN_VERSION])

dnl ***********************************************************************
dnl Process .in Files
dnl ***********************************************************************
AC_CONFIG_FILES([
	Makefile
	VERSION
	bin/Makefile
	bin/copy-bzrmk.in
	bin/copy-bzrmk
	bin/copy-cvsmk.in
	bin/copy-cvsmk
	bin/copy-gitmk.in
	bin/copy-gitmk
	bin/copy-hgmk.in
	bin/copy-hgmk
	bin/copy-svnmk.in
	bin/copy-svnmk
	man/Makefile
	man/copy-bzrmk.xml
	man/copy-cvsmk.xml
	man/copy-gitmk.xml
	man/copy-hgmk.xml
	man/copy-svnmk.xml
	po/Makefile.in
    src/Makefile
],[],
[API_VERSION='$API_VERSION'])
AC_OUTPUT

echo ""
echo " ${PACKAGE} - ${VERSION}"
echo ""
echo " Options"
echo ""
echo "  Prefix ............................... : ${prefix}"
echo "  Libdir ............................... : ${libdir}"
echo ""