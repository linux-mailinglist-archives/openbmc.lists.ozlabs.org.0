Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 332D753F1D1
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 23:40:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LH6NC1Jzsz3bml
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 07:40:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=YkfZsCHF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=YkfZsCHF;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LH6Mm744Zz2xKl
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2022 07:39:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1654551571;
	bh=Ub25OerDTVDSW0hO78U2D9GxivYdA0ztHTkjkO37lPc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=YkfZsCHFdJHHp320I59vrH5wgNr/jmnmdMXfI0pb0pHtc7wZS1HhgcDneYFbtiekQ
	 YnSV8KuVrXoNRyGj6abMYYUV40CQ1OkLewkblhbql2TaVdWDSuXE4Fw7y7bBR5+M/0
	 3q/fynWFv50+6sg93kZU43nfkBsqjoQ5UNqrT3RA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.195.3]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4JqV-1nybYo2Imf-000Mks; Mon, 06
 Jun 2022 23:39:31 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2] ARM: Add wpcm450_defconfig for Nuvoton WPCM450
Date: Mon,  6 Jun 2022 23:39:19 +0200
Message-Id: <20220606213922.2059372-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BF2HTBgsZ60zIDC7vXpmeg+H2kxy7NIy/iSLcfHSU1p5jeFbY8V
 AZZLaV3uYdHR22lUqZfr36y6L2ie/OpXe5CusANQBBDFsaf0Ghmk9bb8/NFXhLy3/QCImRJ
 kNQ+5hCdQ6eh7fRd629IxWgP5F2/Fu5pQ3YJXoVPVRKgPaxXDmn3lRuBNnDRb1baIQE7gR2
 3o43mCyocGfeOtGEJLZgg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:M9DfhPp1470=:OJnz3oTgyQmwB90Z8W7Tc1
 R1LeMCQKgHpK5wq5P0OELWCVNXzQHi3NGkOFoVtS+1ZdRN7XDyu5blGz2QoJujUiBawC4aF/L
 yiy9ezm//i5zCDOWR5imUkbUF3bAP2mkbNMQVuTdQU5Ks07Z6uqFG+LSKdUhHhca/zUwSgmql
 dpESRA35b7SFCg76k6wscsSJ+73dm1fGwMj+YyUaCQTLMVs3cdmyg0xNxW+79plDT/Kqbh9Rp
 zjifmyo4UAyDl4Ke+GpZkZbCRRHEtMK7JDBZslBslGcvOcJMR+wPlsL/pDobZfyG/dJAVgzgt
 E6yOnNKCzkpYS6fw8Yk2q/j0oKH6vmf1nEl8hDvdv2KpwlDXn++1GkLdtzj5SeiHaPyJA41y3
 IZhzM7I2+crApu0fOaYUIAi8uEvli4Jqv1zJ/EzWIV/P/ld/iHFM0UfZWlLL2esK2ytxHouoc
 5/+BGs66lj6/3tnGepHOyb0GsU9GJVHxZU9z4abCOLr0bLznIQWur1HDL3Bs1y+wLBD+4mRZD
 06loSjMqf5IEsQSh4woQgpiy0D8IR1Hr6l+fu8r7EY5twmQBJ2OcKOp6InmbWQQmGTWPNiRE1
 e/9Sg2pXb5M7VvVXoDHVovfBZf+L2Y/UpNY6xd0eBuMAPH15+vMlC0nK9hnuPNn1QdKDPnzXc
 6nZncgIfL4ii7IUtiW338KfFduSUZoRrLzM7Hkp+HofCQP41y9UAgto/XEAprqw6T5yImjI2x
 vgBbN5F+RiZ9Wogkou/cKUFnwXsLtG6HBZ64Xll5q/EBTTuLwfAW7poH1aiN+Nv7vuhiQpCB8
 fZoVSV+puCvsp8sw4KtLd0qxeasyV0eHUBG4fQgC435zjiK9JxSwjVBCy0mthLAb0oFzrjwOk
 5j9PfCs3zyEHXrWU0GQ52lgszZfMEtu5XBVxus9BclgcJyWtnXIcylCwUkHlv6HFT/dUsGdER
 j8cQS8p9poYylkVr7euU86XtisfDFxqzbNyWTwvWECAx3mQTewPWcZWF8YN5CwdhBLsdbqa4S
 +So8X6f9zJ4fDo/TegbVk2H0bpte4K91YHpp+0hMxR4l7PN5ywgRkbMaNu0bCRO3EjJJMtOgH
 0yREf2wvl0clSEKuoUS0ZZq9XrJeVJtWl8H+nGLxaUTbBKRnLEbAWtuLQ==
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
Cc: linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This defconfig aims to offer a reasonable set of defaults for all
systems running on a Nuvoton WPCM450 chip.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

v2:
- Regenerate for 5.19-rc1
=2D--
 MAINTAINERS                        |   1 +
 arch/arm/configs/wpcm450_defconfig | 207 +++++++++++++++++++++++++++++
 2 files changed, 208 insertions(+)
 create mode 100644 arch/arm/configs/wpcm450_defconfig

diff --git a/MAINTAINERS b/MAINTAINERS
index a6d3bd9d2a8d0..67432d7129ae0 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2459,6 +2459,7 @@ S:	Maintained
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
index 0000000000000..87d16f17272c5
=2D-- /dev/null
+++ b/arch/arm/configs/wpcm450_defconfig
@@ -0,0 +1,207 @@
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
+CONFIG_KEXEC=3Dy
+CONFIG_CPU_FREQ=3Dy
+CONFIG_CPU_FREQ_STAT=3Dy
+CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=3Dy
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
+CONFIG_SERIAL_8250=3Dy
+CONFIG_SERIAL_8250_CONSOLE=3Dy
+CONFIG_SERIAL_8250_NR_UARTS=3D6
+CONFIG_SERIAL_8250_RUNTIME_UARTS=3D6
+CONFIG_SERIAL_8250_EXTENDED=3Dy
+CONFIG_SERIAL_8250_MANY_PORTS=3Dy
+CONFIG_SERIAL_8250_ASPEED_VUART=3Dm
+CONFIG_SERIAL_OF_PLATFORM=3Dy
+CONFIG_HW_RANDOM=3Dy
+CONFIG_HW_RANDOM_TIMERIOMEM=3Dm
+CONFIG_I2C=3Dy
+# CONFIG_I2C_COMPAT is not set
+CONFIG_I2C_CHARDEV=3Dy
+CONFIG_I2C_MUX=3Dy
+CONFIG_SPI=3Dy
+CONFIG_PINCTRL_SINGLE=3Dy
+CONFIG_PINCTRL_WPCM450=3Dy
+# CONFIG_GPIO_CDEV_V1 is not set
+CONFIG_POWER_SUPPLY=3Dy
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
+CONFIG_CRYPTO_CCM=3Dy
+CONFIG_CRYPTO_GCM=3Dy
+CONFIG_CRYPTO_CBC=3Dm
+CONFIG_CRYPTO_PCBC=3Dm
+CONFIG_CRYPTO_CMAC=3Dy
+CONFIG_CRYPTO_SHA256=3Dy
+CONFIG_CRYPTO_AES=3Dy
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
+CONFIG_DEBUG_UNCOMPRESS=3Dy
+CONFIG_EARLY_PRINTK=3Dy
=2D-
2.35.1

