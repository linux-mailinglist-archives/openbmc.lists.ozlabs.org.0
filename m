Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A75B36000C
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 04:33:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLNg20SCFz30NL
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 12:33:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=CQfNVJgm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2a;
 helo=mail-qv1-xf2a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=CQfNVJgm; dkim-atps=neutral
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLNfp0mjlz300X
 for <openbmc@lists.ozlabs.org>; Thu, 15 Apr 2021 12:32:48 +1000 (AEST)
Received: by mail-qv1-xf2a.google.com with SMTP id i9so10815746qvo.3
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 19:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uezIDtjTWhyotJr/TbU9MqK69AfkYUrU/mI+8YUTBXg=;
 b=CQfNVJgmmojWav6n9liF6W9ivrXTi9pCdYUUatDRvFHt03I1cwtvOf+UzY5xjiBG5Y
 spUbtyZK6h2Vrc39k7SdzsElcmNWgpr7niR68Qcw7VB9g55Ms9IdF+Q0LfatRAn0UsMW
 i2MNmb8f640nn9dTsceicMi5rz5pwuvnn7SKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uezIDtjTWhyotJr/TbU9MqK69AfkYUrU/mI+8YUTBXg=;
 b=Z6yXHuvByfwpRAnJbGdgrHQwYMTuGDkirNu39G/hfOwLjWA0vSH1dGWJwqEeW/d++S
 YbsshhDfiwO4Os8Y4kYWirFzhnffbB+BvL+z7ASj/5EyfXF74N3w3VR22CC095MOrPXS
 2gzwlM3a+VBe6G+DoNl846gu8zg6OTYRK2Ql64mMXoIrsacEm6wml9Pjq4DORaEq0LYj
 S+OtrybeFer22yKCZD5/awHVVSdjy/ZdQqZREY4vcHtNTXmf9YMvw3hA3Rq2JsHXbKxQ
 swj3nONiNdku+23BIumJWx6nTi0o7ws4BK4xUBvTnDWZ/cphH11JVxoaHXVOrxlgHq3M
 3qAQ==
X-Gm-Message-State: AOAM5338CtVAp3aC9lyeTK9gWmQwEen73u2EzwUkSyM/jFAI22M/KbVu
 672fP4Rhj2wUn+auOksNVOdEI0aKa8Wt1bpoCc8=
X-Google-Smtp-Source: ABdhPJwYqCVlzIm58gEUxq6uLsfXCP96HwTCUQM7ZDkDvxwzbKe4kEF3AWSmDDPpUh7ht6CJ36dodilWw2FtjCz8ATo=
X-Received: by 2002:ad4:55c1:: with SMTP id bt1mr1104647qvb.16.1618453965190; 
 Wed, 14 Apr 2021 19:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210413080755.73572-1-joel@jms.id.au>
 <20210413080755.73572-11-joel@jms.id.au>
 <cacf13c1-91b2-ad51-606e-bb208d13ec36@linux.vnet.ibm.com>
 <9779de4a-6985-8b94-9fb6-55c74a7a722f@linux.vnet.ibm.com>
In-Reply-To: <9779de4a-6985-8b94-9fb6-55c74a7a722f@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Apr 2021 02:32:32 +0000
Message-ID: <CACPK8XcNyXUhe=43NCR1RzrexJGYWw2S-kXWsYDzNYAJujnmpg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 10/11] crypto: Add driver
 for Aspeed HACE
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 14 Apr 2021 at 20:28, Klaus Heinrich Kiwi
<klaus@linux.vnet.ibm.com> wrote:
>
>
>
> On 4/13/2021 5:41 PM, Klaus Heinrich Kiwi wrote:
> > I've tested your patchset with Cedric's Aspeed-6.0 but looks
> > like the probe function is never called. Reading through the code
> > a bit more, looks like you need to explicitly probe this device
> > somewhere in board_init_r (that is, after sdram was initialized),
> > since functions like dm_scan_fdt() and dm_extended_scan_fdt() will
> > only scan subnodes of the top level, and the clocks node.
> >
> > This is what I get (with some added printfs of mine):
>
> I've played around a bit more, and got it to work on Qemu with the follow=
ing changes:
>
>   * Added a board-specific spl_board_init() initializing the HACE driver =
at
>     the SPL's board_init_r() timeframe. Enabled that on the defconfig fil=
e.
>   * Because the driver model is using some pre-sdram malloc pool space,
>     the changes above were causing the probing of the sdram itself to fai=
l.
>     Corrected by increasing the pre-sdram malloc pool to 0x1000.

Thanks. I had added something similar when debugging this yesterday.

I had tested the changes, but must have mixed up which images were
being loaded into qemu.

> However, when I tried to test it on a Rainier, it failed:
> U-Boot SPL 2019.04 (Apr 14 2021 - 19:31:59 +0000)
> already initialized, Trying to boot from MMC1
> ## Checking hash(es) for Image uboot ... sha512,rsa4096:autogenerated-ubo=
ot-4096-key- Failed to verify required signature 'key-autogenera'
>   error!
> Unable to verify required signature for '' hash node in 'uboot' image nod=
e
> mmc_load_image_raw_sector: mmc block read error
> Trying to boot from UART
> CCCCC =EF=BF=BDP
>
> (and yes, I had since disabled my debugging printf's). I wonder if the HA=
SH_ISR
> may need to be explicitly cleared, although I'd expect it to work for the=
 first
> command at least.
>
> Another interesting thing is that the SPL tries to boot from UART, but ne=
ither
> my fitImages, Legacy images or even RAW images are working.. Not sure if =
we need
> some special handling of those images before feeding them to the spl ymod=
em loader?

I wasn't able to get the SPL to load any images - raw binaries or FIT
- from eMMC either. Something is going wrong, but I am unsure what it
is. I will continue to debug.

Cheers,

Joel
