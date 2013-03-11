PRODUCT_BRAND ?= osr

PRODUCT_COPY_FILES += \
    vendor/osr/prebuilt/common/bootanimation/480.zip:system/media/bootanimation.zip

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.feedback \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enterprise_mode=1 \
    windowsmgr.max_events_per_sec=240 \
    ro.kernel.android.checkjni=0 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
    vendor/osr/CHANGELOG.mkdn:system/etc/CHANGELOG-OSR.txt

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/osr/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/osr/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/osr/prebuilt/common/bin/50-cm.sh:system/addon.d/50-cm.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/osr/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/osr/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/osr/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    vendor/osr/prebuilt/common/etc/init.local.rc:system/etc/init.local.rc \
    vendor/osr/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/osr/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/osr/prebuilt/common/etc/mkshrc:system/etc/mkshrc

# T-Mobile theme engine
include vendor/osr/config/themes_common.mk

# Required OSR packages
PRODUCT_PACKAGES += \
    Camera \
    ContactsWidgets \
    FileExplorer \
    LatinIME \
    Notes \
    ROMControl \
    Wallpapers \
    LockClock \
    VideoEditor \
    VoiceDialer \
    SoundRecorder \
    Basic

# Custom C packages
PRODUCT_PACKAGES += \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf

# Extra tools in OSR
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs
# ScreenSavers
PRODUCT_PACKAGES += \
	BasicDreams \
	PhotoTable \
	WebViewDream
	
# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

PRODUCT_PACKAGE_OVERLAYS += vendor/osr/overlay/common

PRODUCT_VERSION_MAINTENANCE = 0

TEAM_PRODUCT := SuperOSR
TEAM_NAME := ST
ANDROID_ALIAS_NAME := JB
PRODUCT_VERSION_DEVICE_SPECIFIC := SuperOSR
PRODUCT_VERSION_MAJOR := 2
OSR_VERSION := $(shell date -u +%y%m.%d)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.osr.version=$(PRODUCT_ROM_FILE) \
  ro.modversion=$(PRODUCT_ROM_FILE)
