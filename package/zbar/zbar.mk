#############################################################
#
# zbar
#
#############################################################

ZBAR_VERSION = 0.10
ZBAR_SITE = http://sourceforge.net/projects/zbar/files/zbar/$(ZBAR_VERSION)/zbar-$(ZBAR_VERSION).tar.bz2
ZBAR_INSTALL_STAGING = YES
ZBAR_AUTORECONF = YES
ZBAR_DEPENDENCIES = libv4l
ZBAR_CONF_OPT = --without-imagemagick --without-qt --without-gtk --without-python --without-x --without-jpeg --enable-shared=yes

ZBAR_POST_BUILD_HOOKS += ZBAR_INSTALL_FIXUP

define ZBAR_INSTALL_FIXUP
	touch $(@D)/doc/man/zbarcam.1
endef

$(eval $(autotools-package))
