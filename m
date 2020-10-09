Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF382880C4
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 05:42:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6v616Xc8zDqWn
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 14:42:33 +1100 (AEDT)
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
 header.s=google header.b=GUNLN2+t; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6v4s6QP3zDqXN
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2020 14:41:33 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id z33so3103315qth.8
 for <openbmc@lists.ozlabs.org>; Thu, 08 Oct 2020 20:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MN14jcQVODel/rX+d4gAR8gvXTGcEmq4xgoNDaij+L0=;
 b=GUNLN2+tXIVY1Lxu95v+T0LgHockuVcsovW7iuSHNXYGwUfIoUPNjxChRdGVRi9QmW
 q375QljN1TNgAqnvw1oxvVIHRdBO/FSEQ5PDLLlJSUi7MN2EtrHJOXGEy/+4aruosOw5
 aJS/e9B+UUscujy30yRevxPUqZA2sA27yiE7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MN14jcQVODel/rX+d4gAR8gvXTGcEmq4xgoNDaij+L0=;
 b=L39jeI2fisCYVL7MNoId+CBHStbVEUMGBgoD35GDmPs00Xq3PHN3EO6uR6ZZ37JCa9
 iJAdpg8uI8L9XhIeUPwZaOocZaeuWb/Bg5G2KDVBtL9r/mt3FGlxqKE2ZVSu+1wu9h5W
 o5BdXXFp6Ob4w10YUTcBE7w8oNIQahxDFjSuFiS5USaOChoaFMZueUH9f0XD0blSXAO+
 7napyjRfKz4f4NTnCH5yF7bPCJD3eb0s6nYJKQrfGU+OyK5BJXglGB/iMQhvY5NgDPlC
 TodnHB8zbdrnrhTPv3cqe9aVYeUXPUOsfVbImfeA5yOhXixBXqzPHqPXRD8ig0KBbmGZ
 8g1w==
X-Gm-Message-State: AOAM531epjHwVJzmnERDxw3AzUDZBawySWDMHR8vRwfXffPuPErC3pLf
 KWPBSbsbXyxU7eEgfYFTKjdxzP5d8wp851U79Ke0akS7
X-Google-Smtp-Source: ABdhPJwe0SH2NqZnN3SZSTZ4GQTIoEU82oI2ssdhms1AYutR6IN1nFASNQ+tAQRQkhNjxtkTAsc4wYlAb25nhXZM9wo=
X-Received: by 2002:ac8:2612:: with SMTP id u18mr12405680qtu.363.1602214890339; 
 Thu, 08 Oct 2020 20:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200928202753.58351-1-eajames@linux.ibm.com>
 <20200928202753.58351-3-eajames@linux.ibm.com>
In-Reply-To: <20200928202753.58351-3-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Oct 2020 03:41:18 +0000
Message-ID: <CACPK8XcSTJ6tYSqUv=SX+x6uT7O59MBGoyxmbHn1ddCcqO6u6w@mail.gmail.com>
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc 2/3] arch: ARM: Aspeed: Add
 SPL eMMC partition boot support
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
> Support loading U-Boot from a specific partition on the eMMC
> device.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/mach-aspeed/Kconfig            | 7 +++++++
>  arch/arm/mach-aspeed/ast2600/spl_boot.c | 9 ++++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
> index 06f14f4f55..0e3bb841d0 100644
> --- a/arch/arm/mach-aspeed/Kconfig
> +++ b/arch/arm/mach-aspeed/Kconfig
> @@ -90,6 +90,13 @@ config ASPEED_UBOOT_MMC_BASE
>           The base block number of the U-Boot
>           image in the eMMC device
>
> +config ASPEED_UBOOT_MMC_PART
> +       int "U-Boot eMMC partition"
> +       default 0
> +       help
> +         The partition number of the U-Boot
> +         image in the eMMC device

To clarify, it's the partition number in the user area of the eMMC
device? (and not the eMMC partition).

Reviewed-by: Joel Stanley <joel@jms.id.au>

> +
>  config ASPEED_UBOOT_MMC_SIZE
>         hex "U-Boot eMMC size in blocks"
>         default 0x0
> diff --git a/arch/arm/mach-aspeed/ast2600/spl_boot.c b/arch/arm/mach-aspeed/ast2600/spl_boot.c
> index b08c49d204..58a22f646e 100644
> --- a/arch/arm/mach-aspeed/ast2600/spl_boot.c
> +++ b/arch/arm/mach-aspeed/ast2600/spl_boot.c
> @@ -46,8 +46,8 @@ static int aspeed_spl_mmc_load_image(struct spl_image_info *spl_image,
>                                       struct spl_boot_device *bootdev)
>  {
>         int err;
> +       int part = CONFIG_ASPEED_UBOOT_MMC_PART;
>         u32 count;
> -
>         struct mmc *mmc = NULL;
>         struct udevice *dev;
>         struct blk_desc *bd;
> @@ -78,6 +78,13 @@ static int aspeed_spl_mmc_load_image(struct spl_image_info *spl_image,
>
>         bd = mmc_get_blk_desc(mmc);
>
> +       if (part) {
> +               if (CONFIG_IS_ENABLED(MMC_TINY))
> +                       err = mmc_switch_part(mmc, part);
> +               else
> +                       err = blk_dselect_hwpart(bd, part);
> +       }
> +
>         count = blk_dread(bd, CONFIG_ASPEED_UBOOT_MMC_BASE, CONFIG_ASPEED_UBOOT_MMC_SIZE,
>                         (void *)CONFIG_ASPEED_UBOOT_DRAM_BASE);
>         if (count != CONFIG_ASPEED_UBOOT_MMC_SIZE) {
> --
> 2.26.2
>
