---
release: 'Version 1.0 - Revision: 0'
title: 'ignore-me README'
---

Introduction {#sec.introduction}
============

This program helps by creating a new ignore file in your project.
Currently it supports BZR, CVS, GIT, HG and SVN.

ignore-me is released under the GNU General Public License (GPL) version
3+, see the file 'COPYING' for more information.

The official web site is: <https://launchpad.net/ignore-me>. Github is
used just as a mirror.

Contributing {#sec.contributing}
============

Ideas {#sec.ideas}
-----

If have some good ideas for stuff that you want to see in this program
you should check the TODO file first before sending email.

Cool Hacks {#sec.cool_hacks}
----------

If you want to provide a cool hack, so please follow that proposals:

-   Open a bugreport on <https://bugs.launchpad.net/ignore-me>.

-   Please use the -u flag when generating the patch as it makes the
    patch more readable.

-   Write a good explanation of what the patch does.

-   It is better to use git format-patch command: git format-patch
    HEAD\^

Merging {#sec.merging}
-------

If you want to merge your branch with the trunk, click on "Propose for
merging" on Launchpad. Please base all Merge requests off the trunk
branch. Merges to X.X only occur through the trunk branch.

Code of Conduct {#sec.code_of_conduct}
---------------

As contributors and maintainers of this project, we pledge to respect
all people who contribute through reporting issues, posting feature
requests, updating documentation, submitting pull requests or patches,
and other activities.

We are committed to making participation in this project a
harassment-free experience for everyone, regardless of level of
experience, gender, gender identity and expression, sexual orientation,
disability, personal appearance, body size, race, age, or religion.

Examples of unacceptable behavior by participants include the use of
sexual language or imagery, derogatory comments or personal attacks,
trolling, public or private harassment, insults, or other unprofessional
conduct.

Project maintainers have the right and responsibility to remove, edit,
or reject comments, commits, code, wiki edits, issues, and other
contributions that are not aligned to this Code of Conduct. Project
maintainers who do not follow the Code of Conduct may be removed from
the project team.

Instances of abusive, harassing, or otherwise unacceptable behavior may
be reported by opening an issue or contacting one or more of the project
maintainers.

This Code of Conduct is adapted from the [Contributor
Covenant](http://contributor-covenant.org/), version 1.0.0, available at
<http://contributor-covenant.org/version/1/0/0/>.

Maintanance Policy {#sec.maintanance_policy}
------------------

I'm following the Semantic Versioning for its releases:
(Major).(Minor).(Patch).

-   Major version: Whenever there is something significant or any
    backwards incompatible changes.

-   Minor version: When new, backwards compatible functionality is
    introduced a minor feature is introduced, or when a set of smaller
    features is rolled out.

-   Patch number: When backwards compatible bug fixes are introduced
    that fix incorrect behavior.

-   The current stable release will receive security patches and bug
    fixes (eg. 5.0 -&gt; 5.0.1).

-   Feature releases will mark the next supported stable release where
    the minor version is increased numerically by increments of one (eg.
    5.0 -&gt; 5.1).

I encourage everyone to run the latest stable release to ensure that you
can easily upgrade to the most secure and feature rich experience. In
order to make sure you can easily run the most recent stable release, we
are working hard to keep the update process simple and reliable.

Prequisites {#sec.prequisites}
-----------

For building and running ignore-me you need:

-   xsltproc (for the manpage)

-   python3

-   itstool

Installation {#sec.installation}
------------

The Installation process is described on:
<https://saigkill.github.io/ignore-me/userdocs/ignore-me/index.html#sec.installation>.

Bug Reporting {#sec.bug_beporting}
-------------

Bugs should be reported to <https://bugs.launchpad.net/ignore-me>. You
will need to create an account for yourself. See if is your problem is
already reported.

Feature Requests {#sec.feature_requests}
----------------

Feature Requests are welcome on:
<https://blueprints.launchpad.net/ignore-me>.

Thanks {#sec.thanks}
------

Thanks Behdad Esfahbod for his initial development of git.mk.

Ressources {#sec.ressources}
----------

-   [*User
    Documentation*](https://saigkill.github.io/ignore-me/userdocs/ignore-me/index.html)

-   [*Release
    Notes*](https://saigkill.github.io/ignore-me/relnotes/ignore-me-release-notes/index.html)
