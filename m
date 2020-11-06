Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B20C2A9150
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 09:32:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSDCr0y1hzDrHl
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 19:32:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=lXTILM46; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSDBv5x7WzDrFL
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 19:31:49 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id i21so381326qka.12
 for <openbmc@lists.ozlabs.org>; Fri, 06 Nov 2020 00:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vVRcaEQiI6btxm4PJgJHPOEr8lq2ySwuCRszQtooTBo=;
 b=lXTILM46bwNBqVTlL9tE2UCiiAtVCgEdQw9s8ytrVQLLEAQQ3vQOMLNC/KVSmzqvCp
 SKV5X0IjDMPlh6dd2cOvw1i4/hmIcUQZDnAXBO4UxkOa2G3xySWs8VycDn50Sa3as79B
 AdegUw+Co7UtbXKAQQRtEJgfNnvIR5Yn7zfAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vVRcaEQiI6btxm4PJgJHPOEr8lq2ySwuCRszQtooTBo=;
 b=NShsweCL7vBjQ15mMedM/ns2aaBWA216e0YcEBkC6QzJnCTF7Xb3mNnH2GgZXaZYVi
 Ru8UkyzvJ9o8ezE4dT7LR87QIHyRDXrkEfiKGXBkWxqbt6a+u+6BNALttMhQJk0eWKgI
 myaUy+PpHQLkYuEKXQwiU2+dk27pyd1H9DhRAAVBYkYfSL4iKooc0Uo2ssD03IHs30ac
 867baod2kkB4PyS9tz0Yjsa5WEWp5n6Qcscg9px6tjlUG1NOsd3NhVTpRhKLwwqTU37E
 a19TTY1xDUzJ28Egltsman8nfy+Hs4tUGq0O/AEooK+yfmGocJ9F4Yregt0xV31x5rlH
 rC3w==
X-Gm-Message-State: AOAM532g3GPnO2gmRdpAQWX4c8kHF4vMxPyhopMGOMWrkEdZAtGk2k90
 aF7r6y+3FjcjqHuZs20SvsV6fahKVPDpJLAMcDcsIQ2W/vf+Ig==
X-Google-Smtp-Source: ABdhPJwbHLdDyunBDzAX9mMSYg+3cIs9kxzX7aAKo8dGhTiLNRrcXtVe8jow2uUkusgAdNcul5Jn/ltPf33xM3Ncyn8=
X-Received: by 2002:a37:aa8b:: with SMTP id t133mr483022qke.487.1604651505591; 
 Fri, 06 Nov 2020 00:31:45 -0800 (PST)
MIME-Version: 1.0
References: <20201105200920.51226-1-eajames@linux.ibm.com>
 <20201105200920.51226-4-eajames@linux.ibm.com>
In-Reply-To: <20201105200920.51226-4-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 6 Nov 2020 08:31:32 +0000
Message-ID: <CACPK8Xch=cUefotL4mUGhFW9fzzTfmMU1CLS8FwmSq-WGU46mg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v3 3/3] configs: Add
 AST2600 SPL eMMC configuration
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

On Thu, 5 Nov 2020 at 20:09, Eddie James <eajames@linux.ibm.com> wrote:
>
> U-Boot and environment are to be loaded off the eMMC.
> The environment is located at byte offset 0x5000 in the user data
> partition, and is sized at 0x10000. The redundant environment
> follows it immediately and is the same size. Also select the
> partition number and block offset of the U-Boot image; it is in
> the first boot partition (eMMC partition 1) at block 128.

Can we merge this with the non-emmc defconfig, now that you've tested
that it works on NOR?

The diff looked like this:

-CONFIG_ASPEED_UBOOT_SPI_SIZE=0xe0000
-CONFIG_ASPEED_UBOOT_MMC_BASE=0x000000
-CONFIG_ASPEED_UBOOT_MMC_SIZE=0x700
+CONFIG_ASPEED_UBOOT_SPI_SIZE=0xd0000
+CONFIG_ASPEED_UBOOT_MMC_BASE=0x80
+CONFIG_ASPEED_UBOOT_MMC_PART=1
+CONFIG_ASPEED_UBOOT_MMC_SIZE=0x680
-CONFIG_ENV_OFFSET=0xE0000
+CONFIG_ENV_OFFSET=0x5000
-CONFIG_ENV_IS_IN_SPI_FLASH=y
-CONFIG_USE_ENV_SPI_BUS=y
-CONFIG_ENV_SPI_BUS=0
-CONFIG_USE_ENV_SPI_CS=y
-CONFIG_ENV_SPI_CS=0
-CONFIG_USE_ENV_SPI_MAX_HZ=y
-CONFIG_ENV_SPI_MAX_HZ=100000000
+CONFIG_ENV_IS_IN_MMC=y

To answer my own question, no, as these two options conflict:

 CONFIG_ENV_IS_IN_SPI_FLASH / CONFIG_ENV_IS_IN_MMC

I'll apply the series as you have it.

Cheers,

Joel


>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  configs/ast2600_openbmc_spl_emmc_defconfig | 130 +++++++++++++++++++++
>  include/configs/aspeed-common.h            |   6 +
>  2 files changed, 136 insertions(+)
>  create mode 100644 configs/ast2600_openbmc_spl_emmc_defconfig
>
> diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
> new file mode 100644
> index 0000000000..68d18652c9
> --- /dev/null
> +++ b/configs/ast2600_openbmc_spl_emmc_defconfig
> @@ -0,0 +1,130 @@
> +CONFIG_ARM=y
> +CONFIG_SYS_CONFIG_NAME="evb_ast2600a1_spl"
> +CONFIG_SYS_DCACHE_OFF=y
> +CONFIG_POSITION_INDEPENDENT=y
> +CONFIG_SPL_SYS_THUMB_BUILD=y
> +CONFIG_SYS_THUMB_BUILD=y
> +CONFIG_SPL_LDSCRIPT="arch/$(ARCH)/mach-aspeed/ast2600/u-boot-spl.lds"
> +CONFIG_ARCH_ASPEED=y
> +CONFIG_SYS_TEXT_BASE=0x10000
> +CONFIG_ASPEED_AST2600=y
> +CONFIG_ASPEED_UBOOT_SPI_BASE=0x10000
> +CONFIG_ASPEED_UBOOT_SPI_SIZE=0xd0000
> +CONFIG_ASPEED_UBOOT_MMC_BASE=0x80
> +CONFIG_ASPEED_UBOOT_MMC_PART=1
> +CONFIG_ASPEED_UBOOT_MMC_SIZE=0x680
> +CONFIG_ASPEED_UBOOT_UART_SIZE=0xe0000
> +CONFIG_ASPEED_UBOOT_DRAM_BASE=0x81000000
> +CONFIG_ASPEED_KERNEL_FIT_SPI_BASE=0x20100000
> +CONFIG_ASPEED_KERNEL_FIT_SPI_SIZE=0x1000000
> +CONFIG_ASPEED_KERNEL_FIT_MMC_BASE=0x800
> +CONFIG_ASPEED_KERNEL_FIT_MMC_SIZE=0x8000
> +CONFIG_ASPEED_KERNEL_FIT_DRAM_BASE=0x83000000
> +CONFIG_TARGET_EVB_AST2600A1=y
> +CONFIG_SPL_LIBCOMMON_SUPPORT=y
> +CONFIG_SPL_LIBGENERIC_SUPPORT=y
> +CONFIG_SYS_MALLOC_F_LEN=0x800
> +CONFIG_SPL_MMC_SUPPORT=y
> +CONFIG_SPL_SERIAL_SUPPORT=y
> +CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
> +CONFIG_ENV_SIZE=0x10000
> +CONFIG_ENV_OFFSET=0x5000
> +CONFIG_SPL=y
> +CONFIG_SPL_STACK_R_ADDR=0x90300000
> +CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
> +CONFIG_ARMV7_PSCI_NR_CPUS=2
> +CONFIG_NR_DRAM_BANKS=1
> +CONFIG_FIT=y
> +CONFIG_USE_BOOTARGS=y
> +CONFIG_BOOTARGS="console=ttyS4,115200n8 root=/dev/ram rw"
> +CONFIG_USE_BOOTCOMMAND=y
> +CONFIG_BOOTCOMMAND="bootm 20100000"
> +CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
> +CONFIG_DISPLAY_BOARDINFO_LATE=y
> +CONFIG_ARCH_EARLY_INIT_R=y
> +CONFIG_BOARD_EARLY_INIT_F=y
> +# CONFIG_SPL_RAW_IMAGE_SUPPORT is not set
> +# CONFIG_SPL_LEGACY_IMAGE_SUPPORT is not set
> +CONFIG_SPL_SYS_MALLOC_SIMPLE=y
> +CONFIG_SPL_STACK_R=y
> +CONFIG_SPL_SEPARATE_BSS=y
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
> +# CONFIG_SPL_EFI_PARTITION is not set
> +CONFIG_SPL_OF_CONTROL=y
> +CONFIG_ENV_IS_IN_MMC=y
> +CONFIG_NET_RANDOM_ETHADDR=y
> +CONFIG_SPL_DM=y
> +CONFIG_REGMAP=y
> +CONFIG_SYSCON=y
> +CONFIG_SPL_OF_TRANSLATE=y
> +CONFIG_CLK=y
> +CONFIG_SPL_CLK=y
> +CONFIG_DM_GPIO=y
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
> +CONFIG_TPM=y
> +CONFIG_SPL_TPM=y
> +# CONFIG_EFI_LOADER is not set
> diff --git a/include/configs/aspeed-common.h b/include/configs/aspeed-common.h
> index 4c83035d3c..876958735b 100755
> --- a/include/configs/aspeed-common.h
> +++ b/include/configs/aspeed-common.h
> @@ -41,6 +41,12 @@
>  #define CONFIG_SYS_BOOTMAPSZ           (256 * 1024 * 1024)
>  #define CONFIG_SYS_MALLOC_LEN          (32 << 20)
>
> +#ifdef CONFIG_ENV_IS_IN_MMC
> +#define CONFIG_SYS_MMC_ENV_DEV         0
> +#define CONFIG_SYS_MMC_ENV_PART                0
> +#define CONFIG_ENV_OFFSET_REDUND       0x15000
> +#endif
> +
>  /*
>   * BOOTP options
>   */
> --
> 2.26.2
>
