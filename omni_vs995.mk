# Release name
PRODUCT_RELEASE_NAME := vs995

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

PRODUCT_PACKAGES += \
	charger_res_images \
	charger

# Define time zone data path
ifneq ($(wildcard bionic/libc/zoneinfo),)
    TZDATAPATH := bionic/libc/zoneinfo
else ifneq ($(wildcard system/timezone),)
    TZDATAPATH := system/timezone/output_data/iana
endif

# Time Zone data for Recovery
ifdef TZDATAPATH
PRODUCT_COPY_FILES += \
    $(TZDATAPATH)/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata
endif

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := vs995
PRODUCT_MODEL := LG-VS995
PRODUCT_NAME := omni_vs995
PRODUCT_BRAND := lge
PRODUCT_MANUFACTURER := LGE
PRODUCT_COPY_FILES += device/lge/$(PRODUCT_DEVICE)/recovery.fstab:recovery/root/etc/twrp.flags

# Allow missing dependencies
export ALLOW_MISSING_DEPENDENCIES = true
