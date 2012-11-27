# Inherit common OSR stuff
$(call inherit-product, vendor/osr/config/device_low.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/osr/overlay/common_tablets

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=CyanTone.ogg \
    ro.config.notification_sound=CyanMessage.ogg \
    ro.config.alarm_alert=CyanAlarm.ogg

# BT config
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf
