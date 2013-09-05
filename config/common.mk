PRODUCT_BRAND ?= osr

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
    PerformanceControl \
    Wallpapers \
    LockClock \
    DashClock \
    DeskClock \
    VideoEditor \
    VoiceDialer \
    SoundRecorder \
    Basic \
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

PRODUCT_PACKAGE_OVERLAYS += vendor/osr/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/osr/overlay/common

TEAM_PRODUCT := SuperOSR
TEAM_NAME := ST
ANDROID_ALIAS_NAME := JB
PRODUCT_VERSION_DEVICE_SPECIFIC := SuperOSR
OSR_VERSION := $(shell date -u +%y%m.%d)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.osr.version=$(PRODUCT_ROM_FILE) \
  ro.modversion=$(PRODUCT_ROM_FILE)
