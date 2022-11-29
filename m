Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 435DE63C718
	for <lists+openbmc@lfdr.de>; Tue, 29 Nov 2022 19:21:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NM9dN5BNkz3bTG
	for <lists+openbmc@lfdr.de>; Wed, 30 Nov 2022 05:21:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OvSUf9YB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OvSUf9YB;
	dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NM9ck06BXz2xkD
	for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2022 05:20:37 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id x6so4075953lji.10
        for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2022 10:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/YZ7W5csugr2Bn2cmkIdVJsBOw6MIoUlHR9lQ0xQ/SY=;
        b=OvSUf9YBmoDRrSHmB124lWfahqmaY1njCYYb2eihFX0En5UGFQYn64HZ4sBdTcYbXu
         sOOaaaUawNNIFXiFXLfq6I9eIxI1InitPZwdgGmPZpWgH571V37LRemZXGRTZTqGu0eA
         rF0HcQunBKA+G8FI6oYxducRBJW9IjLWEQKcjE0mCbEYUaZTA5LRK/bekpcKXGA88R0W
         XhfrUsjZimBvT1STMYhEQBmuPwY5DgisuR0GfDWhx9OWGiAXxXlMAxXkjhODkjyWVpWq
         yLzkDLLadNYCULj1VBREpx85SVz+/i7a4Vu8SYKl1H+FucmqkZyb/N/S4LPE1O7lm/yi
         SaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/YZ7W5csugr2Bn2cmkIdVJsBOw6MIoUlHR9lQ0xQ/SY=;
        b=EPbayPaKSenIQov0sLuv1fnIVy8BftkWdVP45ywJSfqkdOSColWWqPZh1kzFjacMC9
         br2Bzq9Rgs/dE1X/ARhibNn90hzHcMXEF6eQkqgbE2VG1nOiXsUIuzpZsMeaKB7odHVh
         aD4fc1+5ESF99QmE6f81w4RXDzDA+lGdXzbU6mv6weBUvgzjoKSus2/GhkMdcN5Eja+t
         Sy+sgqmK7gA0mOkSrv0fRVznFgz1BXJmsZ0l6GYOX5EWFbwwuYOPpCb0K7oNUd/dOMo5
         XVn0oytw7Iz1hBc+j9G+zZBu8y+WcsE/BwIYGe5MWRZ8l1mKCqdv31DiLslbGKU/u+eU
         dMog==
X-Gm-Message-State: ANoB5pkGRWM/Ezrhh4kfeNiPKhrG34jDyWjauMwU3mGZ8OSSaiGR5aqz
	87BcoeLSrThLu6V6HLOPbkGeil8104iEmzwjCCU=
X-Google-Smtp-Source: AA0mqf7DCIO3YwlRaYKyAdZ9oWnkSwxHGeEMLFcAVt39H1gVH2FayKwGs6BnZJ+V9JZ2ihDpV58R/GtQNbpglv0rhSE=
X-Received: by 2002:a2e:a364:0:b0:279:6aeb:7f63 with SMTP id
 i4-20020a2ea364000000b002796aeb7f63mr12207408ljn.50.1669746027474; Tue, 29
 Nov 2022 10:20:27 -0800 (PST)
MIME-Version: 1.0
References: <20221122201232.107065-1-tmaimon77@gmail.com> <20221122201232.107065-3-tmaimon77@gmail.com>
 <577e273d-ff9b-4d8d-b797-d7275ab8374f@app.fastmail.com> <CAP6Zq1ikqtKOGUZX-VAdyhs+nsvy7ah4gqRrbXVA8Gp9L46hXQ@mail.gmail.com>
 <7f43febb-0a89-4313-9c85-a7a44c231b45@app.fastmail.com>
In-Reply-To: <7f43febb-0a89-4313-9c85-a7a44c231b45@app.fastmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 29 Nov 2022 20:20:16 +0200
Message-ID: <CAP6Zq1jR1ouDgRQ0=6RR7iCnkrY_X87SeiNAxt_y0+QsVXS=ZA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] soc: nuvoton: add NPCM LPC BPC driver
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
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>, benjaminfair@google.com, Sven Peter <sven@svenpeter.dev>, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, Hector Martin <marcan@marcan.st>, Nicolas Ferre <nicolas.ferre@microchip.com>, tali.perry1@gmail.com, "Conor.Dooley" <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Arnd,

Thanks for your comments

On Fri, 25 Nov 2022 at 12:25, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Nov 23, 2022, at 19:01, Tomer Maimon wrote:
> > On Wed, 23 Nov 2022 at 12:58, Arnd Bergmann <arnd@arndb.de> wrote:
> >>
> >> On Tue, Nov 22, 2022, at 21:12, Tomer Maimon wrote:
> >> > Add Nuvoton BMC NPCM LPC BIOS post code (BPC) driver.
> >> >
> >> > The NPCM BPC monitoring two configurable I/O address written by the host
> >> > on the Low Pin Count (LPC) bus.
> >> >
> >> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> >> > ---
> >> >  drivers/soc/Kconfig                |   1 +
> >> >  drivers/soc/Makefile               |   1 +
> >> >  drivers/soc/nuvoton/Kconfig        |  24 ++
> >> >  drivers/soc/nuvoton/Makefile       |   3 +
> >> >  drivers/soc/nuvoton/npcm-lpc-bpc.c | 396 +++++++++++++++++++++++++++++
> >>
> >> In general, I try to keep drivers/soc/ for drivers that are
> >> used purely inside of the kernel and don't provide their
> >> own user space ABI, those should normally be part of
> >> some subsystem grouped by functionality.
> >>
> >> It appears that we have similar drivers for aspeed already,
> >> so there is some precedent, but I would still like to ask
> >> you and Joel to try to make sure the two are compatible,
> >> or ideally share the code for the user-facing part of the
> >> LPC driver.
> > Nuvoton and Aspeed use the same user-facing code to manage the host snooping.
> > https://github.com/openbmc/phosphor-host-postd
>
> Ok, great!
>
> >> The implementation of npcm-lpc-bpc looks fine otherwise, I only
> >> noticed one minor detail that I would change:
> >>
> >> > +     np = pdev->dev.parent->of_node;
> >> > +     if (!of_device_is_compatible(np, "nuvoton,npcm750-lpc") &&
> >> > +         !of_device_is_compatible(np, "nuvoton,npcm845-lpc")) {
> >> > +             dev_err(dev, "unsupported LPC device binding\n");
> >> > +             return -ENODEV;
> >> > +     }
> >>
> >> This check doesn't seem to make sense here, since those are
> >> the only two types you support.
> > About the LPC, I like to double check with our architectures on it
> > because the BPC should working on eSPI as well.
> > Maybe I should remove the LPC part.
>
> The version you posted only has LPC support, not eSPI, so that
> wouldn't work. I'm not sure how eSPI is normally represented
> in device drivers, does that show up the same way as an LPC
> device, or do you need to register a separate spi_driver?
The eSPI is a successor to its Low Pin Count (LPC) and it will show up
in the same way as the LPC.
NPCM BPC can be connected to the CPU (host) through LPC or eSPI bus
and the NPCM BPC driver not is handling the LPC or the eSPI bus
therefore I should remove the LPC naming from the and only use BPC.
>
> If it's part of the same platform driver with different
> OF compatible strings, the normal way to handle this would
> be to use the .data field in the of_device_id to pass
> model specific information to other parts of the driver.
>
>      Arnd

Best regards,

Tomer
