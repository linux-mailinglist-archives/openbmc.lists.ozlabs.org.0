Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFDC1A93AD
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 08:49:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492CdZ5SqZzDr5D
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 16:49:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=WXGWiDus; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492Cbx2BqkzDr3V
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 16:48:13 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id i19so9488468qtp.13
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 23:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1MyCW8UY463RqCOxr2orgTFsZWZngLYOGyEOeYbqVrs=;
 b=WXGWiDusxBYA0+yz5Ib3RM+VBfTtlRClQssAcDMcpa0Y5Pfjzv7g//H6yisj5/bKaw
 8PjoWCABAlcmRBoxr5wJ76KNHiJ4ObDui92rt0FyU/eG8XDS415B+wqyHQqUWIUzJVBx
 XmQhSTO6KTO2py6XrYRjpNGXR1edP3GP2kY9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1MyCW8UY463RqCOxr2orgTFsZWZngLYOGyEOeYbqVrs=;
 b=LC5zbACBgaU8Qv513Yj1Y/omNbzXJx0G4hQGn73BUv4moEH8GVo007qTb+On/mJXt2
 KZg62/GFS8iwet6yM8BupW9kXBgMuU2kwu79UK9+XVqCsV/aJ3/uRLPOXzQM7z7Oqh1x
 sP/4mTQvn0woKN9idycrYa2q+/3MkxKntAcobbHb7dx6y1oOZhn9RSl0pzn5OnLCDkNE
 FedOOd0M5dDph9iX+1psPCqN70bl44G89bAtMR28XOK/Gtp89mSp70wMHHSMCmSeas3j
 2ycl7DWyivRo0Du3wYumCXKFGV/hOzjPazqoAJxbpUHAbvPqcazTpr3azgGZCp+Q7eFF
 lbkA==
X-Gm-Message-State: AGi0PuYlbWNmdua4Gu3unOMBjbrl9bfzKsLzMQXbc/WChk1sws831WjE
 dmBN9e1RoGnGX9p4MSEWGMSXQ6QtJj/2R1fwlo8=
X-Google-Smtp-Source: APiQypKwtvb9mShyqCgdFqGnVJe/dwQNf79ZWiRJYkn3IYCHqwalrk/vDvLV7UB+VxMJ0uEkNZKWnuPDmvFGXg+cWcE=
X-Received: by 2002:ac8:342d:: with SMTP id u42mr19497765qtb.255.1586933289040; 
 Tue, 14 Apr 2020 23:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <1586370073-71433-1-git-send-email-anoo@linux.ibm.com>
In-Reply-To: <1586370073-71433-1-git-send-email-anoo@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 15 Apr 2020 06:47:57 +0000
Message-ID: <CACPK8XcTR-pOwn_3dJz1Z5JiS7K8j5Cv2wryEj+v3bi=OTs9Pw@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] configs: Add OpenBMC spl
 defconfig for AST2600 boards
To: Adriana Kobylak <anoo@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 8 Apr 2020 at 18:22, Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> This is based on the ast2600_openbmc_defconfig plus the spl
> options enabled in evb-ast2600a1-spl_defconfig but without
> the SPL_YMODEM_SUPPORT due to space constraints.
>
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> ---
>  configs/ast2600_openbmc_spl_defconfig | 126 ++++++++++++++++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 configs/ast2600_openbmc_spl_defconfig
>
> diff --git a/configs/ast2600_openbmc_spl_defconfig b/configs/ast2600_openbmc_spl_defconfig
> new file mode 100644
> index 0000000..d87da43
> --- /dev/null
> +++ b/configs/ast2600_openbmc_spl_defconfig
> @@ -0,0 +1,126 @@
> +CONFIG_ARM=y
> +CONFIG_SYS_CONFIG_NAME="evb_ast2600a1_spl"
> +CONFIG_SYS_DCACHE_OFF=y
> +CONFIG_POSITION_INDEPENDENT=y
> +CONFIG_SPL_LDSCRIPT="arch/$(ARCH)/mach-aspeed/ast2600/u-boot-spl.lds"
> +CONFIG_ARCH_ASPEED=y
> +CONFIG_SYS_TEXT_BASE=0x10000
> +CONFIG_ASPEED_AST2600=y
> +CONFIG_TARGET_EVB_AST2600A1=y
> +CONFIG_SPL_LIBCOMMON_SUPPORT=y
> +CONFIG_SPL_LIBGENERIC_SUPPORT=y
> +CONFIG_SYS_MALLOC_F_LEN=0x800
> +CONFIG_SPL_MMC_SUPPORT=y
> +CONFIG_SPL_SERIAL_SUPPORT=y
> +CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
> +CONFIG_ENV_SIZE=0x10000
> +CONFIG_ENV_OFFSET=0xE0000
> +CONFIG_SPL=y
> +CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
> +CONFIG_NR_DRAM_BANKS=1
> +CONFIG_FIT=y
> +CONFIG_SPL_FIT=y
> +CONFIG_SPL_FIT_PRINT=y
> +CONFIG_USE_BOOTARGS=y
> +CONFIG_BOOTARGS="console=ttyS4,115200n8 root=/dev/ram rw"
> +CONFIG_USE_BOOTCOMMAND=y
> +CONFIG_BOOTCOMMAND="bootm 20100000"
> +CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
> +CONFIG_DISPLAY_BOARDINFO_LATE=y
> +CONFIG_ARCH_EARLY_INIT_R=y
> +CONFIG_SPL_SEPARATE_BSS=y
> +CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
> +CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x0
> +CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y

How do these work? I thought the SPL loaded u-boot.bin from SPI NOR
for now. Do we need to change these?

How should we handle the configuration options when we want to build a eMMC SPL?

> +CONFIG_SPL_DM_RESET=y
> +CONFIG_SPL_RAM_SUPPORT=y
> +CONFIG_SPL_RAM_DEVICE=y
> +CONFIG_SPL_WATCHDOG_SUPPORT=y
> +CONFIG_HUSH_PARSER=y
> +# CONFIG_AUTO_COMPLETE is not set
> +CONFIG_SYS_PROMPT="ast# "
> +CONFIG_CMD_BOOTZ=y
> +# CONFIG_CMD_BOOTEFI is not set
> +# CONFIG_CMD_ELF is not set
> +# CONFIG_CMD_IMI is not set
> +# CONFIG_CMD_XIMG is not set
> +# CONFIG_CMD_NVEDIT_EFI is not set
> +CONFIG_CMD_MEMTEST=y
> +CONFIG_SYS_ALT_MEMTEST=y
> +CONFIG_CMD_CLK=y
> +CONFIG_CMD_GPIO=y
> +CONFIG_CMD_I2C=y
> +CONFIG_CMD_MMC=y
> +CONFIG_CMD_PART=y
> +CONFIG_CMD_PCI=y
> +CONFIG_CMD_SF=y
> +CONFIG_CMD_USB=y
> +CONFIG_CMD_DHCP=y
> +CONFIG_CMD_MII=y
> +CONFIG_CMD_PING=y
> +CONFIG_CMD_EXT2=y
> +CONFIG_CMD_EXT4=y
> +CONFIG_CMD_EXT4_WRITE=y
> +CONFIG_CMD_FAT=y
> +CONFIG_CMD_FS_GENERIC=y
> +CONFIG_CMD_MTDPARTS=y
> +CONFIG_EFI_PARTITION=y
> +CONFIG_SPL_OF_CONTROL=y
> +CONFIG_ENV_IS_IN_SPI_FLASH=y
> +CONFIG_USE_ENV_SPI_BUS=y
> +CONFIG_ENV_SPI_BUS=0
> +CONFIG_USE_ENV_SPI_CS=y
> +CONFIG_ENV_SPI_CS=0
> +CONFIG_USE_ENV_SPI_MAX_HZ=y
> +CONFIG_ENV_SPI_MAX_HZ=100000000
> +CONFIG_NET_RANDOM_ETHADDR=y
> +CONFIG_SPL_DM=y
> +CONFIG_REGMAP=y
> +CONFIG_SYSCON=y
> +CONFIG_CLK=y
> +CONFIG_SPL_CLK=y
> +CONFIG_DM_GPIO=y
> +CONFIG_ASPEED_GPIO=y
> +CONFIG_DM_I2C=y
> +CONFIG_SYS_I2C_ASPEED=y
> +CONFIG_MISC=y
> +CONFIG_ASPEED_AHBC=y
> +CONFIG_ASPEED_H2X=y
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
> +CONFIG_PCI=y
> +CONFIG_DM_PCI=y
> +CONFIG_PCIE_ASPEED=y
> +CONFIG_PHY=y
> +CONFIG_PINCTRL=y
> +CONFIG_RAM=y
> +CONFIG_SPL_RAM=y
> +CONFIG_DM_SERIAL=y
> +CONFIG_SYS_NS16550=y
> +CONFIG_SPI=y
> +CONFIG_DM_SPI=y
> +CONFIG_SYSRESET=y
> +CONFIG_TEE=y
> +CONFIG_USB=y
> +CONFIG_DM_USB=y
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_STORAGE=y
> +CONFIG_WDT=y
> +CONFIG_HEXDUMP=y
> +# CONFIG_GENERATE_SMBIOS_TABLE is not set
> --
> 1.8.3.1
>
