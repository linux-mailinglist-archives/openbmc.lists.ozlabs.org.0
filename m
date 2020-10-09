Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAE22880D7
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 05:51:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6vJ358THzDqGn
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 14:51:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f42;
 helo=mail-qv1-xf42.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=gFEXVnCX; dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6vHD1vrSzDqMr
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2020 14:50:31 +1100 (AEDT)
Received: by mail-qv1-xf42.google.com with SMTP id b10so1949305qvf.0
 for <openbmc@lists.ozlabs.org>; Thu, 08 Oct 2020 20:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bSAzKzIYPC8oZqiK5Icy9ytUiXGhzLz3gESzI0UYcMc=;
 b=gFEXVnCXKj8/Qkz1tiTohn9Cd9s6O5BDvYMVnE8KFT8bqIRLyWNIJQMcQ3SbuZA5Yh
 +BE3uq8wfYeFiOlPGkwPJOJgkM3JnKD0wFwVy07dUpUSVcwWpDZAxZDQjAMcN5VEXPOD
 TYLW7WDste4EFTQJwTlpNmrZnc37H8pysdBC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bSAzKzIYPC8oZqiK5Icy9ytUiXGhzLz3gESzI0UYcMc=;
 b=EQkPBaJ1GQdu1BftKyaB8k3fveJEYmZLlCSvG1p5vcACxriQW/3Rj8QWr6+jSlJXMI
 KDGBFyr/lognScHHY8PK9w8ag4Xx2WNQ58X8qDzF7+Pyg018wpc8pCmOvnKaqwBCqxme
 AdrxQSjDE/It8C2Uo9HQFOWA86mM69owlQoxiePuqkd1UGQM+mPXS9yR2sVVgr5weGrt
 ZCShEuCHWGPpRFV4Risyt82laQDWL79mC62D+E3yPokvHiH/RdEdFTZbgwWZOey0/asS
 UZW+For0WN0HIjOpurHNE3Tfrj3Kal1luEg+MfQpe9o8q4SmRee+kna5fT11a8Ats3jL
 IPOQ==
X-Gm-Message-State: AOAM5324aCeddimGo8jJVLt0Zk3YMDfbYGQHUYIFRovMp/Epu6iDufeo
 JoskN5DtGGM03pKaR2D3HcQ9PUD8CUPjGQdvFvk=
X-Google-Smtp-Source: ABdhPJxLm5WxGf/+kQypQPtSut1oq0Rn74Kav1vG0HXaTem/vBzSrhVvwyeKxAkhrpOjIvoktLDw3btsZUAIfJo8FlM=
X-Received: by 2002:a0c:b442:: with SMTP id e2mr1488558qvf.18.1602215426991;
 Thu, 08 Oct 2020 20:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200928202753.58351-1-eajames@linux.ibm.com>
 <20200928202753.58351-4-eajames@linux.ibm.com>
In-Reply-To: <20200928202753.58351-4-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Oct 2020 03:50:14 +0000
Message-ID: <CACPK8Xe0qx75t8+mVfQ7gF-wzdxdSunyQ_NN2uZ_9S0E_bF6XA@mail.gmail.com>
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc 3/3] configs: Add AST2600
 SPL eMMC configuration
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

On Mon, 28 Sep 2020 at 20:28, Eddie James <eajames@linux.ibm.com> wrote:
>
> U-Boot and environment are to be loaded off the eMMC.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  configs/ast2600_openbmc_spl_emmc_defconfig | 130 +++++++++++++++++++++
>  include/configs/aspeed-common.h            |   6 +
>  2 files changed, 136 insertions(+)
>  create mode 100644 configs/ast2600_openbmc_spl_emmc_defconfig
>
> diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig

Here's the diff between the emmc and nor configs:

$ diff -up configs/ast2600_openbmc_spl_defconfig
configs/ast2600_openbmc_spl_emmc_defconfig
--- configs/ast2600_openbmc_spl_defconfig    2020-09-24 14:39:38.129075805 +0930
+++ configs/ast2600_openbmc_spl_emmc_defconfig    2020-10-09
14:16:35.786706472 +1030
@@ -9,9 +9,10 @@ CONFIG_ARCH_ASPEED=y
 CONFIG_SYS_TEXT_BASE=0x10000
 CONFIG_ASPEED_AST2600=y
 CONFIG_ASPEED_UBOOT_SPI_BASE=0x10000
-CONFIG_ASPEED_UBOOT_SPI_SIZE=0xe0000
-CONFIG_ASPEED_UBOOT_MMC_BASE=0x000000
-CONFIG_ASPEED_UBOOT_MMC_SIZE=0x700
+CONFIG_ASPEED_UBOOT_SPI_SIZE=0xd0000

Can we remove this from the config?

+CONFIG_ASPEED_UBOOT_MMC_BASE=0x80
+CONFIG_ASPEED_UBOOT_MMC_PART=1
+CONFIG_ASPEED_UBOOT_MMC_SIZE=0x680
 CONFIG_ASPEED_UBOOT_UART_SIZE=0xe0000
 CONFIG_ASPEED_UBOOT_DRAM_BASE=0x81000000
 CONFIG_ASPEED_KERNEL_FIT_SPI_BASE=0x20100000
@@ -27,7 +28,7 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
 CONFIG_ENV_SIZE=0x10000
-CONFIG_ENV_OFFSET=0xE0000
+CONFIG_ENV_OFFSET=0x5000

What's the 0x5000 here?

 CONFIG_SPL=y
 CONFIG_SPL_STACK_R_ADDR=0x90300000
 CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
@@ -81,13 +82,7 @@ CONFIG_CMD_FS_GENERIC=y
 CONFIG_CMD_MTDPARTS=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_SPL_OF_CONTROL=y
-CONFIG_ENV_IS_IN_SPI_FLASH=y
-CONFIG_USE_ENV_SPI_BUS=y
-CONFIG_ENV_SPI_BUS=0
-CONFIG_USE_ENV_SPI_CS=y
-CONFIG_ENV_SPI_CS=0
-CONFIG_USE_ENV_SPI_MAX_HZ=y
-CONFIG_ENV_SPI_MAX_HZ=100000000
+CONFIG_ENV_IS_IN_MMC=y

This hunk makes sense.
