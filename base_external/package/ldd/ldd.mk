
##############################################################
#
# ldd
#
##############################################################
# File edited with assistance from DeepSeek: https://chat.deepseek.com/share/zts7pc730otm3oltvj

# Fill up the contents below in order to reference your assignment 7 git contents
LDD_VERSION = '9577cd1'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-jordankooyman.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

# For kernel modules, we need the kernel headers and build system
LDD_DEPENDENCIES = linux

define LDD_BUILD_CMDS
	# Build LDD3 Kernel Modules scull and misc
	$(MAKE) -C $(@D)/misc-modules $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR)
	$(MAKE) -C $(@D)/scull $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR)
endef

define LDD_INSTALL_TARGET_CMDS
	# Install step: copy all generated .ko files into the target's module directory
	mkdir -p $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	$(INSTALL) -D -m 644 $(@D)/misc-modules/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra/
	$(INSTALL) -D -m 644 $(@D)/scull/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra/
endef

$(eval $(generic-package))
