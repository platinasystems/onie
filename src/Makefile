ifneq ($(KERNELRELEASE),)

obj-m += onie.o

else

KVERSION ?= `uname -r`
KDIR ?= /lib/modules/$(KVERSION)/build

onie-kmod:
	$(MAKE) -C $(KDIR) M=$$PWD

clean:
	rm -f *.o *.a *.cmd *.ko .onie*.cmd Module.symvers modules.order onie.mod onie.mod.c

.PHONY: onie-kmod clean

endif
