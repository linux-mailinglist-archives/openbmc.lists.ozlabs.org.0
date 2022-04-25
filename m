Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B18A650EAB3
	for <lists+openbmc@lfdr.de>; Mon, 25 Apr 2022 22:38:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnH0l4j99z3bfH
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 06:38:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pI5SEWzs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::112b;
 helo=mail-yw1-x112b.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pI5SEWzs; dkim-atps=neutral
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnH0K4mkgz2xBF
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 06:38:23 +1000 (AEST)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2f7d621d1caso50350447b3.11
 for <openbmc@lists.ozlabs.org>; Mon, 25 Apr 2022 13:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EKOHrVYni9xvs7+L4Ks12r0VkZa5fal1q0hxrC8iDII=;
 b=pI5SEWzs2KSeo7OJ9BaxRVNP6bzCJc0A52cY3RfMiztkV4JnDSd8lOMVKL+/QxdhgW
 VQZ9Ur7YmuEVpRX2Qr9v5aoG6SzgNBVEpyquqONdmSZeK0bapSmJhDaeHxg/58e9Xyre
 949ELWpDNA1uFOf3EVrO+2AZcb/7+stGJkRZWvVkHyiw8EJJv4PWhZvchdZUh4lxwxsT
 xz6j6jQwiXki8wfOWBuPDst5Mp2p6NTKC9jNSSMKBBiIBjeZNAzM7f5OQ0HrbMW3RdSV
 gr8L5rDU+mceJ9rUgYT46TYSTJr1LPcCc2FFf9vNdlGvE/t7kYZI0QvCANVEia6AvJB5
 4b9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EKOHrVYni9xvs7+L4Ks12r0VkZa5fal1q0hxrC8iDII=;
 b=s2yeG8IR9nut1hLxV95qrgKi+SgKanX6Ffsei5VglpZ8k8TjQ8GWFmLzQkS4r8Sl7O
 hFNtSLNv+Pq9Jw3FNgO64WqhjuFGQ/IGqSFhk+D3jGv4G3kwRneU9esU6ITOq4tg52hf
 lMiWIG7LbTrRwH6Fm0key3YtpL3nCurrEY7RJHazdF9laHFF/Xj9A4tsTSduPteHtOV3
 Hgb7HWqjUjBCXIezzY7MOBs9T3RETqdfNn2BUWKbhCU0RxmXv4x6rO6sHRCAk5mwtVg5
 SW2pXYdY1ZmpTzwm/sZSk9SKNV4vKqvTFzDBPzupoB+H+mH25boHRKSeQX9OrEOUT41m
 ZOmQ==
X-Gm-Message-State: AOAM533N6LCukJsnrRTucSIpxVJTvUukXWynE9gRbVb7vc/1y7bCHMsn
 Iseh/pTQnPN4NTeReEab03/7/6LlUcu146hxZThhlg==
X-Google-Smtp-Source: ABdhPJx0cRFmnkcRXSnlvAH/s+i67gX4XqlpKmn/ICwjou3ZKFFzhb03fJf+2j/zJFPnDYmeW16iPtutIvSdQow5dNg=
X-Received: by 2002:a81:2108:0:b0:2f5:6938:b2b8 with SMTP id
 h8-20020a812108000000b002f56938b2b8mr17509528ywh.151.1650919099262; Mon, 25
 Apr 2022 13:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220421192132.109954-1-nick.hawkins@hpe.com>
 <20220421192132.109954-5-nick.hawkins@hpe.com>
 <CAK8P3a0nQ1BrtfBJ7sUSaLkA=pbVwx83bEUpZczvLOSOHDR=dw@mail.gmail.com>
In-Reply-To: <CAK8P3a0nQ1BrtfBJ7sUSaLkA=pbVwx83bEUpZczvLOSOHDR=dw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Apr 2022 22:38:08 +0200
Message-ID: <CACRpkdbJ1N7VOgoBzGS+cOaErFcYiOVDeWRmhPyHA7=9W0CGhA@mail.gmail.com>
Subject: Re: [PATCH v5 04/11] clocksource/drivers: Add HPE GXP timer
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: "Verdun, Jean-Marie" <verdun@hpe.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joel Stanley <joel@jms.id.au>, "Hawkins, Nick" <nick.hawkins@hpe.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 22, 2022 at 3:16 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Thu, Apr 21, 2022 at 9:21 PM <nick.hawkins@hpe.com> wrote:
>
> > +
> > +static struct platform_device gxp_watchdog_device = {
> > +       .name = "gxp-wdt",
> > +       .id = -1,
> > +};
> > +/*
> > + * This probe gets called after the timer is already up and running. This will create
> > + * the watchdog device as a child since the registers are shared.
> > + */
> > +
> > +static int gxp_timer_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +
> > +       /* Pass the base address (counter) as platform data and nothing else */
> > +       gxp_watchdog_device.dev.platform_data = local_gxp_timer->counter;
> > +       gxp_watchdog_device.dev.parent = dev;
> > +       return platform_device_register(&gxp_watchdog_device);
> > +}
>
> I don't understand what this is about: the device should be created from
> DT, not defined statically in the code. There are multiple ways of creating
> a platform_device from a DT node, or you can allocate one here, but static
> definitions are generally a mistake.
>
> I see that you copied this from the ixp4xx driver, so I think we should fix this
> there as well.

The ixp4xx driver looks like that because the register range used for
the timer and the watchdog is combined, i.e. it is a single IP block:

                timer@c8005000 {
                        compatible = "intel,ixp4xx-timer";
                        reg = <0xc8005000 0x100>;
                        interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
                };

Device tree probing does not allow two devices to probe from the same
DT node, so this was solved by letting the (less important) watchdog
be spawn as a platform device from the timer.

I don't know if double-probing for the same register range can be fixed,
but I was assuming that the one-compatible-to-one-driver assumption
was pretty hard-coded into the abstractions. Maybe it isn't?

Another way is of course to introduce an MFD. That becomes
problematic in another way: MFD abstractions are supposed to
be inbetween the resource and the devices it spawns, and with
timers/clocksources this creates a horrible special-casing since the
MFD bus (the parent may be providing e.g. an MMIO regmap)
then need to be early-populated and searched by the timer core
from TIMER_OF_DECLARE() early in boot.

So this solution was the lesser evil that I could think about.

Yours,
Linus Walleij
