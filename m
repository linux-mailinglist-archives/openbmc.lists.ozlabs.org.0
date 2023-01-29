Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5947667FCBB
	for <lists+openbmc@lfdr.de>; Sun, 29 Jan 2023 05:22:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P4J7v1W10z3cPl
	for <lists+openbmc@lfdr.de>; Sun, 29 Jan 2023 15:22:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Niy2mbLa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Niy2mbLa;
	dkim-atps=neutral
X-Greylist: delayed 337 seconds by postgrey-1.36 at boromir; Sun, 29 Jan 2023 15:22:15 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P4J7C2YRmz3bVr
	for <openbmc@lists.ozlabs.org>; Sun, 29 Jan 2023 15:22:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1674966125; bh=jB0GN6pjuGs4Y4RMBAJbchGMXgztVKQSjtZ4VfO96oQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=Niy2mbLafrw1pRVpzWotde0D+ZBnyohprXjUx41DfQuj12YHfwEB155+Z5EZGd1ur
	 W3TasJXjuEH7darvdsN5+MV/ySwJYC0rRKFA+LXoCIPhZ8C2ZB4EgVdPiqvvTgRtW0
	 JvuGPaanj39EZhPLoM++Blve2Q+CqSMk2rcccybG9Uy9RnDSLwdEgeuz1+Ml3Ax+GS
	 2osT0e6xye+VP/ygWKxBFenP2/PsIkoYY0Lzy58UoKvX13lv8neSYc0jsQUvbWSYJ1
	 HCfudsuF7Ro8u3KHFLczzKsZ4zdTjLBGYug1uyqZJd7sYCZ5hHaCyZxt+FejAxIUmm
	 9aVgdMEbsy6zw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.193]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1OXT-1ogED40TAB-012tAQ; Sun, 29
 Jan 2023 05:15:53 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v4] ARM: Add wpcm450_defconfig for Nuvoton WPCM450
Date: Sun, 29 Jan 2023 05:15:46 +0100
Message-Id: <20230129041547.942335-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lOXVWiInWhf7ygVds21knl7DM9dxCYXcXiUQTVVs7iBA3eNJOR1
 J8x64A9zPjnIDRXiaHr5Rf4ZjJcaaIBQz1RagTSfBQxsuNrH5jiUs5Yy/e/KqN8tlRPMVeN
 Xmu+35Pjl8DLppdp0seAKeqE1/SDCdF9vJ52OuBKgE6WM977Fpt6Uk6ClKFJFx3ef+qitXc
 gZ8FktbU4y/+I2apzvE0w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3u7TFn2rr8I=;J2dj9lTw/4yZ/UFJfycYwtuyewN
 tRWvEuNUrdD5fjblWWgLHxJ3Ts69wh8vn4Wsc/Rlvl8GS7rEfQKP1GCnGXz3Gd/YgNJVkbV7h
 28ZmJ6VNnYW4PLs8aRgdp4iA3XFbrFtGLerCnrJlMG0ZyrgL0BF5TlYYm/NkTzz+MJWE6JTgC
 TNG+vxMVZyZrsfz/WaemdY9DOOAeqccgF3TLENVUQZQHVsR9n8nbaPWTYj4RRABrkXa4jGHab
 8TIe+FA7HQONzpEhMkpv4qWc18rxUVvMftV9AtlKpM0f6zin9x+WvGqMbfgrqX2gcVIp7/5aV
 lPyIYT/1w2WO1Pg2Pg0oqh+DPuUdRR1XudKUs0fQLaCdD6znEQP4qE8UP8ldhjm4SeCS/VEdV
 6ql/FOd2DdUAQ27JuANNWnE3rfbM9XJnMD4M5JwEQMFZ25xa6mL4F/tpXUhtTrx1pPltlXaQN
 3Cv6lcYpzdQYH8AHFLzEghGngUUvlks78VMHiJsbn970scVlB5NpF3k7QaDhDTf713qprwHnd
 dgXZQKe8Ct5CcldosaK3jtkSgtIuhWTeE9ECqyKnZH2I7jMIW54+S+gxRys94fNMdi/wr8FdB
 HrU9VnCN7yYCvV7K5cyL1I6cPLiiMHD7dyL2un4togVKw+ci5VKP3zKtqdKOaupLxkizePEVG
 BEPhx8NqH+6LNz/voD8h9TQvI2CtWBIFY+50ufvtotF8EozDMztQ4iuWuPrdCrW0Cr2I80qgI
 y2tEuibQ6tKyGnOOB+Rpa8magjHbaYpvFqOMa3xhgaFjpuPt3U8VpgofJ6JDz6h4qreTYvZ+x
 ZlXL8Hyah1KmjqrQu+wV/vdSJqs4ztnDgGHQh0YeALSWaDiTSHLk1GpgHOZsGwx/zDeHilc94
 nlCQNrmT6rp+UZ00Os+aQaZWW0BxuAqDy9qhXKByUzLIR1jCNE3WeVFRIOo85zzXMn1rMnkfM
 kPOCjY8f2YSa1KFcMNoB+q0JwBY=
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
Cc: linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>, Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This defconfig aims to offer a reasonable set of defaults for all
systems running on a Nuvoton WPCM450 chip.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Joel Stanley <joel@jms.id.au>
=2D--
v4:
- Add Joel's R-b
- Disable CPU_FREQ
- Update for Linux 6.2: Enable CONFIG_SPI_WPCM_FIU, disable
  CONFIG_LEGACY_TIOCSTI
- Disable CONFIG_KEXEC, which isn't generally useful for the BMC usecase

v3:
- https://lore.kernel.org/lkml/20221101112134.673869-1-j.neuschaefer@gmx.n=
et/
- Regenerate for 6.1-rc1 and enable a few Nuvoton-specific options as
  well as the PECI subsystem

v2:
- Regenerate for 5.19-rc1
=2D--
 MAINTAINERS                        |   1 +
 arch/arm/configs/wpcm450_defconfig | 211 +++++++++++++++++++++++++++++
 2 files changed, 212 insertions(+)
 create mode 100644 arch/arm/configs/wpcm450_defconfig

diff --git a/MAINTAINERS b/MAINTAINERS
index f781f936ae35b..a1268a252ce6e 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2609,6 +2609,7 @@ S:	Maintained
 W:	https://github.com/neuschaefer/wpcm450/wiki
 F:	Documentation/devicetree/bindings/*/*wpcm*
 F:	arch/arm/boot/dts/nuvoton-wpcm450*
+F:	arch/arm/configs/wpcm450_defconfig
 F:	arch/arm/mach-npcm/wpcm450.c
 F:	drivers/*/*/*wpcm*
 F:	drivers/*/*wpcm*
diff --git a/arch/arm/configs/wpcm450_defconfig b/arch/arm/configs/wpcm450=
_defconfig
new file mode 100644
index 0000000000000..45483deab034f
=2D-- /dev/null
+++ b/arch/arm/configs/wpcm450_defconfig
@@ -0,0 +1,211 @@
+CONFIG_SYSVIPC=3Dy
+CONFIG_NO_HZ_IDLE=3Dy
+CONFIG_HIGH_RES_TIMERS=3Dy
+CONFIG_PREEMPT=3Dy
+CONFIG_IKCONFIG=3Dy
+CONFIG_IKCONFIG_PROC=3Dy
+CONFIG_LOG_BUF_SHIFT=3D19
+CONFIG_CGROUPS=3Dy
+CONFIG_BLK_DEV_INITRD=3Dy
+CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
+CONFIG_PROFILING=3Dy
+# CONFIG_ARCH_MULTI_V7 is not set
+CONFIG_ARCH_NPCM=3Dy
+CONFIG_ARCH_WPCM450=3Dy
+CONFIG_CPU_DCACHE_WRITETHROUGH=3Dy
+CONFIG_AEABI=3Dy
+CONFIG_UACCESS_WITH_MEMCPY=3Dy
+# CONFIG_ATAGS is not set
+CONFIG_ARM_APPENDED_DTB=3Dy
+CONFIG_CPU_IDLE=3Dy
+CONFIG_KPROBES=3Dy
+CONFIG_JUMP_LABEL=3Dy
+CONFIG_STRICT_KERNEL_RWX=3Dy
+CONFIG_MODULES=3Dy
+CONFIG_MODULE_UNLOAD=3Dy
+CONFIG_NET=3Dy
+CONFIG_PACKET=3Dy
+CONFIG_PACKET_DIAG=3Dy
+CONFIG_UNIX=3Dy
+CONFIG_UNIX_DIAG=3Dy
+CONFIG_INET=3Dy
+CONFIG_IP_MULTICAST=3Dy
+CONFIG_IP_PNP=3Dy
+CONFIG_IP_PNP_DHCP=3Dy
+CONFIG_IP_PNP_BOOTP=3Dy
+CONFIG_NET_DSA=3Dy
+CONFIG_NET_DSA_TAG_DSA=3Dy
+CONFIG_NET_DSA_TAG_EDSA=3Dy
+CONFIG_NET_DSA_TAG_TRAILER=3Dy
+CONFIG_NET_PKTGEN=3Dm
+# CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=3Dy
+CONFIG_DEVTMPFS_MOUNT=3Dy
+CONFIG_MTD=3Dy
+CONFIG_MTD_CMDLINE_PARTS=3Dy
+CONFIG_MTD_BLOCK=3Dy
+CONFIG_MTD_SPI_NOR=3Dy
+CONFIG_MTD_UBI=3Dy
+CONFIG_MTD_UBI_FASTMAP=3Dy
+CONFIG_MTD_UBI_BLOCK=3Dy
+CONFIG_BLK_DEV_LOOP=3Dy
+CONFIG_SRAM=3Dy
+CONFIG_EEPROM_AT24=3Dy
+CONFIG_SCSI=3Dy
+# CONFIG_SCSI_PROC_FS is not set
+# CONFIG_SCSI_LOWLEVEL is not set
+CONFIG_NETDEVICES=3Dy
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
+# CONFIG_NET_VENDOR_FARADAY is not set
+# CONFIG_NET_VENDOR_GOOGLE is not set
+# CONFIG_NET_VENDOR_HISILICON is not set
+# CONFIG_NET_VENDOR_HUAWEI is not set
+# CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MELLANOX is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MICROCHIP is not set
+# CONFIG_NET_VENDOR_MICROSEMI is not set
+# CONFIG_NET_VENDOR_NI is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_NETRONOME is not set
+# CONFIG_NET_VENDOR_PENSANDO is not set
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
+# CONFIG_NET_VENDOR_XILINX is not set
+CONFIG_REALTEK_PHY=3Dy
+# CONFIG_WLAN is not set
+CONFIG_INPUT_FF_MEMLESS=3Dy
+CONFIG_INPUT_EVDEV=3Dy
+CONFIG_KEYBOARD_QT1070=3Dm
+CONFIG_KEYBOARD_GPIO=3Dy
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_VT_HW_CONSOLE_BINDING=3Dy
+CONFIG_LEGACY_PTY_COUNT=3D16
+# CONFIG_LEGACY_TIOCSTI is not set
+CONFIG_SERIAL_8250=3Dy
+CONFIG_SERIAL_8250_CONSOLE=3Dy
+CONFIG_SERIAL_8250_NR_UARTS=3D6
+CONFIG_SERIAL_8250_RUNTIME_UARTS=3D6
+CONFIG_SERIAL_8250_EXTENDED=3Dy
+CONFIG_SERIAL_8250_MANY_PORTS=3Dy
+CONFIG_SERIAL_OF_PLATFORM=3Dy
+CONFIG_NPCM7XX_KCS_IPMI_BMC=3Dy
+CONFIG_IPMI_KCS_BMC_CDEV_IPMI=3Dy
+CONFIG_IPMI_KCS_BMC_SERIO=3Dy
+CONFIG_HW_RANDOM=3Dy
+# CONFIG_HW_RANDOM_NPCM is not set
+CONFIG_I2C=3Dy
+# CONFIG_I2C_COMPAT is not set
+CONFIG_I2C_CHARDEV=3Dy
+CONFIG_I2C_MUX=3Dy
+CONFIG_I2C_NPCM=3Dy
+CONFIG_SPI=3Dy
+CONFIG_SPI_WPCM_FIU=3Dy
+CONFIG_SPI_NPCM_PSPI=3Dy
+CONFIG_PINCTRL_SINGLE=3Dy
+CONFIG_PINCTRL_WPCM450=3Dy
+CONFIG_POWER_SUPPLY=3Dy
+CONFIG_SENSORS_NPCM7XX=3Dy
+# CONFIG_THERMAL is not set
+CONFIG_WATCHDOG=3Dy
+CONFIG_NPCM7XX_WATCHDOG=3Dy
+CONFIG_MFD_SYSCON=3Dy
+CONFIG_REGULATOR=3Dy
+CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
+CONFIG_FB=3Dy
+CONFIG_FB_MODE_HELPERS=3Dy
+# CONFIG_HID is not set
+CONFIG_USB_CHIPIDEA=3Dy
+CONFIG_USB_CHIPIDEA_UDC=3Dy
+CONFIG_USB_GADGET=3Dy
+CONFIG_USB_CONFIGFS=3Dy
+CONFIG_USB_CONFIGFS_SERIAL=3Dy
+CONFIG_USB_CONFIGFS_ACM=3Dy
+CONFIG_USB_CONFIGFS_EEM=3Dy
+CONFIG_USB_CONFIGFS_MASS_STORAGE=3Dy
+CONFIG_USB_CONFIGFS_F_FS=3Dy
+CONFIG_USB_CONFIGFS_F_HID=3Dy
+CONFIG_NEW_LEDS=3Dy
+CONFIG_LEDS_CLASS=3Dy
+CONFIG_LEDS_GPIO=3Dy
+CONFIG_LEDS_TRIGGERS=3Dy
+CONFIG_LEDS_TRIGGER_TIMER=3Dy
+CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
+CONFIG_DMADEVICES=3Dy
+CONFIG_SYNC_FILE=3Dy
+# CONFIG_VIRTIO_MENU is not set
+# CONFIG_VHOST_MENU is not set
+CONFIG_STAGING=3Dy
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_PWM=3Dy
+CONFIG_GENERIC_PHY=3Dy
+CONFIG_PECI=3Dy
+CONFIG_PECI_CPU=3Dy
+CONFIG_MSDOS_FS=3Dy
+CONFIG_VFAT_FS=3Dy
+CONFIG_TMPFS=3Dy
+CONFIG_UBIFS_FS=3Dy
+CONFIG_SQUASHFS=3Dy
+CONFIG_SQUASHFS_XZ=3Dy
+CONFIG_SQUASHFS_ZSTD=3Dy
+# CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_NLS_CODEPAGE_437=3Dy
+CONFIG_NLS_CODEPAGE_850=3Dy
+CONFIG_NLS_ISO8859_1=3Dy
+CONFIG_NLS_ISO8859_2=3Dy
+CONFIG_NLS_UTF8=3Dy
+CONFIG_KEYS=3Dy
+CONFIG_HARDENED_USERCOPY=3Dy
+CONFIG_FORTIFY_SOURCE=3Dy
+CONFIG_CRYPTO_RSA=3Dy
+CONFIG_CRYPTO_AES=3Dy
+CONFIG_CRYPTO_CBC=3Dm
+CONFIG_CRYPTO_PCBC=3Dm
+CONFIG_CRYPTO_CCM=3Dy
+CONFIG_CRYPTO_GCM=3Dy
+CONFIG_CRYPTO_CMAC=3Dy
+CONFIG_CRYPTO_SHA256=3Dy
+CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
+CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
+CONFIG_X509_CERTIFICATE_PARSER=3Dy
+CONFIG_PKCS7_MESSAGE_PARSER=3Dy
+CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
+CONFIG_CRC_CCITT=3Dy
+CONFIG_CRC_ITU_T=3Dm
+CONFIG_LIBCRC32C=3Dy
+CONFIG_PRINTK_TIME=3Dy
+CONFIG_DEBUG_KERNEL=3Dy
+CONFIG_MAGIC_SYSRQ=3Dy
+CONFIG_DEBUG_FS=3Dy
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_DEBUG_PREEMPT is not set
+# CONFIG_FTRACE is not set
+CONFIG_IO_STRICT_DEVMEM=3Dy
+CONFIG_DEBUG_USER=3Dy
+CONFIG_DEBUG_LL=3Dy
+CONFIG_DEBUG_LL_UART_8250=3Dy
+CONFIG_DEBUG_UART_PHYS=3D0xb8000000
+CONFIG_DEBUG_UART_VIRT=3D0x0ff000000
+CONFIG_DEBUG_UART_8250_WORD=3Dy
+CONFIG_EARLY_PRINTK=3Dy
=2D-
2.39.0

