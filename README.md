This Linux platform driver is an NVMEM consumer that provides these interface\
files for the respective TLVs of an ONIE format NVMEM device or cell:
 
	country_code    mac_base          part_number    vendor
	crc             manufacture_date  platform_name  vendor_extension 
	device_version  manufacturer      product_name
	diag_version    num_macs          serial_number
	label_revision  onie_version      service_tag
 
See, https://opencomputeproject.github.io/onie/design-spec/hw_requirements.html
