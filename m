Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A996DD124
	for <lists+openbmc@lfdr.de>; Tue, 11 Apr 2023 06:51:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PwYMK6jGLz3cMh
	for <lists+openbmc@lfdr.de>; Tue, 11 Apr 2023 14:51:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aPVr0iDK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aPVr0iDK;
	dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PwYKp3zXTz3bqw
	for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2023 14:49:50 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-51b0f9d7d70so223508a12.1
        for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2023 21:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681188587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZ46T6aNXSRW6nUfkMVqxK4KphP63nG1UJC20JWCIBs=;
        b=aPVr0iDKfu/6Kr+rDJqvCkvK9pCtQdBswv/dmLoST3hrYI2qStjliOLrHUhW6yi4Sr
         Nasa9qKO5JRKo0SmTUNXxkNvMfsXk6ClMg4SSYFlUC6t/tvjgsnwQafvar/7ZcRoeDbc
         0M++4E6EAgmksaa5zp/xl5qAR6X+a8hQfO8+kNEWRfgDS8FTFl5clQcMvJUH4Hisfe8h
         9RZG3L4upUUvYjjRgleKYvUpJsv+/i4JRd/JyUETuSITHHF3cFgacdCdSIhW3ngdChxm
         SWCXxTqs3ALK6cFjRHLBNtDOppf3PEzlUAGifBwejBleTZAmuNJBN7Hls13/6eTVLM3M
         U7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681188587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RZ46T6aNXSRW6nUfkMVqxK4KphP63nG1UJC20JWCIBs=;
        b=2mCW54XPyhocaENLOeWUype+jEj6+lD1XVZzcLFfWaBhGxG8fZiUgHZUGcZN346+GN
         qhRkEnNwYRag3qHcllfUwA92pEidLPooe3WvbQoD+MRbakjMPK1tf5w9XndRXuYG29ts
         nXXD/ki3qjPGe0mytXRRGsJyqJrvWeemPN1J6JVww8qR2vD5EsOr9VxD3wbNTXfcrAk3
         CCpEU1mJXCYGOLHVsio5w9axKIsHU9zOwS9RpinTpO/QuQ381naTIfFNFi09Cf8uGbf8
         daTsWfaDZaCWZpbu7ms3gq7nwQfEgef+VwlHT4Ie5rXr/GZTspMTiaHnilZIhZmHoBFz
         VseQ==
X-Gm-Message-State: AAQBX9fqI1Bx5+3dbjtBI+7kOtzzZYBIGzu5vu+cFmELetCWffY4qkPa
	kiFrdIBnnngpRJpixKI3V325YGL8GpY=
X-Google-Smtp-Source: AKy350bCFJlXC/oBPrfpCYhaYFVC6UvlrCbzbroVw/K71/dv6TqZnZTcIXl4T44QeXopXQpyRjodNQ==
X-Received: by 2002:aa7:96d3:0:b0:627:e577:4331 with SMTP id h19-20020aa796d3000000b00627e5774331mr14421383pfq.1.1681188586906;
        Mon, 10 Apr 2023 21:49:46 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id s21-20020aa78295000000b0062dc14ee2a7sm8663607pfm.211.2023.04.10.21.49.44
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 21:49:46 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.1 1/2] ARM: config: Add openbmc defconfig
Date: Tue, 11 Apr 2023 14:19:33 +0930
Message-Id: <20230411044935.22608-2-joel@jms.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411044935.22608-1-joel@jms.id.au>
References: <20230411044935.22608-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Currently a copy of aspeed_g5_defconfig, this will be a config for all
BMC boards supported by the multiarch ARM kernel.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/configs/openbmc_defconfig | 314 +++++++++++++++++++++++++++++
 1 file changed, 314 insertions(+)
 create mode 100644 arch/arm/configs/openbmc_defconfig

diff --git a/arch/arm/configs/openbmc_defconfig b/arch/arm/configs/openbmc_defconfig
new file mode 100644
index 000000000000..0c632427e41b
--- /dev/null
+++ b/arch/arm/configs/openbmc_defconfig
@@ -0,0 +1,314 @@
+CONFIG_KERNEL_XZ=y
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=16
+CONFIG_CGROUPS=y
+CONFIG_NAMESPACES=y
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZO is not set
+# CONFIG_RD_LZ4 is not set
+# CONFIG_UID16 is not set
+# CONFIG_SYSFS_SYSCALL is not set
+# CONFIG_AIO is not set
+CONFIG_EMBEDDED=y
+CONFIG_PERF_EVENTS=y
+CONFIG_ARCH_MULTI_V6=y
+CONFIG_ARCH_ASPEED=y
+CONFIG_MACH_ASPEED_G5=y
+CONFIG_MACH_ASPEED_G6=y
+# CONFIG_CACHE_L2X0 is not set
+CONFIG_SMP=y
+# CONFIG_ARM_CPU_TOPOLOGY is not set
+CONFIG_VMSPLIT_2G=y
+CONFIG_NR_CPUS=2
+CONFIG_HIGHMEM=y
+CONFIG_UACCESS_WITH_MEMCPY=y
+# CONFIG_ATAGS is not set
+CONFIG_KEXEC=y
+CONFIG_VFP=y
+CONFIG_NEON=y
+CONFIG_KERNEL_MODE_NEON=y
+CONFIG_JUMP_LABEL=y
+# CONFIG_BLK_DEBUG_FS is not set
+# CONFIG_MQ_IOSCHED_DEADLINE is not set
+# CONFIG_MQ_IOSCHED_KYBER is not set
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+# CONFIG_SWAP is not set
+CONFIG_SLAB_FREELIST_RANDOM=y
+CONFIG_SLAB_FREELIST_HARDENED=y
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_COMPACTION is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_PACKET_DIAG=y
+CONFIG_UNIX=y
+CONFIG_UNIX_DIAG=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_IP_MULTIPLE_TABLES=y
+CONFIG_IP_ROUTE_MULTIPATH=y
+CONFIG_IP_ROUTE_VERBOSE=y
+CONFIG_SYN_COOKIES=y
+# CONFIG_INET_DIAG is not set
+CONFIG_IPV6_ROUTER_PREF=y
+CONFIG_IPV6_ROUTE_INFO=y
+CONFIG_IPV6_OPTIMISTIC_DAD=y
+# CONFIG_IPV6_SIT is not set
+CONFIG_IPV6_MULTIPLE_TABLES=y
+CONFIG_NETFILTER=y
+# CONFIG_NETFILTER_ADVANCED is not set
+CONFIG_VLAN_8021Q=y
+CONFIG_NET_NCSI=y
+CONFIG_MCTP=y
+# CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+CONFIG_MTD=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_PARTITIONED_MASTER=y
+CONFIG_MTD_SPI_NOR=y
+# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_FASTMAP=y
+CONFIG_MTD_UBI_BLOCK=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_NBD=y
+CONFIG_SMPRO_ERRMON=y
+CONFIG_SMPRO_MISC=y
+CONFIG_EEPROM_AT24=y
+CONFIG_EEPROM_AT25=y
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_NETDEVICES=y
+CONFIG_NETCONSOLE=y
+# CONFIG_NET_VENDOR_ALACRITECH is not set
+# CONFIG_NET_VENDOR_AMAZON is not set
+# CONFIG_NET_VENDOR_AQUANTIA is not set
+# CONFIG_NET_VENDOR_ARC is not set
+# CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_CADENCE is not set
+# CONFIG_NET_VENDOR_CAVIUM is not set
+# CONFIG_NET_VENDOR_CIRRUS is not set
+# CONFIG_NET_VENDOR_CORTINA is not set
+# CONFIG_NET_VENDOR_EZCHIP is not set
+CONFIG_FTGMAC100=y
+# CONFIG_NET_VENDOR_HISILICON is not set
+# CONFIG_NET_VENDOR_HUAWEI is not set
+# CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MELLANOX is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MICROSEMI is not set
+# CONFIG_NET_VENDOR_NI is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_NETRONOME is not set
+# CONFIG_NET_VENDOR_QUALCOMM is not set
+# CONFIG_NET_VENDOR_RENESAS is not set
+# CONFIG_NET_VENDOR_ROCKER is not set
+# CONFIG_NET_VENDOR_SAMSUNG is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SOLARFLARE is not set
+# CONFIG_NET_VENDOR_SMSC is not set
+# CONFIG_NET_VENDOR_SOCIONEXT is not set
+# CONFIG_NET_VENDOR_STMICRO is not set
+# CONFIG_NET_VENDOR_SYNOPSYS is not set
+# CONFIG_NET_VENDOR_VIA is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
+CONFIG_BROADCOM_PHY=y
+CONFIG_REALTEK_PHY=y
+CONFIG_MCTP_SERIAL=y
+CONFIG_MCTP_TRANSPORT_I2C=y
+# CONFIG_USB_NET_DRIVERS is not set
+# CONFIG_WLAN is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+CONFIG_KEYBOARD_GPIO_POLLED=y
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_IBM_PANEL=y
+CONFIG_SERIO_RAW=y
+# CONFIG_VT is not set
+# CONFIG_LEGACY_PTYS is not set
+CONFIG_SERIAL_8250=y
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=6
+CONFIG_SERIAL_8250_RUNTIME_UARTS=6
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_ASPEED_VUART=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_8250_DW=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_ASPEED_KCS_IPMI_BMC=y
+CONFIG_IPMI_KCS_BMC_CDEV_IPMI=y
+CONFIG_IPMI_KCS_BMC_SERIO=y
+CONFIG_ASPEED_BT_IPMI_BMC=y
+CONFIG_SSIF_IPMI_BMC=y
+CONFIG_HW_RANDOM_TIMERIOMEM=y
+CONFIG_TCG_TPM=y
+CONFIG_TCG_TIS_I2C=y
+# CONFIG_I2C_COMPAT is not set
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_MUX_GPIO=y
+CONFIG_I2C_MUX_PCA9541=y
+CONFIG_I2C_MUX_PCA954x=y
+CONFIG_I2C_ASPEED=y
+CONFIG_I2C_FSI=y
+CONFIG_I2C_SLAVE=y
+CONFIG_SPI=y
+CONFIG_SPI_ASPEED_SMC=y
+CONFIG_SPI_FSI=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_ASPEED=y
+CONFIG_GPIO_ASPEED_SGPIO=y
+CONFIG_GPIO_PCA953X=y
+CONFIG_GPIO_PCA953X_IRQ=y
+CONFIG_W1=y
+CONFIG_W1_MASTER_GPIO=y
+CONFIG_W1_SLAVE_THERM=y
+CONFIG_SENSORS_SMPRO=y
+CONFIG_SENSORS_ADT7475=y
+CONFIG_SENSORS_ASPEED=y
+CONFIG_SENSORS_IIO_HWMON=y
+CONFIG_SENSORS_LM75=y
+CONFIG_SENSORS_NCT7904=y
+CONFIG_SENSORS_OCC_P9_SBE=y
+CONFIG_PMBUS=y
+CONFIG_SENSORS_ADM1275=y
+CONFIG_SENSORS_IBM_CFFPS=y
+CONFIG_SENSORS_IR35221=y
+CONFIG_SENSORS_IR38064=y
+CONFIG_SENSORS_ISL68137=y
+CONFIG_SENSORS_LM25066=y
+CONFIG_SENSORS_MAX31785=y
+CONFIG_SENSORS_MP5023=y
+CONFIG_SENSORS_UCD9000=y
+CONFIG_SENSORS_UCD9200=y
+CONFIG_SENSORS_SBTSI=y
+CONFIG_SENSORS_TMP421=y
+CONFIG_SENSORS_W83773G=y
+CONFIG_WATCHDOG_SYSFS=y
+CONFIG_MFD_SMPRO=y
+CONFIG_MEDIA_SUPPORT=y
+CONFIG_MEDIA_SUPPORT_FILTER=y
+CONFIG_MEDIA_PLATFORM_SUPPORT=y
+CONFIG_V4L_PLATFORM_DRIVERS=y
+CONFIG_VIDEO_ASPEED=y
+CONFIG_DRM=y
+CONFIG_DRM_ASPEED_GFX=y
+CONFIG_FB=y
+CONFIG_USB=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+CONFIG_USB_DYNAMIC_MINORS=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_ROOT_HUB_TT=y
+CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_SERIAL=y
+CONFIG_USB_SERIAL_PL2303=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_ASPEED_VHUB=y
+CONFIG_USB_CONFIGFS=y
+CONFIG_USB_CONFIGFS_MASS_STORAGE=y
+CONFIG_USB_CONFIGFS_F_HID=y
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_OF_ASPEED=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_CLASS_FLASH=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_PCA955X=y
+CONFIG_LEDS_PCA955X_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
+CONFIG_EDAC=y
+CONFIG_EDAC_ASPEED=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_DS1307=y
+CONFIG_RTC_DRV_PCF8523=y
+CONFIG_RTC_DRV_RV8803=y
+CONFIG_RTC_DRV_ASPEED=y
+# CONFIG_VIRTIO_MENU is not set
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_IIO=y
+CONFIG_ASPEED_ADC=y
+CONFIG_MAX1363=y
+CONFIG_SI7020=y
+CONFIG_BMP280=y
+CONFIG_DPS310=y
+CONFIG_RAS=y
+CONFIG_FSI=y
+CONFIG_FSI_MASTER_GPIO=y
+CONFIG_FSI_MASTER_HUB=y
+CONFIG_FSI_MASTER_AST_CF=y
+CONFIG_FSI_MASTER_ASPEED=y
+CONFIG_FSI_SCOM=y
+CONFIG_FSI_SBEFIFO=y
+CONFIG_FSI_OCC=y
+CONFIG_PECI=y
+CONFIG_PECI_CPU=y
+CONFIG_PECI_ASPEED=y
+CONFIG_EXT4_FS=y
+CONFIG_FANOTIFY=y
+CONFIG_OVERLAY_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_JFFS2_FS=y
+# CONFIG_JFFS2_FS_WRITEBUFFER is not set
+CONFIG_JFFS2_SUMMARY=y
+CONFIG_JFFS2_FS_XATTR=y
+CONFIG_UBIFS_FS=y
+CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_XZ=y
+CONFIG_SQUASHFS_ZSTD=y
+CONFIG_PSTORE=y
+CONFIG_PSTORE_CONSOLE=y
+CONFIG_PSTORE_PMSG=y
+CONFIG_PSTORE_FTRACE=y
+CONFIG_PSTORE_RAM=y
+# CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+# CONFIG_SECURITYFS is not set
+CONFIG_HARDENED_USERCOPY=y
+CONFIG_FORTIFY_SOURCE=y
+CONFIG_CRYPTO_HMAC=y
+CONFIG_CRYPTO_SHA256=y
+CONFIG_CRYPTO_USER_API_HASH=y
+# CONFIG_CRYPTO_HW is not set
+# CONFIG_XZ_DEC_X86 is not set
+# CONFIG_XZ_DEC_POWERPC is not set
+# CONFIG_XZ_DEC_IA64 is not set
+# CONFIG_XZ_DEC_SPARC is not set
+CONFIG_PRINTK_TIME=y
+CONFIG_DYNAMIC_DEBUG=y
+CONFIG_DEBUG_INFO_DWARF4=y
+CONFIG_DEBUG_INFO_REDUCED=y
+CONFIG_GDB_SCRIPTS=y
+CONFIG_STRIP_ASM_SYMS=y
+CONFIG_DEBUG_FS=y
+CONFIG_DEBUG_WX=y
+CONFIG_SCHED_STACK_END_CHECK=y
+CONFIG_PANIC_ON_OOPS=y
+CONFIG_PANIC_TIMEOUT=-1
+CONFIG_SOFTLOCKUP_DETECTOR=y
+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
+CONFIG_BOOTPARAM_HUNG_TASK_PANIC=y
+CONFIG_WQ_WATCHDOG=y
+# CONFIG_SCHED_DEBUG is not set
+CONFIG_FUNCTION_TRACER=y
+CONFIG_DEBUG_USER=y
+# CONFIG_RUNTIME_TESTING_MENU is not set
-- 
2.39.2

