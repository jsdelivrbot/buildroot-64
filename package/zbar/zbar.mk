################################################################################
#
# zbar
#
################################################################################

# github have some additional commits for compilling with recent kernel
ZBAR_VERSION = 854a5d97059e395807091ac4d80c53f7968abb8f
ZBAR_SITE = $(call github,ZBar,Zbar,$(ZBAR_VERSION))
ZBAR_LICENSE = LGPLv2.1
ZBAR_LICENSE_FILES = LICENSE
ZBAR_INSTALL_STAGING = YES
ZBAR_AUTORECONF = YES
ZBAR_DEPENDENCIES = libv4l libjpeg
ZBAR_CONF_OPTS = \
	--without-imagemagick \
	--without-qt \
	--without-gtk \
	--without-python \
	--without-x \
	--enable-shared=yes

# fix /usr/bin/install: cannot stat ‘./doc/man/zbarcam.1’: No such file or
#   directory
# make[5]: *** [install-man1] Error 1
define ZBAR_INSTALL_FIXUP
	touch $(@D)/doc/man/zbarcam.1
endef

ZBAR_POST_BUILD_HOOKS += ZBAR_INSTALL_FIXUP

$(eval $(autotools-package))
