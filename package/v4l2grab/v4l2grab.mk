################################################################################
#
# v4l2grab
#
################################################################################

V4L2GRAB_VERSION = 7815752fafb8b797047e819a08a3b6e2f2880846
V4L2GRAB_SITE = $(call github,twam,v4l2grab,$(V4L2GRAB_VERSION))
V4L2GRAB_LICENSE = GPLv2+
V4L2GRAB_LICENSE_FILE = LICENSE
# Fetched from github, no pre-generated configure script provided
V4L2GRAB_AUTORECONF = YES
V4L2GRAB_DEPENDENCIES = libjpeg libv4l

$(eval $(autotools-package))
