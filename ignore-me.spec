#
# spec file for package ignore-me (Version 0.1.0)
#
# Copyright (c) 2017 SUSE LINUX Products GmbH, Nuernberg, Germany.
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.

# Please submit bugfixes or comments via http://bugs.opensuse.org/
#

Name:           ignore-me
BuildRequires:  autoconf automake libtool docbook-xsl-stylesheets docbook_4 xsltproc
BuildRequires:  python3-devel >= 3.3
Requires:       python3 >= 3.3
Version:        0.1.2
Release:        0
Url:            https://github.com/saigkill/ignore-me
Group:          Development/Tools/Version Control
License:        GPL-3.0
Summary:        Generator for ignore files for autotools based projects
Source:         %{name}-%{version}.tar.xz
AutoReqProv:    on
Recommends:     %{name}-lang
BuildRoot:      %{_tmppath}/%{name}-%{version}-build

%description
This program helps by creating a ignore file for your autotools
basedproject. After installing it provides some binaries, which can copy
the shipped Makefile into your current project directory.
Currently it supports BZR, CVS, GIT, HG and SVN.
The Makefiles itself providing some useful rules for
blacklisting some of your files to put them into the ignore file.
See it man pages for further information.

Authors:
--------
    Sascha Manns <saigkill@opensuse.org>

%lang_package
%prep
%setup

%build
autoreconf -fi
%configure
make %{?_smp_mflags}

%install
%make_install
%find_lang %{name} %{?no_lang_C}

%files
%defattr (-, root, root)
%doc AUTHORS changelog.gz COPYING NEWS README.md TODO VERSION
%dir %{_datadir}/ignore-me
%{_bindir}/copy-*
%{_datadir}/ignore-me/*.mk
%{_mandir}/man1/copy-*.1%{?ext_man}

%files lang -f %{name}.lang

%changelog