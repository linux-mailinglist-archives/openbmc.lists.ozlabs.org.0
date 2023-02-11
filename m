Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAEC692FC7
	for <lists+openbmc@lfdr.de>; Sat, 11 Feb 2023 10:33:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PDQQf06YDz3f7j
	for <lists+openbmc@lfdr.de>; Sat, 11 Feb 2023 20:33:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.174; helo=mail-qt1-f174.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PDQQ94Ldvz3cLh
	for <openbmc@lists.ozlabs.org>; Sat, 11 Feb 2023 20:33:19 +1100 (AEDT)
Received: by mail-qt1-f174.google.com with SMTP id m12so8547731qth.4
        for <openbmc@lists.ozlabs.org>; Sat, 11 Feb 2023 01:33:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKCok/saWtwpL+hGwHFuOC72IH0WDl/d7SJf3JAfucA=;
        b=hfRtSb2Af0ppCXvySZveiQwhpXJp5XtAf4+fBefhdQlYWvFNLTGYlw3nneEif2m0ab
         57PKAMwQTUXweh9i2yr7DtM/v4klOhE6TOdI9HFj0DmlQi8IOOTki6LgwWvfIg9PFjBi
         sIM15ovtBiZZHTVwdN6u7zysPlyGUVKsDi1pXlDM4V+gKqpLrRjU8bfErVvvTqWZ135P
         KDy15LXMzNPfwCHHzQUoR5VByPFKQyZ4S26jAfeifd5otrMGLyROTt9ep1x1NMf79AfA
         WRH91IccR4vjjbfboccUGy+KtVsIiOSBBZXkhh/ELdD4Rx9ywL/h2KZpfiAEwEg7RRJL
         L8hQ==
X-Gm-Message-State: AO0yUKXHxVHzYciu67cMR3+BjSmFZchhf0jbYwL/OFzWSFSY+qkpkTs5
	c2v6yxQ19xAwK0//LuxeozwgIWWBmRGfIQ==
X-Google-Smtp-Source: AK7set/YWwXOysjj3yNBQ0K9QiFrSvsC6LJ/ZYXANowIsYr9+9FqJjzF7U7bwS1EtMlfecrf7ZJ/Og==
X-Received: by 2002:ac8:5a54:0:b0:3ba:1acd:4f8 with SMTP id o20-20020ac85a54000000b003ba1acd04f8mr32319729qta.42.1676107997399;
        Sat, 11 Feb 2023 01:33:17 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id c18-20020a05622a025200b003b85ed59fa2sm5162096qtx.50.2023.02.11.01.33.16
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Feb 2023 01:33:17 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-520dad0a7d2so100320847b3.5
        for <openbmc@lists.ozlabs.org>; Sat, 11 Feb 2023 01:33:16 -0800 (PST)
X-Received: by 2002:a81:6ad7:0:b0:52e:ea5b:f6cb with SMTP id
 f206-20020a816ad7000000b0052eea5bf6cbmr146235ywc.237.1676107996575; Sat, 11
 Feb 2023 01:33:16 -0800 (PST)
MIME-Version: 1.0
References: <20221103213420.1395507-1-j.neuschaefer@gmx.net>
 <CAMuHMdWo5vHCeE6BeSHrUy12uT7_wFhW-VbQmQ5u+4Q8c7-wYQ@mail.gmail.com> <Y+bpODkxY3FlCjPg@probook>
In-Reply-To: <Y+bpODkxY3FlCjPg@probook>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 11 Feb 2023 10:33:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVzbSvA=1fm1ArwsN0=vU4-Ke_J7=s=N0i9jc69=Xa0qg@mail.gmail.com>
Message-ID: <CAMuHMdVzbSvA=1fm1ArwsN0=vU4-Ke_J7=s=N0i9jc69=Xa0qg@mail.gmail.com>
Subject: Re: [PATCH v6] soc: nuvoton: Add SoC info driver for WPCM450
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
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, Paul Menzel <pmenzel@molgen.mpg.de>, Brian Norris <briannorris@chromium.org>, Tomer Maimon <tmaimon77@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@svenpeter.dev>, openbmc@lists.ozlabs.org, Hector Martin <marcan@marcan.st>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Joel Stanley <joel@jms.id.au>, Robert Jarzmik <robert.jarzmik@free.fr>, Linus Walleij <linus.walleij@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jonathan,

On Sat, Feb 11, 2023 at 2:03 AM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
> On Fri, Feb 10, 2023 at 11:26:28AM +0100, Geert Uytterhoeven wrote:
> > On Thu, Nov 3, 2022 at 10:37 PM Jonathan Neusch=C3=A4fer
> > <j.neuschaefer@gmx.net> wrote:
> > > Add a SoC information driver for Nuvoton WPCM450 SoCs. It provides
> > > information such as the SoC revision.
> > >
> > > Usage example:
> > >
> > >   # grep . /sys/devices/soc0/*
> > >   /sys/devices/soc0/family:Nuvoton NPCM
> > >   /sys/devices/soc0/revision:A3
> > >   /sys/devices/soc0/soc_id:WPCM450
> > >
> > > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > > Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
> > > ---
> > > v6:
> > > - Select REGMAP
> > > - Rearrange Kconfig structure a bit
> >
> > Thanks for your patch!
> >
> > Unfortunately Joel seems to have sent v5 to Arnd instead of v6?
> > https://lore.kernel.org/all/20230201051717.1005938-1-joel@jms.id.au
> >
> > Which is now commit 7dbb4a38bff34493 ("soc:
> > nuvoton: Add SoC info driver for WPCM450") in soc/for-next...
> >
> > > --- /dev/null
> > > +++ b/drivers/soc/nuvoton/Kconfig
> > > @@ -0,0 +1,17 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +menu "Nuvoton SoC drivers"
> > > +       depends on ARCH_NPCM || COMPILE_TEST
> >
> > ... and lacks the above dependency, hence appearing on my radar.
> >
> > > +
> > > +config WPCM450_SOC
> > > +       tristate "Nuvoton WPCM450 SoC driver"
> > > +       default y if ARCH_WPCM450
> > > +       select SOC_BUS
> > > +       select REGMAP
> > > +       help
> > > +         Say Y here to compile the SoC information driver for Nuvoto=
n
> > > +         WPCM450 SoCs.
> > > +
> > > +         This driver provides information such as the SoC model and
> > > +         revision.
> > > +
> > > +endmenu
> >
> > Do you plan to send a follow-up patch?
>
> Yes, hopefully I'll get around to it a few days after rc1, when the dust
> of the (upcoming) merge window has settled a bit.
>
> Or should I rather send it earlier?

I'd say sooner rather than later.
If I hadn't found your v6, I would have sent a patch myself to add the
dependency.

Does the "select REGMAP" fix a build issue? If yes, that's a very good
reason to send it now...

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
