Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B4C1CDCFD
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 16:22:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LNRk2K9MzDqNw
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 00:22:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::242;
 helo=mail-lj1-x242.google.com; envelope-from=tali.perry1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=B11Pm6i3; dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LJZT3b97zDqg5
 for <openbmc@lists.ozlabs.org>; Mon, 11 May 2020 21:27:42 +1000 (AEST)
Received: by mail-lj1-x242.google.com with SMTP id j3so9028105ljg.8
 for <openbmc@lists.ozlabs.org>; Mon, 11 May 2020 04:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vaB9hU9OmyfFXTQp3Ro8TCS0oJ1JBGJMlLHsQD/icQs=;
 b=B11Pm6i378UfISHZsNk0nzMTp1ytpuFElTXChP5p5rfSBHgFXSvuIWdO9AuSII/v4L
 JoXj8tmU64Sov4ttXUk+utPGxHIq+UsAHzKdC+xfO2pyjaQgU0B8FNCNM1tEE5a6a+Bb
 lVLbbKB5+Drtgyu+Cx6j2yuv4R6xL3Vx83M/2VTvQGYK5L9CGr8jRyKNLN/TGYcESVrg
 fPnZvzpHrNC2Ub7OaStzqBPbwrPL5nuRFb5OH615K8cpdmSNBoRfCYqnn1LNnamAJLVa
 ymOntHstg1G1B2aaxiJSR7DHWzSbohQ93hZO8PTB8Ync9/qLg3Qkf7TZJn0VuMhti5DF
 Dd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vaB9hU9OmyfFXTQp3Ro8TCS0oJ1JBGJMlLHsQD/icQs=;
 b=j3QhTWm4AQj0dIGLRD5Rr3FoRX5HREz/ckws/gHTEkGZioMTqFCBVFEng7qrV0bV9S
 n8h4q8OpxhoL9/dI+fT+HzBCZ8uGbzJ9Bi+FG4P6os05f/NGrJW3gUKzx9f8SGJP9kFi
 fU0dcnFEUXgDL3AFJBANAyzQL5MH/Wkq6XNUqY2TOstzZ4NI/DDk1jZyhXV7icXa31YC
 5VKMEEoa65E/NrFe/WWw3r7iVLVSm02iyeWR7dvXpX6nI44kfdRFbNM/Gd2e6Awo24Fw
 EeYsmxSApFblcXRLEZ+22c9qFyy7TxEqqYnKyoiwmupJqHUKORhd4wPp4N9Ra/jwO11c
 +esg==
X-Gm-Message-State: AOAM531sXFWTzHsS+94y0ObWuM3kWNVNMSnpV2Pu6cNk1A6DuyeoXhmS
 lsOgzL5j+QqOUY5R3SSIpygtDaACCX/FTjqb9lk=
X-Google-Smtp-Source: ABdhPJxjS7B69iERkJXybN1FRa7Oxd7PZfUVSfeSeQJxEpGjVNnxZ1aHys/mj0Ck3Q4insH6zi+f+AQGU7gf0xFawuI=
X-Received: by 2002:a2e:b6d3:: with SMTP id m19mr6903929ljo.43.1589196457920; 
 Mon, 11 May 2020 04:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200510102330.66715-1-tali.perry1@gmail.com>
 <20200510102330.66715-3-tali.perry1@gmail.com>
 <20200511091759.GE185537@smile.fi.intel.com>
In-Reply-To: <20200511091759.GE185537@smile.fi.intel.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Mon, 11 May 2020 14:28:50 +0300
Message-ID: <CAHb3i=tERsM+gwmQN1+vjnML9o5NxRK=uBokEUsd-Ljyje4s3A@mail.gmail.com>
Subject: Re: [PATCH v10 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 avifishman70@gmail.com, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Wolfram Sang <wsa@the-dreams.de>,
 Brendan Higgins <brendanhiggins@google.com>, ofery@google.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kfting@nuvoton.com,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 11, 2020 at 12:18 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, May 10, 2020 at 01:23:29PM +0300, Tali Perry wrote:
> > Add Nuvoton NPCM BMC I2C controller driver.
>
> Some cosmetic changes needs to be done.
>

Thanks for the review and the comments.
Will fix all, have a few questions (below)

> ...
>
> > +/*
> > + * Nuvoton NPCM7xx I2C Controller driver
> > + *
> > + * Copyright (C) 2020 Nuvoton Technologies tali.perry@nuvoton.com
> > + */
>
> So, entire file has C99 comment style, but this and few other places.
> Any reason of inconsistency?
>
> ...
>
> > +#if IS_ENABLED(CONFIG_DEBUG_FS)
>
> Why?

We wanted to add an optional feature to track i2c slave status.
the NPCM has 16 channels handling multiple devices each. Some of the devices
are polled periodically, and might power down.
The user wanted to implement a health monitoring option
to occasionally check the status of the buses (how many timeouts, recovery etc.)
This feature is optional and depends on CONFIG_DEBUG_FS The counters are exposed
to user through the file system.

....

> ...
>
> > +#define I2C_NUM_OF_ADDR 10
>
> Is it 10-bit address support or what?
>

No, the NPCM has an option to respond to multiple slave addresses
(10 own slave addresses)



...

> > +     // Repeat the following sequence until SDA is released
> > +     do {
> > +             // Issue a single SCL toggle
> > +             iowrite8(NPCM_I2CCST_TGSCL, bus->reg + NPCM_I2CCST);
> > +             udelay(20);
> > +             // If SDA line is inactive (high), stop
> > +             if (npcm_i2c_get_SDA(_adap)) {
> > +                     done = true;
> > +                     status = 0;
> > +             }
> > +     } while (!done && iter--);
>
> readx_poll_timeout() ?

Not exactly, readx_poll_timeout includes only a read operation, here there is a
write in the middle. (iowrite8)


>
> ...
>


...


Thanks!
Tali Perry
Nuvoton Technologies
