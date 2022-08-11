Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1D158F76B
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 08:01:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3GQT05tWz3bXg
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 16:01:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=DLsnc/yz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=patrick.rudolph@9elements.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=DLsnc/yz;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3GQ23ttTz2xX6
	for <openbmc@lists.ozlabs.org>; Thu, 11 Aug 2022 16:00:56 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id p18so16123044plr.8
        for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2022 23:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=oew1O95k4QPrcixw5PJ+nl+3rlu9XvcO4hQ2xcPSjxU=;
        b=DLsnc/yzddkGdgHxPvIvqdgufRhqcavwBSup0NAN+MT5cantk23ZscAK118aIGJAas
         8hWWMlKgG3xJCu/laePDRdwuGJNuoKbdwyKmFqt7bk7Jnjtg6cA61fmq+vEn2Jn951bD
         k2S9c/ymUWbOw2xFEt65jQEj8VmjAzREe5orylzvXYrKiJI6WXfSJXfzky2S/GvSpSHz
         4a6FffXYp84l9q+GP6gFWpekVHp4CNK75SlqLk2fERT/R5s0u4d1ABxqnB0Jh1+y8fCa
         vUZ3yzQajWpHCEH4e9WLSYxa+43a6kjFNC/oiLnPxcplpsfr4RwxX03U1G1enTLadJ9U
         ExcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=oew1O95k4QPrcixw5PJ+nl+3rlu9XvcO4hQ2xcPSjxU=;
        b=WH4/GL4sp6HGocnh7hXIWHmJJPtga7Zaf8k2NPdvpciWDvxysvbiLJMGeRH9iNTjFw
         m3E5rXGfdDZFV/OgpPPc3X5lsNDDanKz9Fe4t0RYfWvTszu5+E1gmGhfRiOWJgnIaTA4
         ZNpBhQ95yb7Kami8ulgoK8TytHHjCDv+TUmlAKGmFYwxJS0u/DzjXm0V3TioKIP5pXnG
         XXFr/TBOMnDfpS2wrrFiaOjnFwQsRzm7ka7FIYcbgpDn5IBq2SDO/gnnBPkRThXTX5vR
         sOaVdx0PlxJQroF3itLMuPSn+d/Y/uQwLqXIhOZ56igAF4VHxJO2+Do/sRBMtDGkYfbB
         O4YQ==
X-Gm-Message-State: ACgBeo1G+IZFqbApeq16dD8cHcQSqrC3FPYOBlDNGZvGCYuT4rWqH41j
	lgEHEeLr2+DZZV8VHWY0XjW4IVHvzv7gyCtpBW+PbQ==
X-Google-Smtp-Source: AA6agR7IfXrvVgimjEtmdKzT+50PWP34JOsn/XwT9Gte3BG10z0XmS1nxJ5EafERW/3N66BugjFI0Huq2x/a0eG2sBo=
X-Received: by 2002:a17:902:744b:b0:16d:cef6:ffe8 with SMTP id
 e11-20020a170902744b00b0016dcef6ffe8mr30518116plt.163.1660197651880; Wed, 10
 Aug 2022 23:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220630110745.345705-1-patrick.rudolph@9elements.com>
 <20220630110745.345705-2-patrick.rudolph@9elements.com> <945f5419-3352-4be5-b8fa-5973138f37aa@www.fastmail.com>
In-Reply-To: <945f5419-3352-4be5-b8fa-5973138f37aa@www.fastmail.com>
From: Patrick Rudolph <patrick.rudolph@9elements.com>
Date: Thu, 11 Aug 2022 08:00:40 +0200
Message-ID: <CALNFmy2-b=V2BroMOgFWZ+++NknvtvQXetVQNaJtpAYW1+iOVA@mail.gmail.com>
Subject: Re: [RESEND][PATCH u-boot v2019.04-aspeed-openbmc v5 1/2] arm/dts:
 Add IBM Genesis3 board
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: christian.walter@9elements.com, openbmc@lists.ozlabs.org, takken@us.ibm.com, Joel Stanley <joel@jms.id.au>, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

There's no SD card slot, there are two MACs in RGMII mode and nothing
that's required to boot on i2c bus.
In the defconfig used I disabled SD card and I2C support, so this is
not an issue.
Should I still disable it in the devicetree, just for reference?

Regards,
Patrick Rudolph


On Wed, Aug 10, 2022 at 6:23 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Thu, 30 Jun 2022, at 20:37, Patrick Rudolph wrote:
> > Add devicetree source file. It uses the evb-ast2500 board files.
> >
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > Reviewed-by: Zev Weiss <zweiss@equinix.com>
> > ---
> >  arch/arm/dts/Makefile             |  1 +
> >  arch/arm/dts/ast2500-genesis3.dts | 28 ++++++++++++++++++++++++++++
> >  2 files changed, 29 insertions(+)
> >  create mode 100644 arch/arm/dts/ast2500-genesis3.dts
> >
> > diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> > index 3515100c65..ed9714d832 100755
> > --- a/arch/arm/dts/Makefile
> > +++ b/arch/arm/dts/Makefile
> > @@ -678,6 +678,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
> >       ast2400-evb.dtb \
> >       ast2400-ahe-50dc.dtb \
> >       ast2500-evb.dtb \
> > +     ast2500-genesis3.dtb \
> >       ast2600a0-evb.dtb \
> >       ast2600a1-evb.dtb \
> >       ast2600-bletchley.dtb \
> > diff --git a/arch/arm/dts/ast2500-genesis3.dts
> > b/arch/arm/dts/ast2500-genesis3.dts
> > new file mode 100644
> > index 0000000000..544758c5b8
> > --- /dev/null
> > +++ b/arch/arm/dts/ast2500-genesis3.dts
> > @@ -0,0 +1,28 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * IBM Genesis3
> > + *
> > + * Copyright (C) 2022 9elements GmbH
> > + */
> > +
> > +#include "ast2500-evb.dts"
> > +
> > +/ {
> > +     model = "IBM Genesis3";
> > +     compatible = "ibm,genesis3-bmc", "aspeed,ast2500";
> > +};
> > +
> > +&spi1 {
> > +     status = "disabled";
> > +};
> > +
> > +&fmc {
> > +     flash@0 {
> > +             compatible = "spansion,s25fl256l", "spi-flash";
> > +     };
> > +
> > +     flash@1 {
> > +             compatible = "spansion,s25fl256l", "spi-flash";
> > +     };
> > +};
>
> So looking at ast2500-evb.dts, you still have both the SD card slots,
> both MACs (in RGMII mode) and i2c{3,7} enabled. Is this intended?
>
> Andrew
