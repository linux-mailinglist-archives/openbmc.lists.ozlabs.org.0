Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFDA510B72
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 23:39:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnwHp4BMjz3bdW
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 07:39:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.50; helo=mail-oa1-f50.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnwHS4y4Bz2yyM
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 07:38:42 +1000 (AEST)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so26871fac.7
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 14:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zhyNtTRWKpgiVoHNVp/CiGMxHi3Y9XR1OWQf9/EqURQ=;
 b=NEesI/N16KI8p17oeVSo8mzmyF+3LpoXYNvOnW4P5+uY218rEuPma6m2f3wsaGniOe
 uDmXxYA7y0Lu0hd7X5iYzZQh16hy1X/HZfMy+w2JpjjeJdL03mPUhWzZElIEJ3AqBJwK
 JTNUM6rAhTxxUtUf1KDriLg/pxhvyrvoj7uwep0waQevLPAEJ9w5cTLZQFrovnBX6BC4
 KTtQ5K42aA1ENtnaMomQvk9bmLHC/ZUeL1mi87hKA2QSHOLshvZa0FqO7q7ClUUm9brK
 wzn5dIuYZ1mKLpxVuso0inTImvrq88O4JofTK+wFZpdo4jXpY/ccPHbdj9yHVf1qyKdW
 I/lg==
X-Gm-Message-State: AOAM53003OxhTQEE18TzCiIgbq9J8CBihxgDsuOlBrWBc8oJKoftnrPT
 YzQ6+ep4Sw+Wa4Hq88KO7g==
X-Google-Smtp-Source: ABdhPJydqYRqWI0cp4kXY25TEM4qbC2jQJOu+ISl9HwJMZmr7tsR1Tjj0vCRAPwtiK15Bcd2ft593Q==
X-Received: by 2002:a05:6870:d210:b0:e2:c10b:a7b with SMTP id
 g16-20020a056870d21000b000e2c10b0a7bmr10187521oac.181.1651009119901; 
 Tue, 26 Apr 2022 14:38:39 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y22-20020a056870389600b000e93d386d97sm1252404oan.31.2022.04.26.14.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 14:38:39 -0700 (PDT)
Received: (nullmailer pid 2577401 invoked by uid 1000);
 Tue, 26 Apr 2022 21:38:38 -0000
Date: Tue, 26 Apr 2022 16:38:38 -0500
From: Rob Herring <robh@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 04/11] clocksource/drivers: Add HPE GXP timer
Message-ID: <YmhmXl5IWHmKzAyG@robh.at.kernel.org>
References: <20220421192132.109954-1-nick.hawkins@hpe.com>
 <20220421192132.109954-5-nick.hawkins@hpe.com>
 <CAK8P3a0nQ1BrtfBJ7sUSaLkA=pbVwx83bEUpZczvLOSOHDR=dw@mail.gmail.com>
 <CACRpkdbJ1N7VOgoBzGS+cOaErFcYiOVDeWRmhPyHA7=9W0CGhA@mail.gmail.com>
 <CAK8P3a2ie8kFYstCYr6FO6+yFw7VxyJjWYyy9b+rUHu_u0YXPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2ie8kFYstCYr6FO6+yFw7VxyJjWYyy9b+rUHu_u0YXPg@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Verdun,
 Jean-Marie" <verdun@hpe.com>, Joel Stanley <joel@jms.id.au>, "Hawkins,
 Nick" <nick.hawkins@hpe.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Apr 26, 2022 at 08:00:20AM +0200, Arnd Bergmann wrote:
> On Mon, Apr 25, 2022 at 10:38 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Fri, Apr 22, 2022 at 3:16 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Thu, Apr 21, 2022 at 9:21 PM <nick.hawkins@hpe.com> wrote:
> > >
> > > > +
> > > > +static struct platform_device gxp_watchdog_device = {
> > > > +       .name = "gxp-wdt",
> > > > +       .id = -1,
> > > > +};
> > > > +/*
> > > > + * This probe gets called after the timer is already up and running. This will create
> > > > + * the watchdog device as a child since the registers are shared.
> > > > + */
> > > > +
> > > > +static int gxp_timer_probe(struct platform_device *pdev)
> > > > +{
> > > > +       struct device *dev = &pdev->dev;
> > > > +
> > > > +       /* Pass the base address (counter) as platform data and nothing else */
> > > > +       gxp_watchdog_device.dev.platform_data = local_gxp_timer->counter;
> > > > +       gxp_watchdog_device.dev.parent = dev;
> > > > +       return platform_device_register(&gxp_watchdog_device);
> > > > +}
> > >
> > > I don't understand what this is about: the device should be created from
> > > DT, not defined statically in the code. There are multiple ways of creating
> > > a platform_device from a DT node, or you can allocate one here, but static
> > > definitions are generally a mistake.
> > >
> > > I see that you copied this from the ixp4xx driver, so I think we should fix this
> > > there as well.
> >
> > The ixp4xx driver looks like that because the register range used for
> > the timer and the watchdog is combined, i.e. it is a single IP block:
> >
> >                 timer@c8005000 {
> >                         compatible = "intel,ixp4xx-timer";
> >                         reg = <0xc8005000 0x100>;
> >                         interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
> >                 };
> >
> > Device tree probing does not allow two devices to probe from the same
> > DT node, so this was solved by letting the (less important) watchdog
> > be spawn as a platform device from the timer.
> >
> > I don't know if double-probing for the same register range can be fixed,
> > but I was assuming that the one-compatible-to-one-driver assumption
> > was pretty hard-coded into the abstractions. Maybe it isn't?
> 
> Having a child device is fine, my objection was about the way
> the device is created from a 'static platform_device ...' definition
> rather than having the device structure allocated at probe time.
> 
> > Another way is of course to introduce an MFD. That becomes
> > problematic in another way: MFD abstractions are supposed to
> > be inbetween the resource and the devices it spawns, and with
> > timers/clocksources this creates a horrible special-casing since the
> > MFD bus (the parent may be providing e.g. an MMIO regmap)
> > then need to be early-populated and searched by the timer core
> > from TIMER_OF_DECLARE() early in boot.
> >
> > So this solution was the lesser evil that I could think about.
> 
> There are multiple ways of doing this that we already discussed
> in the thread. The easiest is probably to have a child node without
> custom registers in the DT and then use the DT helpers to
> populate the linux devices with the correct data.

I think that's what the wdt binding is doing, but I don't like that. 
Maybe it's not a child node, I can't tell.

Bindings should not be decided on the *current* driver split on one 
particular OS. This looks like 1 block, so 1 node. If that doesn't work 
well or easy for Linux, then we should fix Linux.

Rob
