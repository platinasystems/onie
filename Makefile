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

default:

bindeb-pkg:
	$(call svo, DEBUILD,\
		debuild -uc -us -ui -b --lintian-opts --profile debian)

modules modules_install clean:
	$(call svo, DKMS, $(MAKE) -C dkms, $@)

.PHONY: default bindeb-pkg clean modules modules_install
