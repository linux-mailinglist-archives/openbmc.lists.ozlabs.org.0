Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C0A534F1B
	for <lists+openbmc@lfdr.de>; Thu, 26 May 2022 14:29:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L86hC01C2z3bkR
	for <lists+openbmc@lfdr.de>; Thu, 26 May 2022 22:29:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Zc/NMjAx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Zc/NMjAx;
	dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L86gl4CBvz2ypD
	for <openbmc@lists.ozlabs.org>; Thu, 26 May 2022 22:29:22 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id p10so1940330wrg.12
        for <openbmc@lists.ozlabs.org>; Thu, 26 May 2022 05:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+tGFDhuneNBPJC2BwsdSy0fmA5iuK8QHKq8RBTpNHEk=;
        b=Zc/NMjAxZ+Wj7q1Fa4A2gbEMbpD4eLd/Swj4RqzjOpKkghSqE397UroYwqqPv/+YaE
         jhPKKUqg1UiSU756QwncxWQDB9RD3WWFOaqG3BKKZwa1OwwCYi6bn4oeYJmAe2sTNeYP
         n+ILqiXG8EZUTXv9s8qF/b/UoiKYFWNZrlFPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+tGFDhuneNBPJC2BwsdSy0fmA5iuK8QHKq8RBTpNHEk=;
        b=gNuWu/8vEwXp1R2BF5HnFAyrF2QRA5/esNAw/76KtUEXRrum+AhuxmVw6W1T33DUFI
         T7S3u5WXyh6i5lumRs7v8CeIdVh5Hg+IbCxOY2uHn8mKSWMqZYopc1ItgaGH7xfzIrn2
         hTMBPUHl8kjCZtintIHxRlUVC4lLjO4EUZZB5ELkuDopOlEsw4pMMawg6DyVlA7iAiqp
         4cxOElK5Kk6+iIv7rVZ/mi/PLbfbDPtoXUlvgBFhdYUxMmjKo09Vvucv1asf8YS/qkzN
         KnA6AALZEfXHrX/N7ekHAwftidobCsrjrF7Wy9NHR3rZdmeWNrxtw3GI+3P/KRwiJvoM
         hH+w==
X-Gm-Message-State: AOAM533JclpMMcnyoa+KGYDN8l/XVNuX+2Xox90mE2XalAkND5Kkj5y3
	xzfu/leRLoEjWeXJUBSQMrLTO9OABKPKyOb20eMBSVo2O8s=
X-Google-Smtp-Source: ABdhPJwZtB41e3cfC5ad+T7GIbQHxv7lz9Ob6OR67SUi6opMgXR1gtaRSm2Dpm+L4sVe7jHZmhd9k+ywq7XsGVLRXCk=
X-Received: by 2002:a5d:47c9:0:b0:20f:e7da:6a48 with SMTP id
 o9-20020a5d47c9000000b0020fe7da6a48mr14182008wrc.315.1653568158350; Thu, 26
 May 2022 05:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220525013654.6798-1-eajames@linux.ibm.com>
In-Reply-To: <20220525013654.6798-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 May 2022 12:29:05 +0000
Message-ID: <CACPK8XeV=2X6ACGqWp-wWW2f9UOvrrFT_2RivZTSxZQ+5PszbA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] board: ast2600-ibm: Add
 AST2600 BMC based POWER10+ servers
To: Eddie James <eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 25 May 2022 at 01:37, Eddie James <eajames@linux.ibm.com> wrote:
>
> Support IBM-specific options for POWER10+ servers built on AST2600
> BMC.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/mach-aspeed/ast2600/Kconfig |   9 ++
>  board/aspeed/ast2600_ibm/Kconfig     |  13 +++
>  board/aspeed/ast2600_ibm/Makefile    |   1 +
>  board/aspeed/ast2600_ibm/ibm.c       |  43 +++++++++
>  configs/ast2600_ibm_defconfig        | 135 +++++++++++++++++++++++++++

If you resend, put the defconfig in its own patch.

>  5 files changed, 201 insertions(+)
>  create mode 100644 board/aspeed/ast2600_ibm/Kconfig
>  create mode 100644 board/aspeed/ast2600_ibm/Makefile
>  create mode 100644 board/aspeed/ast2600_ibm/ibm.c
>  create mode 100644 configs/ast2600_ibm_defconfig
>
> diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
> index fcdc425de5..e7292c3884 100644
> --- a/arch/arm/mach-aspeed/ast2600/Kconfig
> +++ b/arch/arm/mach-aspeed/ast2600/Kconfig
> @@ -31,6 +31,14 @@ config TARGET_SLT_AST2600
>         help
>           SLT-AST2600 is Aspeed SLT board for AST2600 chip.
>
> +config TARGET_AST2600_IBM
> +       bool "AST2600-IBM"
> +       depends on ASPEED_AST2600

the depends is redundant, as we're inside an `if ASPEED_AST2600`.

> +       select TPM
> +       select TPM2_TIS_I2C
> +       help
> +         AST2600-IBM is IBM boards for AST2600 BMC based P0WER10+ servers
> +
>  config TARGET_AST2600_INTEL
>         bool "AST2600-INTEL"
>         depends on ASPEED_AST2600
> @@ -43,6 +51,7 @@ endchoice
>  source "board/aspeed/evb_ast2600/Kconfig"
>  source "board/aspeed/fpga_ast2600/Kconfig"
>  source "board/aspeed/slt_ast2600/Kconfig"
> +source "board/aspeed/ast2600_ibm/Kconfig"
>  source "board/aspeed/ast2600_intel/Kconfig"
>
>  endif
> diff --git a/board/aspeed/ast2600_ibm/Kconfig b/board/aspeed/ast2600_ibm/Kconfig
> new file mode 100644
> index 0000000000..38ee579ed7
> --- /dev/null
> +++ b/board/aspeed/ast2600_ibm/Kconfig
> @@ -0,0 +1,13 @@
> +if TARGET_AST2600_IBM
> +
> +config SYS_BOARD
> +       default "ast2600_ibm"
> +
> +config SYS_VENDOR
> +       default "aspeed"
> +
> +config SYS_CONFIG_NAME
> +       string "board configuration name"
> +       default "ast2600_ibm"
> +
> +endif
> diff --git a/board/aspeed/ast2600_ibm/Makefile b/board/aspeed/ast2600_ibm/Makefile
> new file mode 100644
> index 0000000000..ae1aded893
> --- /dev/null
> +++ b/board/aspeed/ast2600_ibm/Makefile
> @@ -0,0 +1 @@
> +obj-y += ibm.o
> diff --git a/board/aspeed/ast2600_ibm/ibm.c b/board/aspeed/ast2600_ibm/ibm.c
> new file mode 100644
> index 0000000000..bc2489246a
> --- /dev/null
> +++ b/board/aspeed/ast2600_ibm/ibm.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2022 IBM Corp.
> + */
> +
> +#include <common.h>
> +#include <dm/uclass.h>
> +#include <tpm-common.h>
> +#include <tpm-v2.h>
> +
> +__weak int board_late_init(void)

This is the implementation we want u-boot to use so it shouldn't be
__weak, should it?

> +{
> +       int rc;
> +       struct udevice *dev;
> +       /*
> +        * The digest is just an arbitrary sequence for now to ensure that the
> +        * TPM gets "poisoned."
> +        */
> +       const unsigned char digest[32] = {
> +               0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x00, 0x01,
> +               0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09,
> +               0xa0, 0xb1, 0xc2, 0xd3, 0xe4, 0xf5, 0x06, 0x17,
> +               0x28, 0x39, 0x4a, 0x5b, 0x6c, 0x7d, 0x8e, 0x9f
> +       };
> +
> +       rc = uclass_first_device_err(UCLASS_TPM, &dev);
> +       if (rc)
> +               return 0;
> +
> +       rc = tpm_init(dev);
> +       if (rc)
> +               return 0;
> +
> +       rc = tpm2_startup(dev, TPM2_SU_CLEAR);
> +       if (rc)
> +               return 0;
> +
> +       rc = tpm2_pcr_extend(dev, 0, digest);
> +       if (!rc)
> +               printf("TPM: PCR0 extended.\n");
> +
> +       return 0;
> +}
> diff --git a/configs/ast2600_ibm_defconfig b/configs/ast2600_ibm_defconfig
> new file mode 100644
> index 0000000000..7177ea7079
> --- /dev/null
> +++ b/configs/ast2600_ibm_defconfig

Comparing this to the emmc defconfig:

+CONFIG_TARGET_AST2600_IBM=y
+CONFIG_DEFAULT_DEVICE_TREE="ast2600-rainier"

Selecting the target makes sense. Do we need to set the default device tree too?

Instead of a defconfig in the tree, could we use a .cfg append in the
meta layer to set the target?

I want to get away from maintaining separate defconfigs for each platform.

-CONFIG_BOARD_EARLY_INIT_F=y
+CONFIG_BOARD_LATE_INIT=y

The reference platform uses early_init_f, we use late_init. Why is that?

If the board requires it, it should go in the kconfig with the other
options. (A grep of BOARD_LATE_INIT shows a lot of other platforms
doing this).


> @@ -0,0 +1,135 @@
> +CONFIG_ARM=y
> +CONFIG_SYS_CONFIG_NAME="evb_ast2600_spl_emmc"
> +CONFIG_SYS_DCACHE_OFF=y
> +CONFIG_POSITION_INDEPENDENT=y
> +CONFIG_SYS_THUMB_BUILD=y
> +# CONFIG_SPL_USE_ARCH_MEMCPY is not set
> +# CONFIG_SPL_USE_ARCH_MEMSET is not set
> +CONFIG_SPL_LDSCRIPT="arch/$(ARCH)/mach-aspeed/ast2600/u-boot-spl.lds"
> +CONFIG_ARCH_ASPEED=y
> +CONFIG_SYS_TEXT_BASE=0x81000000
> +CONFIG_ASPEED_AST2600=y
> +# CONFIG_ASPEED_LOADERS is not set
> +CONFIG_TARGET_AST2600_IBM=y
> +CONFIG_DEFAULT_DEVICE_TREE="ast2600-rainier"
> +CONFIG_SPL_GPIO_SUPPORT=y
> +CONFIG_SPL_LIBCOMMON_SUPPORT=y
> +CONFIG_SPL_LIBGENERIC_SUPPORT=y
> +CONFIG_SYS_MALLOC_F_LEN=0x2000
> +CONFIG_SPL_MMC_SUPPORT=y
> +CONFIG_SPL_SERIAL_SUPPORT=y
> +CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
> +CONFIG_ENV_SIZE=0x10000
> +CONFIG_ENV_OFFSET=0x5000
> +CONFIG_SPL_SYS_MALLOC_F_LEN=0x1000
> +CONFIG_SPL=y
> +CONFIG_SPL_STACK_R_ADDR=0x90300000
> +CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
> +CONFIG_ARMV7_PSCI_NR_CPUS=2
> +CONFIG_NR_DRAM_BANKS=1
> +CONFIG_FIT=y
> +CONFIG_FIT_ENABLE_SHA512_SUPPORT=y
> +CONFIG_FIT_SIGNATURE=y
> +CONFIG_SPL_FIT_SIGNATURE=y
> +CONFIG_SPL_LOAD_FIT=y
> +CONFIG_USE_BOOTARGS=y
> +CONFIG_BOOTARGS="console=ttyS4,115200n8 root=/dev/ram rw"
> +CONFIG_USE_BOOTCOMMAND=y
> +CONFIG_BOOTCOMMAND="bootm 20100000"
> +CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
> +CONFIG_DISPLAY_BOARDINFO_LATE=y
> +CONFIG_ARCH_EARLY_INIT_R=y
> +CONFIG_BOARD_LATE_INIT=y
> +CONFIG_SPL_BOARD_INIT=y
> +# CONFIG_SPL_LEGACY_IMAGE_SUPPORT is not set
> +CONFIG_SPL_SYS_MALLOC_SIMPLE=y
> +CONFIG_SPL_STACK_R=y
> +CONFIG_SPL_SEPARATE_BSS=y
> +CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
> +CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x80
> +CONFIG_SPL_SHA512_SUPPORT=y
> +CONFIG_SPL_FIT_IMAGE_TINY=y
> +CONFIG_SPL_DM_RESET=y
> +CONFIG_SPL_RAM_SUPPORT=y
> +CONFIG_SPL_RAM_DEVICE=y
> +CONFIG_SPL_WATCHDOG_SUPPORT=y
> +CONFIG_SPL_YMODEM_SUPPORT=y
> +CONFIG_HUSH_PARSER=y
> +# CONFIG_AUTO_COMPLETE is not set
> +CONFIG_SYS_PROMPT="ast# "
> +CONFIG_CMD_BOOTZ=y
> +# CONFIG_CMD_ELF is not set
> +# CONFIG_CMD_IMI is not set
> +# CONFIG_CMD_XIMG is not set
> +CONFIG_CMD_MEMTEST=y
> +CONFIG_SYS_ALT_MEMTEST=y
> +CONFIG_CMD_CLK=y
> +CONFIG_CMD_GPIO=y
> +CONFIG_CMD_GPT=y
> +# CONFIG_RANDOM_UUID is not set
> +CONFIG_CMD_I2C=y
> +CONFIG_CMD_MMC=y
> +CONFIG_CMD_PART=y
> +CONFIG_CMD_SF=y
> +CONFIG_CMD_DHCP=y
> +CONFIG_CMD_MII=y
> +CONFIG_CMD_PING=y
> +CONFIG_CMD_NCSI=y
> +CONFIG_CMD_EXT2=y
> +CONFIG_CMD_EXT4=y
> +CONFIG_CMD_EXT4_WRITE=y
> +CONFIG_CMD_FAT=y
> +CONFIG_CMD_FS_GENERIC=y
> +CONFIG_CMD_MTDPARTS=y
> +# CONFIG_SPL_DOS_PARTITION is not set
> +# CONFIG_SPL_EFI_PARTITION is not set
> +CONFIG_SPL_OF_CONTROL=y
> +CONFIG_ENV_IS_IN_MMC=y
> +CONFIG_USE_DEFAULT_ENV_FILE=y
> +CONFIG_DEFAULT_ENV_FILE="board/aspeed/ast2600_openbmc_mmc.txt"
> +CONFIG_NET_RANDOM_ETHADDR=y
> +CONFIG_SPL_DM=y
> +CONFIG_REGMAP=y
> +CONFIG_SYSCON=y
> +CONFIG_SPL_OF_TRANSLATE=y
> +CONFIG_CLK=y
> +CONFIG_SPL_CLK=y
> +CONFIG_ASPEED_HACE_V1=y
> +CONFIG_DM_GPIO=y
> +CONFIG_SPL_GPIO_HOG=y
> +CONFIG_ASPEED_GPIO=y
> +CONFIG_DM_I2C=y
> +CONFIG_SYS_I2C_ASPEED=y
> +CONFIG_MISC=y
> +CONFIG_ASPEED_AHBC=y
> +CONFIG_DM_MMC=y
> +CONFIG_SPL_MMC_TINY=y
> +CONFIG_MMC_SDHCI=y
> +CONFIG_MMC_SDHCI_ASPEED=y
> +CONFIG_DM_SPI_FLASH=y
> +CONFIG_SPI_FLASH=y
> +CONFIG_SPI_FLASH_GIGADEVICE=y
> +CONFIG_SPI_FLASH_MACRONIX=y
> +CONFIG_SPI_FLASH_SPANSION=y
> +CONFIG_SPI_FLASH_STMICRO=y
> +CONFIG_SPI_FLASH_WINBOND=y
> +CONFIG_PHY_BROADCOM=y
> +CONFIG_PHY_REALTEK=y
> +CONFIG_PHY_NCSI=y
> +CONFIG_DM_ETH=y
> +CONFIG_PHY_GIGE=y
> +CONFIG_FTGMAC100=y
> +CONFIG_MDIO=y
> +CONFIG_PHY=y
> +CONFIG_PINCTRL=y
> +CONFIG_RAM=y
> +CONFIG_SPL_RAM=y
> +CONFIG_DM_SERIAL=y
> +CONFIG_SYS_NS16550=y
> +CONFIG_SPI=y
> +CONFIG_DM_SPI=y
> +CONFIG_SYSRESET=y
> +CONFIG_WDT=y
> +CONFIG_USE_TINY_PRINTF=y
> +CONFIG_SPL_TINY_MEMSET=y
> +# CONFIG_EFI_LOADER is not set
> --
> 2.27.0
>
