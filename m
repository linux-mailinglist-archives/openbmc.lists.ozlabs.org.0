Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF246170B1
	for <lists+openbmc@lfdr.de>; Wed,  2 Nov 2022 23:30:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2hRx5HbFz3bcw
	for <lists+openbmc@lfdr.de>; Thu,  3 Nov 2022 09:30:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=FMMjLZ+C;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=FMMjLZ+C;
	dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2hRK26g3z2xJR
	for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2022 09:30:19 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id z14so254143wrn.7
        for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2022 15:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9n8sGvPP+TowhsrDlUS2g6QOItwoCJK1HaaC6LkI2GU=;
        b=FMMjLZ+C7Rp3e7iSbVu8nPmQVwj2Cc7utbq+XfsCt510oX3wKH2qnlWHkk/+e9x/iA
         9V3bgRP9NcoaG8Scejt24CR1JayfCg6AiGUTZDMXveiqaEQbyReE7VRZkWkX6DCYV/wo
         zlCnFElE9GwRqkeW3xl8sltNXBldPG3DQ/D6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9n8sGvPP+TowhsrDlUS2g6QOItwoCJK1HaaC6LkI2GU=;
        b=dx1q5t5ynsScIXB+J8ww6/SfFpHCGpJ18nR3iW9uDAPyKoGJUyi4h36FDCRkAPdMOK
         SajAhVTWIXl4Rn1Z7QxDeOGeyD1zuk7rFvVurgQudKVtalK0D0OtzxRrQX+P9Vh10B41
         N/N80K0dRr35RJj5ZfDibsU+v2osK8bxmqez4wWOfwgiV9KhQ6wgwDbKsuSMSGPFUpPH
         eAzzEERMNQ4VK6U6mMKZjIhRYzMcJLOFXpAVVGea0nZxSJj51G7L54ffXOi00NRSdd+K
         RHTmfAfccWDmGRD9WxTTIyGDyfhh6FtWhshEh4nvilvi3td0bYLtQp2lYzPndII12ZzH
         yvmQ==
X-Gm-Message-State: ACrzQf0zuqSL43cmmmcLcf8LG56XNJtWhtO50P+Ov6ECsqfHkUzJMZjS
	HtfEOhZTnDg35RTcdHbX0ihu5fhN7Qrbxn/a1G+Xbpl8
X-Google-Smtp-Source: AMsMyM5BGRj2h7Q+N0lt+Hxwo83HYrV7eJPioCZTLE4SVROAdq8OB5aMDR3mnELajFnnkxm52KdjOvKqntq2k8x3mZk=
X-Received: by 2002:adf:e19e:0:b0:22e:64de:39fa with SMTP id
 az30-20020adfe19e000000b0022e64de39famr16147629wrb.369.1667428210957; Wed, 02
 Nov 2022 15:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <20221101112134.673869-1-j.neuschaefer@gmx.net>
In-Reply-To: <20221101112134.673869-1-j.neuschaefer@gmx.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Nov 2022 22:29:58 +0000
Message-ID: <CACPK8XfnRExua7ZhyAkMNUNwUtmcXrBL3phf9ZMCzpBMN452hw@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: Add wpcm450_defconfig for Nuvoton WPCM450
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 1 Nov 2022 at 11:22, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.ne=
t> wrote:
>
> This defconfig aims to offer a reasonable set of defaults for all
> systems running on a Nuvoton WPCM450 chip.

I was going to ask if we could instead have a common nuvoton
defconfig, but this is an ARMv5 part so we can't also select the ARMv7
npcm750.

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
> v3:
> - Regenerate for 6.1-rc1 and enable a few Nuvoton-specific options as
>   well as the PECI subsystem
>
> v2:
> - Regenerate for 5.19-rc1
> ---
>  MAINTAINERS                        |   1 +
>  arch/arm/configs/wpcm450_defconfig | 213 +++++++++++++++++++++++++++++
>  2 files changed, 214 insertions(+)
>  create mode 100644 arch/arm/configs/wpcm450_defconfig
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cf0f185023724..cac5a4ad4eb8a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2543,6 +2543,7 @@ S:        Maintained
>  W:     https://github.com/neuschaefer/wpcm450/wiki
>  F:     Documentation/devicetree/bindings/*/*wpcm*
>  F:     arch/arm/boot/dts/nuvoton-wpcm450*
> +F:     arch/arm/configs/wpcm450_defconfig
>  F:     arch/arm/mach-npcm/wpcm450.c
>  F:     drivers/*/*/*wpcm*
>  F:     drivers/*/*wpcm*
> diff --git a/arch/arm/configs/wpcm450_defconfig b/arch/arm/configs/wpcm45=
0_defconfig
> new file mode 100644
> index 0000000000000..702f2bf909f93
> --- /dev/null
> +++ b/arch/arm/configs/wpcm450_defconfig
> @@ -0,0 +1,213 @@
> +CONFIG_SYSVIPC=3Dy
> +CONFIG_NO_HZ_IDLE=3Dy
> +CONFIG_HIGH_RES_TIMERS=3Dy
> +CONFIG_PREEMPT=3Dy
> +CONFIG_IKCONFIG=3Dy
> +CONFIG_IKCONFIG_PROC=3Dy
> +CONFIG_LOG_BUF_SHIFT=3D19
> +CONFIG_CGROUPS=3Dy
> +CONFIG_BLK_DEV_INITRD=3Dy
> +CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> +CONFIG_PROFILING=3Dy
> +# CONFIG_ARCH_MULTI_V7 is not set
> +CONFIG_ARCH_NPCM=3Dy
> +CONFIG_ARCH_WPCM450=3Dy
> +CONFIG_CPU_DCACHE_WRITETHROUGH=3Dy
> +CONFIG_AEABI=3Dy
> +CONFIG_UACCESS_WITH_MEMCPY=3Dy
> +# CONFIG_ATAGS is not set
> +CONFIG_ARM_APPENDED_DTB=3Dy

Do you use this? OpenBMC systems tend to just use FIT, so we don't
need this option.

> +CONFIG_KEXEC=3Dy
> +CONFIG_CPU_FREQ=3Dy

Does the wpcm do frequency scaling? If not you could disable this.

> +CONFIG_CPU_FREQ_STAT=3Dy
> +CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=3Dy
> +CONFIG_CPU_IDLE=3Dy
> +CONFIG_KPROBES=3Dy
> +CONFIG_JUMP_LABEL=3Dy
> +CONFIG_STRICT_KERNEL_RWX=3Dy
> +CONFIG_MODULES=3Dy
> +CONFIG_MODULE_UNLOAD=3Dy
> +CONFIG_NET=3Dy
> +CONFIG_PACKET=3Dy
> +CONFIG_PACKET_DIAG=3Dy
> +CONFIG_UNIX=3Dy
> +CONFIG_UNIX_DIAG=3Dy
> +CONFIG_INET=3Dy
> +CONFIG_IP_MULTICAST=3Dy
> +CONFIG_IP_PNP=3Dy
> +CONFIG_IP_PNP_DHCP=3Dy
> +CONFIG_IP_PNP_BOOTP=3Dy
> +CONFIG_NET_DSA=3Dy
> +CONFIG_NET_DSA_TAG_DSA=3Dy
> +CONFIG_NET_DSA_TAG_EDSA=3Dy
> +CONFIG_NET_DSA_TAG_TRAILER=3Dy
> +CONFIG_NET_PKTGEN=3Dm
> +# CONFIG_WIRELESS is not set
> +CONFIG_DEVTMPFS=3Dy
> +CONFIG_DEVTMPFS_MOUNT=3Dy
> +CONFIG_MTD=3Dy
> +CONFIG_MTD_CMDLINE_PARTS=3Dy
> +CONFIG_MTD_BLOCK=3Dy
> +CONFIG_MTD_SPI_NOR=3Dy
> +CONFIG_MTD_UBI=3Dy
> +CONFIG_MTD_UBI_FASTMAP=3Dy
> +CONFIG_MTD_UBI_BLOCK=3Dy
> +CONFIG_BLK_DEV_LOOP=3Dy
> +CONFIG_SRAM=3Dy
> +CONFIG_EEPROM_AT24=3Dy
> +CONFIG_SCSI=3Dy
> +# CONFIG_SCSI_PROC_FS is not set
> +# CONFIG_SCSI_LOWLEVEL is not set
> +CONFIG_NETDEVICES=3Dy
> +# CONFIG_NET_VENDOR_ALACRITECH is not set
> +# CONFIG_NET_VENDOR_AMAZON is not set
> +# CONFIG_NET_VENDOR_AQUANTIA is not set
> +# CONFIG_NET_VENDOR_ARC is not set
> +# CONFIG_NET_VENDOR_BROADCOM is not set
> +# CONFIG_NET_VENDOR_CADENCE is not set
> +# CONFIG_NET_VENDOR_CAVIUM is not set
> +# CONFIG_NET_VENDOR_CIRRUS is not set
> +# CONFIG_NET_VENDOR_CORTINA is not set
> +# CONFIG_NET_VENDOR_EZCHIP is not set
> +# CONFIG_NET_VENDOR_FARADAY is not set
> +# CONFIG_NET_VENDOR_GOOGLE is not set
> +# CONFIG_NET_VENDOR_HISILICON is not set
> +# CONFIG_NET_VENDOR_HUAWEI is not set
> +# CONFIG_NET_VENDOR_INTEL is not set
> +# CONFIG_NET_VENDOR_MARVELL is not set
> +# CONFIG_NET_VENDOR_MELLANOX is not set
> +# CONFIG_NET_VENDOR_MICREL is not set
> +# CONFIG_NET_VENDOR_MICROCHIP is not set
> +# CONFIG_NET_VENDOR_MICROSEMI is not set
> +# CONFIG_NET_VENDOR_NI is not set
> +# CONFIG_NET_VENDOR_NATSEMI is not set
> +# CONFIG_NET_VENDOR_NETRONOME is not set
> +# CONFIG_NET_VENDOR_PENSANDO is not set
> +# CONFIG_NET_VENDOR_QUALCOMM is not set
> +# CONFIG_NET_VENDOR_RENESAS is not set
> +# CONFIG_NET_VENDOR_ROCKER is not set
> +# CONFIG_NET_VENDOR_SAMSUNG is not set
> +# CONFIG_NET_VENDOR_SEEQ is not set
> +# CONFIG_NET_VENDOR_SOLARFLARE is not set
> +# CONFIG_NET_VENDOR_SMSC is not set
> +# CONFIG_NET_VENDOR_SOCIONEXT is not set
> +# CONFIG_NET_VENDOR_STMICRO is not set
> +# CONFIG_NET_VENDOR_SYNOPSYS is not set
> +# CONFIG_NET_VENDOR_VIA is not set
> +# CONFIG_NET_VENDOR_WIZNET is not set
> +# CONFIG_NET_VENDOR_XILINX is not set
> +CONFIG_REALTEK_PHY=3Dy
> +# CONFIG_WLAN is not set
> +CONFIG_INPUT_FF_MEMLESS=3Dy
> +CONFIG_INPUT_EVDEV=3Dy
> +CONFIG_KEYBOARD_QT1070=3Dm
> +CONFIG_KEYBOARD_GPIO=3Dy
> +# CONFIG_INPUT_MOUSE is not set
> +CONFIG_VT_HW_CONSOLE_BINDING=3Dy
> +CONFIG_LEGACY_PTY_COUNT=3D16
> +CONFIG_SERIAL_8250=3Dy
> +CONFIG_SERIAL_8250_CONSOLE=3Dy
> +CONFIG_SERIAL_8250_NR_UARTS=3D6
> +CONFIG_SERIAL_8250_RUNTIME_UARTS=3D6
> +CONFIG_SERIAL_8250_EXTENDED=3Dy
> +CONFIG_SERIAL_8250_MANY_PORTS=3Dy
> +CONFIG_SERIAL_OF_PLATFORM=3Dy
> +CONFIG_NPCM7XX_KCS_IPMI_BMC=3Dy
> +CONFIG_IPMI_KCS_BMC_CDEV_IPMI=3Dy
> +CONFIG_IPMI_KCS_BMC_SERIO=3Dy
> +CONFIG_HW_RANDOM=3Dy
> +# CONFIG_HW_RANDOM_NPCM is not set
> +CONFIG_I2C=3Dy
> +# CONFIG_I2C_COMPAT is not set
> +CONFIG_I2C_CHARDEV=3Dy
> +CONFIG_I2C_MUX=3Dy
> +CONFIG_I2C_NPCM=3Dy
> +CONFIG_SPI=3Dy
> +CONFIG_SPI_NPCM_PSPI=3Dy
> +CONFIG_PINCTRL_SINGLE=3Dy
> +CONFIG_PINCTRL_WPCM450=3Dy
> +CONFIG_POWER_SUPPLY=3Dy
> +CONFIG_SENSORS_NPCM7XX=3Dy
> +# CONFIG_THERMAL is not set
> +CONFIG_WATCHDOG=3Dy
> +CONFIG_NPCM7XX_WATCHDOG=3Dy
> +CONFIG_MFD_SYSCON=3Dy
> +CONFIG_REGULATOR=3Dy
> +CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> +CONFIG_FB=3Dy
> +CONFIG_FB_MODE_HELPERS=3Dy
> +# CONFIG_HID is not set
> +CONFIG_USB_CHIPIDEA=3Dy
> +CONFIG_USB_CHIPIDEA_UDC=3Dy
> +CONFIG_USB_GADGET=3Dy
> +CONFIG_USB_CONFIGFS=3Dy
> +CONFIG_USB_CONFIGFS_SERIAL=3Dy
> +CONFIG_USB_CONFIGFS_ACM=3Dy
> +CONFIG_USB_CONFIGFS_EEM=3Dy
> +CONFIG_USB_CONFIGFS_MASS_STORAGE=3Dy
> +CONFIG_USB_CONFIGFS_F_FS=3Dy
> +CONFIG_USB_CONFIGFS_F_HID=3Dy
> +CONFIG_NEW_LEDS=3Dy
> +CONFIG_LEDS_CLASS=3Dy
> +CONFIG_LEDS_GPIO=3Dy
> +CONFIG_LEDS_TRIGGERS=3Dy
> +CONFIG_LEDS_TRIGGER_TIMER=3Dy
> +CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> +CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
> +CONFIG_DMADEVICES=3Dy
> +CONFIG_SYNC_FILE=3Dy
> +# CONFIG_VIRTIO_MENU is not set
> +# CONFIG_VHOST_MENU is not set
> +CONFIG_STAGING=3Dy
> +# CONFIG_IOMMU_SUPPORT is not set
> +CONFIG_PWM=3Dy
> +CONFIG_GENERIC_PHY=3Dy
> +CONFIG_PECI=3Dy
> +CONFIG_PECI_CPU=3Dy
> +CONFIG_MSDOS_FS=3Dy
> +CONFIG_VFAT_FS=3Dy
> +CONFIG_TMPFS=3Dy
> +CONFIG_UBIFS_FS=3Dy
> +CONFIG_SQUASHFS=3Dy
> +CONFIG_SQUASHFS_XZ=3Dy
> +CONFIG_SQUASHFS_ZSTD=3Dy
> +# CONFIG_NETWORK_FILESYSTEMS is not set
> +CONFIG_NLS_CODEPAGE_437=3Dy
> +CONFIG_NLS_CODEPAGE_850=3Dy
> +CONFIG_NLS_ISO8859_1=3Dy
> +CONFIG_NLS_ISO8859_2=3Dy
> +CONFIG_NLS_UTF8=3Dy
> +CONFIG_KEYS=3Dy
> +CONFIG_HARDENED_USERCOPY=3Dy
> +CONFIG_FORTIFY_SOURCE=3Dy
> +CONFIG_CRYPTO_RSA=3Dy
> +CONFIG_CRYPTO_AES=3Dy
> +CONFIG_CRYPTO_CBC=3Dm
> +CONFIG_CRYPTO_PCBC=3Dm
> +CONFIG_CRYPTO_CCM=3Dy
> +CONFIG_CRYPTO_GCM=3Dy
> +CONFIG_CRYPTO_CMAC=3Dy
> +CONFIG_CRYPTO_SHA256=3Dy
> +CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> +CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> +CONFIG_X509_CERTIFICATE_PARSER=3Dy
> +CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> +CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> +CONFIG_CRC_CCITT=3Dy
> +CONFIG_CRC_ITU_T=3Dm
> +CONFIG_LIBCRC32C=3Dy
> +CONFIG_PRINTK_TIME=3Dy
> +CONFIG_DEBUG_KERNEL=3Dy
> +CONFIG_MAGIC_SYSRQ=3Dy
> +CONFIG_DEBUG_FS=3Dy
> +# CONFIG_SCHED_DEBUG is not set
> +# CONFIG_DEBUG_PREEMPT is not set
> +# CONFIG_FTRACE is not set
> +CONFIG_IO_STRICT_DEVMEM=3Dy
> +CONFIG_DEBUG_USER=3Dy
> +CONFIG_DEBUG_LL=3Dy
> +CONFIG_DEBUG_LL_UART_8250=3Dy
> +CONFIG_DEBUG_UART_PHYS=3D0xb8000000
> +CONFIG_DEBUG_UART_VIRT=3D0x0ff000000
> +CONFIG_DEBUG_UART_8250_WORD=3Dy
> +CONFIG_EARLY_PRINTK=3Dy
> --
> 2.35.1
>
