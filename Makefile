ARCHS = arm64 arm64e
TARGET = iphone:clang:16.0:16.0
INSTALL_TARGET_PROJECT_ONLY = 1
THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

SUBPROJECTS += PreferenceBundle

TWEAK_NAME = SplitScreenTweak
SplitScreenTweak_FILES = Tweak.xm
SplitScreenTweak_FRAMEWORKS = UIKit Foundation QuartzCore
SplitScreenTweak_PRIVATE_FRAMEWORKS = FrontBoardServices SpringBoardServices

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"
