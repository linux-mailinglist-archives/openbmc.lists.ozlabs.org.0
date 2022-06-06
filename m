Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2902C53E095
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 06:58:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGh886hP2z3bmM
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 14:58:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=h6vTVLkR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=h6vTVLkR;
	dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGh7m0f6wz3036
	for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2022 14:57:54 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id m26so6825438wrb.4
        for <openbmc@lists.ozlabs.org>; Sun, 05 Jun 2022 21:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uUUyelooKx2zww2oweD1j6UKfBfHjt/gtmc8iPc0jrY=;
        b=h6vTVLkRBfYRMcO5Am88mBgIfNXy/LTbAU2d0GUcvImEoo7NEuFw8qczVKfDeXUAWK
         qfEqMmVW1O8JAKNglOWkZD97pzga/HwhtjTCzdqKm/0YzXn2iiovkWLCY7Mn+WKqQXVo
         rBZktRnnyc3Pgb0yE/gHm/Dtx+6fSHK8/o1/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uUUyelooKx2zww2oweD1j6UKfBfHjt/gtmc8iPc0jrY=;
        b=zqrHty6frYutgzrugqjL1nysYL+jNjyAei+V5SvxHWFJamTZTdqL56Nkedw/oXWUPc
         FdLErLEus9ITq1nSGdcX1hph8h7xirHxG+5+3kW00BZlS1/ZY5Gp3Zro0hJLWqOjQ4mS
         1zYfcrK4R+csxSnSo3wssdH+wrmofvShv9JUYzL+3jjQg1beHWaP52+nDq0ZR8D/GPaz
         nvkSc+nCffwqPxngQzjCeu/Uarb4TMPokQkutxC1QjpyIbBdEJ1Tai48/LSvIwet/Tw1
         LewLxBQ1/W2hVNef7I4OcKu5pE9Uf+WSbyG7EpQrO47cGBdbN/9uEs8QSL10l/04/8GR
         Iwqw==
X-Gm-Message-State: AOAM5337hq2l1nIl4OarinuF49bXG8EIcY+NOywMu15MRk3UsQOoJQNG
	VPucwLCETO4gsBAxUbpesWgxiol8pOPJDG4rR/2gf8SV
X-Google-Smtp-Source: ABdhPJx+T62q4SZ0kj2+kdAftngRH11wjcKqhcnaelrqCsD99aEL44tAM6JYFaq4Th+xC9YOEyr5hfDK5v52mYtEZ0Y=
X-Received: by 2002:a5d:47c9:0:b0:20f:e7da:6a48 with SMTP id
 o9-20020a5d47c9000000b0020fe7da6a48mr19901805wrc.315.1654491466649; Sun, 05
 Jun 2022 21:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <SG2PR06MB2315D4EDA1E2C782AE5334B8E6FB9@SG2PR06MB2315.apcprd06.prod.outlook.com>
 <HK0PR06MB37794BB30922645DE9A160BD91A29@HK0PR06MB3779.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB37794BB30922645DE9A160BD91A29@HK0PR06MB3779.apcprd06.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Jun 2022 04:57:33 +0000
Message-ID: <CACPK8XeXJ5RT+vqO5t=eo_Tj4C6x69pKtazegUpspv_JWnDr_A@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] configs: aspeed: Add SPL
 FIT image loading support
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
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
Cc: Howard Chiu <howard_chiu@aspeedtech.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Troy Lee <troy_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 6 Jun 2022 at 01:45, ChiaWei Wang <chiawei_wang@aspeedtech.com> wrote:
>
> Gentle ping of this patch.
>
> Reviewed-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>

Thanks for the reminder. The patch didn't apply, but I fixed it up and
applied it.

Cheers,

Joel

>
> > From: Howard Chiu <howard_chiu@aspeedtech.com>
> > Sent: Tuesday, April 26, 2022 5:44 PM
> >
> > 1. Disable ASPEED_LOADERS to instead use generic FIT image bootflow
> > 2. Enable SPL_LOAD_FIT and FIT hash/signature verification
> > 3. Enable SHA family support
> > 4. Enable HACE/ACRY crypto engine
> >
> > Tested with AST2600-A3 EVB
> >
> > Signed-off-by: Howard Chiu <howard_chiu@aspeedtech.com>
> > ---
> >  configs/ast2600_openbmc_spl_defconfig | 30 +++++++++++++++------------
> >  1 file changed, 17 insertions(+), 13 deletions(-)
> >
> > diff --git a/configs/ast2600_openbmc_spl_defconfig
> > b/configs/ast2600_openbmc_spl_defconfig
> > index 98aa3f160e..9025401e0c 100644
> > --- a/configs/ast2600_openbmc_spl_defconfig
> > +++ b/configs/ast2600_openbmc_spl_defconfig
> > @@ -8,17 +8,7 @@
> > CONFIG_SPL_LDSCRIPT="arch/$(ARCH)/mach-aspeed/ast2600/u-boot-spl.lds"
> >  CONFIG_ARCH_ASPEED=y
> >  CONFIG_SYS_TEXT_BASE=0x10000
> >  CONFIG_ASPEED_AST2600=y
> > -CONFIG_ASPEED_UBOOT_SPI_BASE=0x10000
> > -CONFIG_ASPEED_UBOOT_SPI_SIZE=0xe0000
> > -CONFIG_ASPEED_UBOOT_MMC_BASE=0x000000
> > -CONFIG_ASPEED_UBOOT_MMC_SIZE=0x700
> > -CONFIG_ASPEED_UBOOT_UART_SIZE=0xe0000
> > -CONFIG_ASPEED_UBOOT_DRAM_BASE=0x81000000
> > -CONFIG_ASPEED_KERNEL_FIT_SPI_BASE=0x20100000
> > -CONFIG_ASPEED_KERNEL_FIT_SPI_SIZE=0x1000000
> > -CONFIG_ASPEED_KERNEL_FIT_MMC_BASE=0x800
> > -CONFIG_ASPEED_KERNEL_FIT_MMC_SIZE=0x8000
> > -CONFIG_ASPEED_KERNEL_FIT_DRAM_BASE=0x83000000
> > +# CONFIG_ASPEED_LOADERS is not set
> >  CONFIG_TARGET_EVB_AST2600A1=y
> >  CONFIG_SPL_LIBCOMMON_SUPPORT=y
> >  CONFIG_SPL_LIBGENERIC_SUPPORT=y
> > @@ -34,19 +24,30 @@ CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
> >  CONFIG_ARMV7_PSCI_NR_CPUS=2
> >  CONFIG_NR_DRAM_BANKS=1
> >  CONFIG_FIT=y
> > +CONFIG_FIT_ENABLE_SHA384_SUPPORT=y
> > +CONFIG_FIT_ENABLE_SHA512_SUPPORT=y
> > +CONFIG_FIT_SIGNATURE=y
> > +CONFIG_SPL_FIT_SIGNATURE=y
> > +CONFIG_SPL_LOAD_FIT=y
> > +CONFIG_IMAGE_FORMAT_LEGACY=y
> >  CONFIG_USE_BOOTARGS=y
> >  CONFIG_BOOTARGS="console=ttyS4,115200n8 root=/dev/ram rw"
> >  CONFIG_USE_BOOTCOMMAND=y
> > -CONFIG_BOOTCOMMAND="bootm 20100000"
> > +CONFIG_BOOTCOMMAND="run bootspi"
> >  CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
> >  CONFIG_DISPLAY_BOARDINFO_LATE=y
> >  CONFIG_ARCH_EARLY_INIT_R=y
> >  CONFIG_BOARD_EARLY_INIT_F=y
> > -# CONFIG_SPL_RAW_IMAGE_SUPPORT is not set
> > +CONFIG_SPL_BOARD_INIT=y
> >  # CONFIG_SPL_LEGACY_IMAGE_SUPPORT is not set
> >  CONFIG_SPL_SYS_MALLOC_SIMPLE=y
> >  CONFIG_SPL_STACK_R=y
> >  CONFIG_SPL_SEPARATE_BSS=y
> > +CONFIG_SPL_SHA1_SUPPORT=y
> > +CONFIG_SPL_SHA256_SUPPORT=y
> > +CONFIG_SPL_SHA384_SUPPORT=y
> > +CONFIG_SPL_SHA512_SUPPORT=y
> > +CONFIG_SPL_FIT_IMAGE_TINY=y
> >  CONFIG_SPL_DM_RESET=y
> >  CONFIG_SPL_RAM_SUPPORT=y
> >  CONFIG_SPL_RAM_DEVICE=y
> > @@ -95,6 +96,8 @@ CONFIG_SYSCON=y
> >  CONFIG_SPL_OF_TRANSLATE=y
> >  CONFIG_CLK=y
> >  CONFIG_SPL_CLK=y
> > +CONFIG_ASPEED_HACE=y
> > +CONFIG_ASPEED_ACRY=y
> >  CONFIG_DM_GPIO=y
> >  CONFIG_ASPEED_GPIO=y
> >  CONFIG_DM_I2C=y
> > @@ -132,4 +135,5 @@ CONFIG_WDT=y
> >  CONFIG_USE_TINY_PRINTF=y
> >  CONFIG_TPM=y
> >  CONFIG_SPL_TPM=y
> > +CONFIG_SPL_TINY_MEMSET=y
> >  # CONFIG_EFI_LOADER is not set
> > --
> > 2.25.1
>
