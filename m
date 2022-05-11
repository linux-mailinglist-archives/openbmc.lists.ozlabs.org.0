Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C63522DA3
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 09:50:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KynBL5CSZz2yMS
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 17:50:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=S/q0g/tV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32e;
 helo=mail-wm1-x32e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=S/q0g/tV; dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kyn9z4wKcz2xB1
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 17:49:43 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so719818wmn.1
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 00:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IC8/WbBy662IY8+pZIexMgjoTdPCDfcdTQD255YeMnU=;
 b=S/q0g/tVQ6dE0cNfZ1RhMnWB4eBz5WObrPx3o+t/FAI04pCAZ1TcthxMRNACm0HvUe
 QIm1O0wZf4LZEs8eI5oJiScnT+SB7aRbAS382C6oheqH6UeDBIpKFuN+KBhvpgmwPqeg
 SheZFTahp10TSKQ+97eBMbH+B0o8iq6lTmgOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IC8/WbBy662IY8+pZIexMgjoTdPCDfcdTQD255YeMnU=;
 b=wx8w2lyWjnoR79pxba/P7mFJkUmKU4w22arR8SVyMuYIkaY1yCjakS/mqxa48XojWk
 4zzKFlCHV+vT8pxh2rx1Wq4kN3XccFoB8OsvXf9e1HPwuwa0RaAolzSYfk7eTjIAaPPo
 r/pEGlX1VCAowbxbVSkLAHWdJVNwVEicB/RQLczN3M4DG+lV+vZXKjv3J/4CvL2sR19f
 /X3I80bK6XxouX7xcDXsn65EqDGgdwDpQ5l143XvXqksrL327tNsROvDFLLLOhRXHinv
 1VAhDb+KCz4GFNWo7vWSjlF9eXKui6x1wCcoGWIj4UgSkX+fULKDQ6Yi6oxpCCKWgvb2
 o+Mw==
X-Gm-Message-State: AOAM532laQQXYUbXz1L/AUsZrvdeEDtFab9X1alxAv3l+MuZJpOA2mBA
 yScIFhtiMffgX1qxwZP78+QGt3MkF+VMjUaKdLw=
X-Google-Smtp-Source: ABdhPJwZy/UHK7dE5QaYnN5YzvWTz1bAn4UXeUfpzNqSr/gkUvWs7M70V/cPzbimSCg/TQi2t7PJryxuRI22FD9yzWU=
X-Received: by 2002:a05:600c:1c0e:b0:394:66af:ef0f with SMTP id
 j14-20020a05600c1c0e00b0039466afef0fmr3412003wms.48.1652255379523; Wed, 11
 May 2022 00:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220421083151.1887871-1-patrick.rudolph@9elements.com>
 <20220421083151.1887871-5-patrick.rudolph@9elements.com>
In-Reply-To: <20220421083151.1887871-5-patrick.rudolph@9elements.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 May 2022 07:49:27 +0000
Message-ID: <CACPK8XdWOdVpcMxHVdSmCRB9kiHNRs1FSao6ZTNmZt=nG8Ewfw@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 4/4] configs: Add IBM
 Genesis3 defconfig
To: Patrick Rudolph <patrick.rudolph@9elements.com>
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
Cc: christian.walter@9elements.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 takken@us.ibm.com, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 21 Apr 2022 at 08:32, Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:
>

This would be where you put some words to justify the configuration
you have added for the board, instead of using an existing one.


> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  configs/ibm_genesis3_defconfig | 73 ++++++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 configs/ibm_genesis3_defconfig
>
> diff --git a/configs/ibm_genesis3_defconfig b/configs/ibm_genesis3_defconfig
> new file mode 100644
> index 0000000000..76a3673991
> --- /dev/null
> +++ b/configs/ibm_genesis3_defconfig
> @@ -0,0 +1,73 @@
> +CONFIG_SPI_BOOT=y
> +CONFIG_FIT_VERBOSE=y
> +CONFIG_LOG=y
> +CONFIG_BOOTCOMMAND="bootm 20080000"
> +CONFIG_BOOTARGS="console=ttyS4,115200n8 root=/dev/ram rw earlycon"
> +# CONFIG_SYS_I2C_ASPEED is not set
> +CONFIG_ASPEED_AHBC=y
> +CONFIG_ARM=y
> +CONFIG_ARCH_ASPEED=y
> +CONFIG_SYS_TEXT_BASE=0x0
> +CONFIG_SYS_MALLOC_F_LEN=0x2000
> +CONFIG_ENV_SIZE=0x20000
> +CONFIG_ENV_OFFSET=0x60000
> +CONFIG_NR_DRAM_BANKS=1
> +CONFIG_FIT=y
> +CONFIG_USE_BOOTARGS=y
> +CONFIG_USE_BOOTCOMMAND=y
> +CONFIG_PRE_CONSOLE_BUFFER=y
> +CONFIG_PRE_CON_BUF_ADDR=0x1e720000
> +CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
> +CONFIG_HUSH_PARSER=y
> +# CONFIG_AUTO_COMPLETE is not set
> +CONFIG_SYS_PROMPT="ast# "
> +# CONFIG_CMD_IMI is not set
> +# CONFIG_CMD_XIMG is not set
> +CONFIG_CMD_MEMTEST=y
> +CONFIG_SYS_ALT_MEMTEST=y
> +CONFIG_CMD_CLK=y
> +CONFIG_CMD_GPIO=y
> +CONFIG_CMD_SF=y
> +CONFIG_CMD_DHCP=y
> +CONFIG_CMD_MII=y
> +CONFIG_CMD_PING=y
> +CONFIG_DEFAULT_DEVICE_TREE="ibm-genesis3"
> +CONFIG_ENV_IS_IN_SPI_FLASH=y
> +CONFIG_USE_ENV_SPI_BUS=y
> +CONFIG_ENV_SPI_BUS=0
> +CONFIG_USE_ENV_SPI_CS=y
> +CONFIG_ENV_SPI_CS=0
> +CONFIG_USE_ENV_SPI_MAX_HZ=y
> +CONFIG_ENV_SPI_MAX_HZ=50000000
> +CONFIG_SF_DEFAULT_SPEED=50000000
> +CONFIG_NET_RANDOM_ETHADDR=y
> +CONFIG_REGMAP=y
> +CONFIG_CLK=y
> +CONFIG_DM_GPIO=y
> +CONFIG_ASPEED_GPIO=y
> +CONFIG_DM_I2C=y
> +CONFIG_MISC=y
> +CONFIG_DM_MMC=y
> +# CONFIG_MMC is not set
> +# CONFIG_CMD_MMC is not set
> +# CONFIG_MMC_SDHCI is not set
> +# CONFIG_MMC_SDHCI_ASPEED is not set
> +# CONFIG_MMC_HW_PARTITIONING is not set
> +CONFIG_SPI_FLASH_SFDP_SUPPORT=y
> +CONFIG_DM_SPI_FLASH=y
> +CONFIG_SPI_FLASH=y
> +CONFIG_SPI_FLASH_SPANSION=y
> +CONFIG_DM_ETH=y
> +CONFIG_FTGMAC100=y
> +# CONFIG_PHY is not set
> +CONFIG_PINCTRL=y
> +CONFIG_DM_SERIAL=y
> +CONFIG_SYS_NS16550=y
> +CONFIG_SPI=y
> +CONFIG_DM_SPI=y
> +CONFIG_SYSRESET=y
> +CONFIG_TIMER=y
> +CONFIG_WDT=y
> +# CONFIG_EFI_LOADER is not set
> +CONFIG_DRAM_UART_TO_UART1=y
> +# CONFIG_FIRMWARE_2ND_BOOT is not set
> --
> 2.35.1
>
