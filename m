Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FD535E9D0
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 01:49:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKj4P0Pbsz3bVH
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 09:49:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Mro6hi6B;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Mro6hi6B; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKj491S50z2yxN
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 09:48:54 +1000 (AEST)
Received: by mail-qt1-x836.google.com with SMTP id c6so14170520qtc.1
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 16:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=soIIxqtI7nfCyUhHT3KaxoyTAk4U1d/HvUWNDy1j2T4=;
 b=Mro6hi6BdVqz23eN2+njc0UVa81HNtrjB/UOCkHpOIn+3P23e3Y46ImD6mubydr1Zx
 YXC7gUkb7n+f6yrt9VDw0aov0caqCl7YI4nejb6VmcucEymDirYDJ/n6ul3+Z0Jx4SQ+
 ag7rlMSAeFSpcbgdixkDddRlD4kZHCNN4c5cQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=soIIxqtI7nfCyUhHT3KaxoyTAk4U1d/HvUWNDy1j2T4=;
 b=F+2/D5L2h6mDlE2cB/BsSx7JoeeKRv0YaghsFsfY/CrPv1AVvuwRY7kXBEhko5Rp58
 ACs2Zl/OyrKCDDJbjyNSSh041/LdExcYtEK5cobEv0A7l5HFsIidVJu+6Knh+x9ZYWGd
 yxDLi5l992sNOSUlkWit0pdWDKj+A59XeMv1H5/3zZIMgnWl30RwtvvRK0NItRGru5aC
 ZSSkz+IuMBlvDA6cLFKKV29HjtHdKITdEKz9V5HQ2ttAewJ0OcWCYvPRS+TFJNl6LSwr
 25XqGtipojqOUV6emJU2zhialcB1dMRq1T4kXENcrLRqUZPtzEL+ClsQjzrm6D0xrgHE
 4ExQ==
X-Gm-Message-State: AOAM5323RqA0LRTvKPvtiyTK3TE0AFV3vuIwP6xO5sXbSs8B17bzYsvi
 YEKcz4JmlDhajY8mYH319iebWVU0n1P5n4Vreh62xt18MbA=
X-Google-Smtp-Source: ABdhPJwGnea5n2iQg9Xw9mqJw8PJNhdXSlCsUvi4+69Ld0TIYmcAUuRIbGyj0oPFqZfa3MmoOE9BwPJDzP5PjgNTwXQ=
X-Received: by 2002:a05:622a:d3:: with SMTP id
 p19mr10599544qtw.385.1618357730718; 
 Tue, 13 Apr 2021 16:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210413080755.73572-1-joel@jms.id.au>
 <20210413080755.73572-6-joel@jms.id.au>
 <f22d9ea3-e092-8e90-cd25-41369d8704c7@linux.vnet.ibm.com>
In-Reply-To: <f22d9ea3-e092-8e90-cd25-41369d8704c7@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Apr 2021 23:48:38 +0000
Message-ID: <CACPK8XdiY3zsv9qcq98Gt0dcOF-Tkpq1P7sDwV1EHhu6p5yR5Q@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 05/11] config: ast2600:
 Enable common eMMC SPL loader
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 13 Apr 2021 at 20:47, Klaus Heinrich Kiwi
<klaus@linux.vnet.ibm.com> wrote:
>
>
>
> On 4/13/2021 5:07 AM, Joel Stanley wrote:
> > Notabily the link address changes, as this is used as the load address
> > by the loader.
> >
> > Given the Aspeed loaders are linking u-boot at 0x10000 but running it
> > from RAM, the u-boot relocation code must be fine with this setup.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >   configs/ast2600_openbmc_spl_emmc_defconfig | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
> > index 6daf6343478b..e59d3595ebf0 100644
> > --- a/configs/ast2600_openbmc_spl_emmc_defconfig
> > +++ b/configs/ast2600_openbmc_spl_emmc_defconfig
> > @@ -7,7 +7,7 @@ CONFIG_SYS_THUMB_BUILD=y
> >   # CONFIG_SPL_USE_ARCH_MEMSET is not set
> >   CONFIG_SPL_LDSCRIPT="arch/$(ARCH)/mach-aspeed/ast2600/u-boot-spl.lds"
> >   CONFIG_ARCH_ASPEED=y
> > -CONFIG_SYS_TEXT_BASE=0x10000
> > +CONFIG_SYS_TEXT_BASE=0x81000000
> >   CONFIG_ASPEED_AST2600=y
> >   CONFIG_ASPEED_UBOOT_SPI_BASE=0x10000
> >   CONFIG_ASPEED_UBOOT_SPI_SIZE=0xd0000
> > @@ -47,11 +47,12 @@ CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
> >   CONFIG_DISPLAY_BOARDINFO_LATE=y
> >   CONFIG_ARCH_EARLY_INIT_R=y
> >   CONFIG_BOARD_EARLY_INIT_F=y
> > -# CONFIG_SPL_RAW_IMAGE_SUPPORT is not set
> Guess this is unrelated?
> But still, isn't this required for booting from UART? I had
> the impression that the SPL ymodem boot would not work with
> fitImages.

The common spl code that we're now using the boot the system has
support for parsing the fit. See ymodem_read_fit in
common/spl/spl_ymodem.c.

You were correct that the aspeed spl code did not support fit.

Cheers,

Joel
