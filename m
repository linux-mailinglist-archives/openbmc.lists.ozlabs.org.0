Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B2D3872E7
	for <lists+openbmc@lfdr.de>; Tue, 18 May 2021 09:13:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FknK334dvz301k
	for <lists+openbmc@lfdr.de>; Tue, 18 May 2021 17:13:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=bmRk3P6j;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=bmRk3P6j; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FknJn1STfz2xy3
 for <openbmc@lists.ozlabs.org>; Tue, 18 May 2021 17:12:56 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id v4so6774295qtp.1
 for <openbmc@lists.ozlabs.org>; Tue, 18 May 2021 00:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Etv0bMy2ExffqTEHNnEhIyqEg6RVlF3RhM8zehwKhik=;
 b=bmRk3P6jArq3zPHbmcniMQI5mWZATkEkWOdoWWi6h8QgyyK4DCXa2XgWay+glqvkao
 lpgUkalbToVuU92SXkckVQC12P4RorR94hxXq1eVGztHPgbhnoOgHIWK14g2+NlThnnW
 HcNnTeFFQUWBMkA1G22Kvqkud+KuujzC7N4ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Etv0bMy2ExffqTEHNnEhIyqEg6RVlF3RhM8zehwKhik=;
 b=BzA9FggLN94nCjtoeAwuqN0yb4MrA/rEMX3tTeUTsaO+IT4IU/3SytAJhdy3+jMGXu
 0FB/igw82Q1zzERD/VTWlNZbhuNz216borQf1RYmWwXa0X+74d0c4EfXB3tet11Bjskb
 QCOh7qsM3LOyYFPg84lXKGP/4YbAdCBHHEhm0pooKh5hXkBeEqTclYOwFTjYXQJ8aojK
 yWcQ2hquqXWB+xbYrWsgiRNxSwz6fS2QNDrDLde0ngqnC7u1Cho71iJiOtu4PYgABuXR
 KxMdXQb/GHhrDma9kp5sAd1QrqxIy7xE2oTDOA6n75VSJjAFx17Kvr+6U0Z1uP0uJ99R
 AtVQ==
X-Gm-Message-State: AOAM533nFYunXCLErks/ud4ao6efmN8bYQ/FTZ9RtvWyKQk4jnIPRhLm
 ZiaQ6WwCprf+pPvw13xBMBwaX2DHix3TKRgu79c=
X-Google-Smtp-Source: ABdhPJwNPEB5drum/0sCovBhc4pXK0FsAFtk8mgvPaStQbzG1cdaf29xvwOtKdyKDt8CPcQhTwzzoIahBimIAkuTPb0=
X-Received: by 2002:ac8:6911:: with SMTP id e17mr3338284qtr.135.1621321972505; 
 Tue, 18 May 2021 00:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210513165627.1767093-1-j.neuschaefer@gmx.net>
In-Reply-To: <20210513165627.1767093-1-j.neuschaefer@gmx.net>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 18 May 2021 07:12:40 +0000
Message-ID: <CACPK8XdVNfjbs+KmhT8g899d74t7M8b6iBuGC_3=DEBy+A_VHg@mail.gmail.com>
Subject: Re: [PATCH] ARM: npcm: wpcm450: select interrupt controller driver
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Russell King <linux@armlinux.org.uk>, Tali Perry <tali.perry1@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 13 May 2021 at 16:57, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.n=
et> wrote:
>
> The interrupt controller driver is necessary in order to have a
> functioning Linux system on WPCM450. Select it in mach-npcm/Kconfig.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Fixes: ece3fe93e8f4 ("ARM: npcm: Introduce Nuvoton WPCM450 SoC")
Reviewed-by: Joel Stanley <joel@jms.id.au>

I will send this to the soc maintainers to apply as a fix.

Thanks!

Joel

> ---
>  arch/arm/mach-npcm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
> index 658c8efb4ca14..a71cf1d189ae5 100644
> --- a/arch/arm/mach-npcm/Kconfig
> +++ b/arch/arm/mach-npcm/Kconfig
> @@ -10,6 +10,7 @@ config ARCH_WPCM450
>         bool "Support for WPCM450 BMC (Hermon)"
>         depends on ARCH_MULTI_V5
>         select CPU_ARM926T
> +       select WPCM450_AIC
>         select NPCM7XX_TIMER
>         help
>           General support for WPCM450 BMC (Hermon).
> --
> 2.30.2
>
