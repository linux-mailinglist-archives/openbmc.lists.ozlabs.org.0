Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A46A650F09E
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 08:06:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnWbS4QBtz3bbV
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 16:06:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 308 seconds by postgrey-1.36 at boromir;
 Tue, 26 Apr 2022 16:05:53 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnWb50YL7z2xmV
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 16:05:52 +1000 (AEST)
Received: from mail-wm1-f51.google.com ([209.85.128.51]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MLzSD-1nRQPv1r61-00Ht8W for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022
 08:00:38 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso820813wml.5
 for <openbmc@lists.ozlabs.org>; Mon, 25 Apr 2022 23:00:37 -0700 (PDT)
X-Gm-Message-State: AOAM533afRg8bSuo4COZYgdZIH03ElX44eEcQnEvs3P0E811uaPuOrQq
 ZT7lpirqF6mpzh9sioevowMFiXSx8Pxesb+OfTY=
X-Google-Smtp-Source: ABdhPJy3c5lcSeSluq1OFXX5XYB6LISDtFDlKiWa0Rg3d6M03Gmt+hhEqCW75iUtmXQ0VFTk/w8CPqLe8gy80hIGYlQ=
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr28016089wmc.94.1650952837280; Mon, 25
 Apr 2022 23:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220421192132.109954-1-nick.hawkins@hpe.com>
 <20220421192132.109954-5-nick.hawkins@hpe.com>
 <CAK8P3a0nQ1BrtfBJ7sUSaLkA=pbVwx83bEUpZczvLOSOHDR=dw@mail.gmail.com>
 <CACRpkdbJ1N7VOgoBzGS+cOaErFcYiOVDeWRmhPyHA7=9W0CGhA@mail.gmail.com>
In-Reply-To: <CACRpkdbJ1N7VOgoBzGS+cOaErFcYiOVDeWRmhPyHA7=9W0CGhA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 26 Apr 2022 08:00:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2ie8kFYstCYr6FO6+yFw7VxyJjWYyy9b+rUHu_u0YXPg@mail.gmail.com>
Message-ID: <CAK8P3a2ie8kFYstCYr6FO6+yFw7VxyJjWYyy9b+rUHu_u0YXPg@mail.gmail.com>
Subject: Re: [PATCH v5 04/11] clocksource/drivers: Add HPE GXP timer
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:0Xp2b+ydEZjipneBlHsBb/iwRFrpjaBxqKGqXQYnfDCrFM1Aeck
 bhYwdsxvZ9a7Ag9/ZmxzSKDBd1ENUUSkCAVP9FbgcJLjfrzh+Pk94HUbk3odrK1UMmS3RkU
 aI9yb2kcZdC/vxgYnorl56iY1WodrnzdsfJpfFtdN6u8wkksLDdl4E1v9o1ZVSNZXv4iC4P
 8x4llVYQzyoBEg7diYM7g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ll27IeIfWlo=:keMzcZrXM8omnwwV1rbwQt
 wimf1yhf4uEIJRe7AkwSSt6LxQMgvViWJFKgUDeS2FbD+RvWYmvy844+UEtX5JTNAbm6YADoL
 qt5yM7WjbEILK1Woetu62UtuVgDG7xBL5L+068vzXkVviJqcf56s13xNUhp7RtWPhgRJAAG8E
 lHgsdZqIWvjorM0Y7QPoT38c6djkhlEu5CSgusseHyPECa2qmDuCovfn0UFFV6tgJnhIKiykM
 XWiD6WldJq/OrGT6Rq2x286AfTwvZshVPEka0993ittAMYedYyjq3ceKzFVaRKugoWkko75S1
 IBt0Jf3xkaAoT3RJm7RljM23LLuC2ltkuXX7PrtXUGk9PFX1mjyf9fowmCE3baeGECTYuBikK
 6RJzX4HJHrEJ5kYnM76NTpBYGYpFlxdtQ18QY37jpgWx//pIf3H0mj/TH2CERa6G9Gk5zPnCR
 fnJ1Ohyw6YjkfCeztpLSYL1jVEBqMJUR0ERNrKudUmp2ZWzA+Z48b/i05alH6jY/9A23vqp9B
 eBsGSQIYKsuJT96EDCeyWsHz+44pI2zfox0TVjltCrjUCFHaZTYQn18BiMlHWbezj19hZu/gs
 VvC1LnvaUJd6De8L4LyOh9I5kEAKAZF7FAHMjT5dxl6rm7YPGiRm5xLh/sFY3D6oJE9pzdasU
 ZwKY6aLbTtiLq9egjBX2z+oBBOjOtwNQI+DqQgsUEuv2AtfVdIXDuIO7L4MQWhHhuAJM=
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
Cc: Arnd Bergmann <arnd@arndb.de>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joel Stanley <joel@jms.id.au>, "Hawkins, Nick" <nick.hawkins@hpe.com>,
 Thomas Gleixner <tglx@linutronix.de>, "Verdun, Jean-Marie" <verdun@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Apr 25, 2022 at 10:38 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Apr 22, 2022 at 3:16 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Thu, Apr 21, 2022 at 9:21 PM <nick.hawkins@hpe.com> wrote:
> >
> > > +
> > > +static struct platform_device gxp_watchdog_device = {
> > > +       .name = "gxp-wdt",
> > > +       .id = -1,
> > > +};
> > > +/*
> > > + * This probe gets called after the timer is already up and running. This will create
> > > + * the watchdog device as a child since the registers are shared.
> > > + */
> > > +
> > > +static int gxp_timer_probe(struct platform_device *pdev)
> > > +{
> > > +       struct device *dev = &pdev->dev;
> > > +
> > > +       /* Pass the base address (counter) as platform data and nothing else */
> > > +       gxp_watchdog_device.dev.platform_data = local_gxp_timer->counter;
> > > +       gxp_watchdog_device.dev.parent = dev;
> > > +       return platform_device_register(&gxp_watchdog_device);
> > > +}
> >
> > I don't understand what this is about: the device should be created from
> > DT, not defined statically in the code. There are multiple ways of creating
> > a platform_device from a DT node, or you can allocate one here, but static
> > definitions are generally a mistake.
> >
> > I see that you copied this from the ixp4xx driver, so I think we should fix this
> > there as well.
>
> The ixp4xx driver looks like that because the register range used for
> the timer and the watchdog is combined, i.e. it is a single IP block:
>
>                 timer@c8005000 {
>                         compatible = "intel,ixp4xx-timer";
>                         reg = <0xc8005000 0x100>;
>                         interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> Device tree probing does not allow two devices to probe from the same
> DT node, so this was solved by letting the (less important) watchdog
> be spawn as a platform device from the timer.
>
> I don't know if double-probing for the same register range can be fixed,
> but I was assuming that the one-compatible-to-one-driver assumption
> was pretty hard-coded into the abstractions. Maybe it isn't?

Having a child device is fine, my objection was about the way
the device is created from a 'static platform_device ...' definition
rather than having the device structure allocated at probe time.

> Another way is of course to introduce an MFD. That becomes
> problematic in another way: MFD abstractions are supposed to
> be inbetween the resource and the devices it spawns, and with
> timers/clocksources this creates a horrible special-casing since the
> MFD bus (the parent may be providing e.g. an MMIO regmap)
> then need to be early-populated and searched by the timer core
> from TIMER_OF_DECLARE() early in boot.
>
> So this solution was the lesser evil that I could think about.

There are multiple ways of doing this that we already discussed
in the thread. The easiest is probably to have a child node without
custom registers in the DT and then use the DT helpers to
populate the linux devices with the correct data.

       Arnd
