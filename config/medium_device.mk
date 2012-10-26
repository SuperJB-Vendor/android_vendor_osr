PRODUCT_BRAND ?= osr

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_small.mk)

# Get some sounds
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioPackageStars.mk)

# Get the TTS language packs
$(call inherit-product-if-exists, external/svox/pico/lang/PicoLangEsEsInSystem.mk)

# Get everything else from the parent package
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_no_telephony.mk)

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

# init.d support
PRODUCT_COPY_FILES += \
    vendor/osr/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/osr/prebuilt/common/bin/sysinit:system/bin/sysinit

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    vendor/osr/prebuilt/common/etc/init.local.rc:system/etc/init.local.rc \
    vendor/osr/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/osr/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache

PRODUCT_COPY_FILES +=  \
    vendor/osr/proprietary/Term.apk:system/app/Term.apk \
    vendor/osr/proprietary/lib/armeabi/libjackpal-androidterm4.so:system/lib/libjackpal-androidterm4.so \
    vendor/osr/prebuilt/common/apps/Superuser.apk:system/app/Superuser.apk

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/osr/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/osr/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

PRODUCT_PACKAGES += \
    drmserver \
    libdrmframework \
    libdrmframework_jni \
    libfwdlockengine \
    VideoEditor \
    WAPPushManager

PRODUCT_PACKAGES += \
    libvideoeditor_jni \
    libvideoeditor_core \
    libvideoeditor_osal \
    libvideoeditor_videofilters \
    libvideoeditorplayer
    
# Required OSR packages
PRODUCT_PACKAGES += \
    Camera \
    ContactsWidgets \
    Development \
    FileExplorer \
    LatinIME \
    Notes \
    ROMControl \
    SoundRecorder2 \
    SpareParts \
    Superuser \
    Superuser.apk \
    su \
    Wallpapers

# Optional OSR packages
PRODUCT_PACKAGES += \
    VideoEditor \
    VoiceDialer \
    SoundRecorder \
    Basic

# Custom C packages
PRODUCT_PACKAGES += \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf \
    Wallpapers 

# Extra tools in OSR
PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs

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
PRODUCT_VERSION_MAJOR := 2
OSR_VERSION := $(shell date -u +%y%m.%d)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.osr.version=$(PRODUCT_ROM_FILE) \
  ro.modversion=$(PRODUCT_ROM_FILE)
