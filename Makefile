ifneq ($(DH_VERBOSE),)
	V ?= 1
endif

ifneq ($(V),)
	MAKEFLAGS += V=$(V)
else
	Q = @
	MAKEFLAGS += --no-print-directory
endif

ifneq ($(KDIR),)
	MAKEFLAGS += KDIR=$(KDIR)
endif

# subject, verb, object(s)
svo = $(if $(Q),$(info $1 $3))$(Q)$2 $3

define debuild
$(call svo, DEBUILD, debuild -uc -us --lintian-opts --profile debian)
endef

define mk-dkms
$(call svo, DKMS, $(MAKE) -C dkms, $@)
endef

default:

bindeb-pkg: ; $(debuild)

modules modules_install clean: ; $(mk-dkms)

.PHONY: default bindeb-pkg clean modules modules_install
