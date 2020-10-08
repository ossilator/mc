dnl @synopsis mc_VERSION
dnl
dnl Get current version of Midnight Commander from git tags
dnl
dnl @author Slava Zanko <slavazanko@gmail.com>
dnl @version 2009-12-30
dnl @license GPL
dnl @copyright Free Software Foundation, Inc.

AC_DEFUN([mc_VERSION],[
    AC_ARG_ENABLE([git-sha1],
        [AS_HELP_STRING([--disable-git-sha1], [Do not include git SHA1 in version string])],
        [USE_GIT_SHA1=$enableval],
        [USE_GIT_SHA1=yes])
    if test ! -f ${srcdir}/version.h; then
        ${srcdir}/maint/utils/version.sh ${srcdir} $USE_GIT_SHA1
    fi
    if test -f ${srcdir}/version.h; then
        VERSION=$(grep '^#define MC_CURRENT_VERSION' ${srcdir}/version.h | sed 's/.*"\(.*\)"$/\1/')
    else
        VERSION="unknown"
    fi
    AC_SUBST(VERSION)
    AC_SUBST(USE_GIT_SHA1)

    dnl Version and Release without dashes for the distro packages
    DISTR_VERSION=`echo $VERSION | sed 's/^\([[^\-]]*\).*/\1/'`
    DISTR_RELEASE=`echo $VERSION | sed 's/^[[^\-]]*\-\(.*\)/\1/' | sed 's/-/./g'`

    if test `echo $VERSION | grep -c '\-pre'` -ne 0; then
        DISTR_RELEASE="0.$DISTR_RELEASE"
    else
        if test `echo $VERSION | grep -c '\-'` -eq 0; then
            DISTR_RELEASE=1
        else
            DISTR_RELEASE="2.$DISTR_RELEASE"
        fi
    fi

    AC_SUBST(DISTR_VERSION)
    AC_SUBST(DISTR_RELEASE)

])
