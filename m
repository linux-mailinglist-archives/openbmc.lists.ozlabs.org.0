Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC203C4946
	for <lists+openbmc@lfdr.de>; Mon, 12 Jul 2021 12:32:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNg7W2dDcz303y
	for <lists+openbmc@lfdr.de>; Mon, 12 Jul 2021 20:32:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=bErTOQXj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82f;
 helo=mail-qt1-x82f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=bErTOQXj; dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNg7D2GxYz2yLs
 for <openbmc@lists.ozlabs.org>; Mon, 12 Jul 2021 20:32:07 +1000 (AEST)
Received: by mail-qt1-x82f.google.com with SMTP id d15so2236594qte.13
 for <openbmc@lists.ozlabs.org>; Mon, 12 Jul 2021 03:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MThXSQNvNuTHcdS92Vlu3ef2qPs3kdrpWrnnzvtXUHc=;
 b=bErTOQXjYCAfKFGihJk67yvjuMGbV1grjZce1BTyfOWR63OBwng7j+dFPDZBnCEaCK
 GcAtau1ZTCcEu7o5FohVTvFOZh0XO8aAykcAw1Ho6isi+0reFoyEvd/kkYhY2HgLlUl4
 wtZn4bwydyPNGRp37ARfTnVetBaRqWYzJlRFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MThXSQNvNuTHcdS92Vlu3ef2qPs3kdrpWrnnzvtXUHc=;
 b=VdlllRTIirx97U4xhaQBB1p7mspqkvkQzirrQge7gfk/mheXTHjTc2FgRNJrwv6SEU
 /kexYeU6KjtNBWZMfpTF3xB0xk9MxWrZuHRI3H7PfIVeB6SEBxV90toGIy1RRE1dY5WI
 FrjvUpyIa1tc3+76oplQqgi8qJv+OhETm55t8HvrHtLlLezkgw8xHZeXWYrAMyIplp1Z
 7ZTcyrBCwh7XDlkCzlgaTucp/tHXEwwDrjzhT8AWIlaLg2ye6VlIiWpOe8SnheQXJgy4
 8myrHQF4+juL4m6JUnGyxqlSm0CJJYraqQGr9HgpyVf8pQ3lukhzM+P7TonEKzmepf4t
 Ow4A==
X-Gm-Message-State: AOAM532KOx9dZb8CeXthVzqo2YKba1Xxmx+2YLcUhvCb0jVSIpQBaIiN
 MdfHBZiZcD542+7m/Tyr0xJ90d+t+xmz01r3AgY=
X-Google-Smtp-Source: ABdhPJwF4ZrxmYM44S7qNh2JC+yQ1rr449LkIHrAm5feRsiiEFC2ZphNTwFd6C0zUtcTHn7/U5+60oXcor30OxnNsSw=
X-Received: by 2002:a05:622a:50f:: with SMTP id
 l15mr47542794qtx.263.1626085923922; 
 Mon, 12 Jul 2021 03:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210701024206.GH8018@packtop>
 <CACPK8Xfa6_LoMi23F5YRSvdcD8fF6GA=WQkDCw9Z-Jf8EkoTWg@mail.gmail.com>
 <20210708191905.GK8018@packtop>
In-Reply-To: <20210708191905.GK8018@packtop>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 12 Jul 2021 10:31:51 +0000
Message-ID: <CACPK8XfBCyHGJu_y56=YrkvSc=yrcSy-3Ge9bdQ7DdxO8+uN+A@mail.gmail.com>
Subject: Re: U-boot version selection
To: Zev Weiss <zweiss@equinix.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 8 Jul 2021 at 19:19, Zev Weiss <zweiss@equinix.com> wrote:
>
> On Wed, Jun 30, 2021 at 11:51:49PM CDT, Joel Stanley wrote:
> >egacOn Thu, 1 Jul 2021 at 02:48, Zev Weiss <zweiss@equinix.com> wrote:
> >>
> >> Hi,
> >>
> >> I recently found myself needing to make some tweaks to u-boot to
> >> accommodate a new board I'm targeting with a larger flash part, but in
> >> going to do so I remembered that I'm currently using u-boot v2016.7,
> >> whereas new development is strongly encouraged to use v2019.04 [1].
> >>
> >> As far as I know that happened entirely by default (i.e. I didn't go out
> >> of my way to use the older version), so I hunted around a bit for how to
> >> override that to use the newer one, but wasn't able to find anything
> >> obvious.  What's the recommended way to go about switching that for my
> >> board?
> >
> >You can see Lei's change to use the newer tree here:
> >
> > https://github.com/openbmc/openbmc/commit/1aa72efd0f54
> >
> >UBOOT_DEVICETREE = "ast2500-evb"
> >UBOOT_MACHINE = "evb-ast2500_defconfig"
> >
> >PREFERRED_PROVIDER_u-boot = "u-boot-aspeed-sdk"
> >PREFERRED_PROVIDER_u-boot-fw-utils = "u-boot-fw-utils-aspeed-sdk"
> >PREFERRED_PROVIDER_virtual/bootloader = "u-boot-aspeed-sdk"
> >
> >The important change is to point it to a valid defconfig for the new
> >tree, to specify the u-boot device tree to use, and to change some
> >yocto PROVIDER variables to use the "u-boot-aspeed-sdk" variant.
> >
>
> Great, thanks for the pointers there -- that worked smoothly on the 64M
> board I'm currently working on a port for.  Unfortunately when I tried
> it out on one of the 32M platforms I've got I realized that the u-boot
> image with the new branch comes out to around 430K, which in addition to
> being quite a bit larger than the old branch (~225K), is too big to fit
> in the u-boot partition of the 32MB static flash layout (384K).
>
> With a bit of haphazard experimentation, I found that disabling
> CONFIG_EFI_LOADER got it down to 370K, and turning off
> CONFIG_SYS_LONGHELP reduced that to 357K, leaving a bit of breathing
> room, though perhaps still less than would be ideal.  Since a quick poll
> of FLASH_SIZE settings seems to indicate that most existing OpenBMC
> platforms are 32M, would those be appropriate candidates to add to the
> evb-ast2500_defconfig?

Yes, that would make sense. Confirming that this set got it down to 345 KB:

+# CONFIG_SYS_LONGHELP is not set
+# CONFIG_CMD_ELF is not set
+# CONFIG_CMD_IMI is not set
+# CONFIG_CMD_XIMG is not set
+# CONFIG_REGEX is not set
+# CONFIG_EFI_LOADER is not set

Are there any ast2500 boards that use MMC? If not, disabling MMC and
block devices gets it down to 321 KB:

-CONFIG_CMD_MMC=y
-CONFIG_DM_MMC=y
-# CONFIG_MMC_HW_PARTITIONING is not set
-CONFIG_MMC_SDHCI=y
-CONFIG_MMC_SDHCI_ASPEED=y
+# CONFIG_MMC is not set

If we disable MMC, we should probably create our own defconfig
(ast2500_openbmc_defconifg). If we just want to disable the unused
options, I think patching the evb defconfig is fine. I'll leave it to
you; please send a patch to the list and I'll merge it.

>
> (I also encountered an ftgmac100 phy-related null pointer dereference
> that leads to it spewing a bunch of garbage to the console, which I
> band-aided temporarily with a dts patch to disable the second mac.)

Thanks for the report.
