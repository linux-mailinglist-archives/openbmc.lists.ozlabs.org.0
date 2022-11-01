Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EDA61486E
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 12:22:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1ngQ0GVqz3cLX
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 22:22:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=fccCwBk3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=fccCwBk3;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1nfq3SLmz3bhh
	for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2022 22:22:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667301707; bh=SNn2ztNgHSI1Eaozxi2RD7RWfXb7kGVwqgrmpAQeoU0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=fccCwBk3KkJgyTTVolrfHwHtGMRfuzXy/F+MIjaGUBitLFdqkNR/CadHsj8U/5TzI
	 8utwZjG7tRqpJkhPIFkMCQi1W/ONz3FWDpOWjLww7JAYA5N9h62KgJKphD/AsCAC67
	 mkzeF4kF4ur4P1nr4wCNAU7+Aj2l1M7ILdyekX9gLMUfkZjrOTZToh/FzvAh+vPmhu
	 UL4gD9qX8lsmqrl3UxBfcJASSbfzUxr02qGjlhT3stTzhcibXtVen/azhwsP1/nQTk
	 ESlbIzqniihdRWJ0WXVnwabz+iZdPUYHfaMZiWyXCcsiSDcIsesuCljLewkdoJv0PC
	 9mw1wXLlQyJzg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.31]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCKFk-1ohc8v0RBC-009MqG; Tue, 01
 Nov 2022 12:21:47 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v3] ARM: Add wpcm450_defconfig for Nuvoton WPCM450
Date: Tue,  1 Nov 2022 12:21:34 +0100
Message-Id: <20221101112134.673869-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1Pt83EjlArUpPNX6+NB6SQyVSbALIn6wRdmuBjPVhV1d75PkrlC
 9sLCgpWmjy9iQwEFk1AzIVOiyISWGRs08L0C9pjb2CzN+7M+IaZAQ9NTK1Flu47gbm9VNsu
 GnSKXv/TpiHej/AtPFS3GW49rtde7WYw8+8ukMNFTRkdztmOxBZWNKtGmsBMLG/xAqRI0ZL
 9UEDM4ONi1BbRxKr3Yt7w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:U5pHjGQj/jI=;ZpEIBanVqsRq2mz0JZtpof9cKMq
 d3XKFK5YFUbMI5fWzAXXtu4dcskEEkIsRnsFqonsNzRpBsFvwifFZdjV21oNz8lsfMQl3h7Nb
 e0PTC1zREy+7nHhKzpxa1MI7HEhOVy7RDQqg8BINXgNJkohJIN5g6DVFEB4mQEPjWQaPUgG8b
 Wrvb/mI+wAJ0ED/1XLId/I6kylPRhZUkrwG6holuvMmIXsryvuK8YXRQBqqKGc6d2HCi/o0sJ
 EoSfURTlmk/MbmEU7TKnbZdyxf4nnlVclStWOSF6hWW8dPCRlg7t2WMdjo0M8rRH2t0q/O6lo
 LvwqxOC1mmVuZuDa2vToFwqxI72rog4acp1UHnLTbJo1jZ4JMBAkmQxErkyYhYTCBkacw/6uy
 VSGX0SPR1aMmlbba4Yq5xDIbut3bGYNAu/vI286HIL2xAIfhEm7wsaUO20iGACfXlvk4SlTK3
 gWAiaV3yBF3Y4/bRmTJKzcWbvyGJDRmt3wA+rU/HSwwX/Ij7p4sV/01gIkYeMWOVW/RWeByrU
 /ZLfCyb8JCWm8OW4VbeqMTLwbGSft5UI+s9MHG8M1ur8L5WBW3e/MVD2vanMy6rQCV2Efh7yN
 ny2mNtqYmRGlpU1xxwpniGPZuYOGnCkXqs4ZYmre52d3yMjhOD77Qy3TvaqnfnSWGguhOLwCS
 Co2JL8tFnAjigZdQKY3NepvSyNog9dNZY/jIENWk8rY08jIp+VmTljH+KfUCNe6RxsrCjA68F
 CKo76Y63WIOxrWJ5fYuFYhr4kGOBIvGwTMWdFocimF2/RLnjys7Tw5gmGPqUP6T9sjjWMWlLO
 LEdl4CKo9OPPn3sZ/vCg2fiONwftif6W+OzTWszLVJmCDGnAvizTZcmXfmKFW/rvSX6IYR6+/
 +n4M40fPj6qSr8CV8+NwN8X1o+2LR/ybLgeO0bT+VK8+E1o7eeqxVcqRA+SOWjkVd77TozpBV
 4ghe0VqlhSD2pMsKwX258RoLkWo=
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
v3:
- Regenerate for 6.1-rc1 and enable a few Nuvoton-specific options as
  well as the PECI subsystem

v2:
- Regenerate for 5.19-rc1
=2D--
 MAINTAINERS                        |   1 +
 arch/arm/configs/wpcm450_defconfig | 213 +++++++++++++++++++++++++++++
 2 files changed, 214 insertions(+)
 create mode 100644 arch/arm/configs/wpcm450_defconfig

diff --git a/MAINTAINERS b/MAINTAINERS
index cf0f185023724..cac5a4ad4eb8a 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2543,6 +2543,7 @@ S:	Maintained
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
index 0000000000000..702f2bf909f93
=2D-- /dev/null
+++ b/arch/arm/configs/wpcm450_defconfig
@@ -0,0 +1,213 @@
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
2.35.1

