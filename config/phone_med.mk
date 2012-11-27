# Inherit common OSR stuff
$(call inherit-product, vendor/osr/config/device_med.mk)

#Inherit Phone stuff
$(call inherit-product, vendor/osr/config/gsm.mk)

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=CyanTone.ogg \
    ro.config.notification_sound=CyanMessage.ogg \
    ro.config.alarm_alert=CyanAlarm.ogg

# BT config
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf
