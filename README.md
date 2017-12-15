# ignore-me 0.1.1

1. [Introduction](#introduction)
1. [Contributing](#contributing)
1. [Building](#building)
1. [Communication](#communication)
1. [Problem reporting](#problem-reporting)
1. [Thanks](#thanks)

| What                          | Status                                                                                                                                                                              |
|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| license                       | GPL3                                  |
| authors blog                  | http://saigkill.tuxfamily.org         |
| openhub statistics            | https://www.openhub.net/p/ignore-me   |


## Introduction
This program helps by creating a new ignore file in your project. Currently it supports BZR, CVS, GIT, HG and SVN.

The CHANGELOG contains a detailed description on what has changed. For most
users the NEWS file might be a better place to look since it contains
change summaries between the different versions.

ignore-me is released under the GNU General Public License (GPL) version 3+,
see the file 'COPYING' for more information.

The official web site is:

    https://launchpad.net/ignore-me

## Contributing

### Ideas
  
* If have some good ideas for stuff that you want to see in this program you
should check the TODO file first before sending email.

### Cool hacks

* Open a bugreport on https://bugs.launchpad.net/ignore-me.
* Please use the -u flag when generating the patch as it makes the patch
  more readable.
* Write a good explanation of what the patch does.
* It is better to use git format-patch command: git format-patch HEAD^

### Contributor Code of Conduct

As contributors and maintainers of this project, we pledge to respect all 
people who contribute through reporting issues, posting feature requests, 
updating documentation, submitting pull requests or patches, and other 
activities.

We are committed to making participation in this project a harassment-free 
experience for everyone, regardless of level of experience, gender, gender 
identity and expression, sexual orientation, disability, personal 
appearance, body size, race, age, or religion.

Examples of unacceptable behavior by participants include the use of sexual 
language or imagery, derogatory comments or personal attacks, trolling, 
public or private harassment, insults, or other unprofessional conduct.

Project maintainers have the right and responsibility to remove, edit, or 
reject comments, commits, code, wiki edits, issues, and other contributions 
that are not aligned to this Code of Conduct. Project maintainers who do 
not follow the Code of Conduct may be removed from the project team.

Instances of abusive, harassing, or otherwise unacceptable behavior may be 
reported by opening an issue or contacting one or more of the project 
maintainers.

This Code of Conduct is adapted from the [Contributor Covenant](http:contributor-covenant.org), 
version 1.0.0, available at [http://contributor-covenant.org/version/1/0/0/](http://contributor-covenant.org/version/1/0/0/)

### Maintanance Policy

I'm following the Semantic Versioning for its releases: (Major).(Minor).(Patch).

 * Major version: Whenever there is something significant or any backwards
   incompatible changes.
 * Minor version: When new, backwards compatible functionality is introduced a
   minor feature is introduced, or when a set of smaller features is rolled out.
 * Patch number: When backwards compatible bug fixes are introduced that fix
   incorrect behavior.
 * The current stable release will receive security patches and bug fixes
   (eg. 5.0 -> 5.0.1).
 * Feature releases will mark the next supported stable release where the minor
   version is increased numerically by increments of one (eg. 5.0 -> 5.1).

I encourage everyone to run the latest stable release to ensure that you can
easily upgrade to the most secure and feature rich experience. In order to
make sure you can easily run the most recent stable release, we are working
hard to keep the update process simple and reliable.

## Building

ignore-me requires:
 
* xsltproc (for the manpage)
* python3
* itstool

### Simple install procedure:

1. tar -xf ignore-me-0.1.1.tar.xz	    
1. cd ignore-me-0.1.1			        
1. ./configure					                
1. make					                        
1. [ Become root if necessary ]
1. make install				                    

See the file 'INSTALL' for more detailed information.

### Synopsis

* copy-bzrmk
* copy-cvsmk
* copy-gitmk
* copy-hgmk
* copy-svnmk

## Structure

The development happens on Launchpad. Github is used as Mirror.

### Branches

If you see this information on Github, so please keep in mind, that the active development happens on https://launchpad.net/ignore-me.

#### `trunk` branch

The trunk branch is the current edge of development.

#### `X.X` branch

The X.X branch (eg 0.x) is the last stable branch. It will used for tarballs.

#### Merge Requests

If you want to merge your branch with the trunk, click on "Propose for merging" on Launchpad.

Please base all Merge requests off the `trunk` branch. Merges to `X.X` only occur through the trunk branch.


## Communication

Join the team on: https://launchpad.net/~ignore-me. 

## Problem Reporting

Bugs should be reported to https://bugs.launchpad.net/ignore-me. You will need to create an
account for yourself.

See https://bugs.launchpad.net/ignore-me is your problem is already reported.

## Feature Requests

Feature Requests are welcome on: https://blueprints.launchpad.net/ignore-me.

## Thanks
Thanks Behdad Esfahbod for his initial development of git.mk.
