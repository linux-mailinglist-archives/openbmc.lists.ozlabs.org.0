Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E9C490210
	for <lists+openbmc@lfdr.de>; Mon, 17 Jan 2022 07:39:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jcj1X1r8zz2x9b
	for <lists+openbmc@lfdr.de>; Mon, 17 Jan 2022 17:39:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=XUOQMXTU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=XUOQMXTU; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jcj156qzDz2x9Z;
 Mon, 17 Jan 2022 17:39:03 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id 14so10883573qty.2;
 Sun, 16 Jan 2022 22:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SCIluCFzTxQ0TtrLY6TuEHxf2MUxrzhJh6COmbq3iWU=;
 b=XUOQMXTUtcTfOf9BsQpiygXXKiUZc56gNZVtQH+/NF1tVv/BkUFzyjB3SIKUb+dbuQ
 KPrNrebmoNr4hVysDx284sWPjG7Zfyf2h6Dl9k1ORBcfkqgytMJtXBVGLGS9F62Ua+3U
 Q+JTzHzydRtLOW7WPYw8iKLVlXLfYM2fUPRfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SCIluCFzTxQ0TtrLY6TuEHxf2MUxrzhJh6COmbq3iWU=;
 b=rr+NOJK5+32HEepj8cc4xFKX1PVEHhvZwEEVgzKiXRF/4nm4GAArZLG4h1FYmssvTp
 Z3gVT3ByxIq201GnuaNALcpFpMyhz/Py10xB4TWyxH7VcB2Z50Y9ABPdeP32GHJDK8s1
 0gWM/mO+OQpGzSSVVISGwozIj3JKiB7k7DXom5tR/NyluQzY9G4PRvMPdaeebEtENkuC
 FzFUa8qKJ8for1P3r8Mtt9MLiBaALVJAEByxOsTc0OqixuQd1Oz8tc/X74e3emTm4O4b
 JF6vVSUOAzpUwWDDWnRIWgd6uSe61Dqfj282S/o3IumfLpW+G4GLjX4Kt1IFj7uK8Zqz
 vUfg==
X-Gm-Message-State: AOAM532ukAe/lwfeERcmYM3arTobFstydQ9p9ZdZEJ1JnEr2Yh2d2eFt
 dI2nEC26sydaR+qllviqIgJT9P2xCrSLpQ09jEI=
X-Google-Smtp-Source: ABdhPJx3A0SkN3aZCX5+Oi0LolEDukEZHIZ692Qeofq4HDx8uEkmYcqjeqjrsjqSUuJ2WKtgmVX8UiT86lQy8L2WoxI=
X-Received: by 2002:a05:622a:1116:: with SMTP id
 e22mr7453887qty.58.1642401540369; 
 Sun, 16 Jan 2022 22:39:00 -0800 (PST)
MIME-Version: 1.0
References: <20220109132613.122912-1-guoheyi@linux.alibaba.com>
 <ad5e5438-4a3f-2447-4af3-7caa91e7252a@linux.alibaba.com>
 <CACPK8XcYp9iAD3fjBQCax41C-1UpA+1AQW3epyEooYzNLt7R5g@mail.gmail.com>
 <e62fba0b-ebb9-934a-d7cf-6da33ecc4335@linux.alibaba.com>
In-Reply-To: <e62fba0b-ebb9-934a-d7cf-6da33ecc4335@linux.alibaba.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Jan 2022 06:38:48 +0000
Message-ID: <CACPK8Xc+v132vM-ytdAUFhywFXGpPF+uPSBWi68ROf_PLD4VQQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/i2c-aspeed: avoid invalid memory reference after
 timeout
To: Heyi Guo <guoheyi@linux.alibaba.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 14 Jan 2022 at 14:01, Heyi Guo <guoheyi@linux.alibaba.com> wrote:
>
> Hi Joel,
>
>
> =E5=9C=A8 2022/1/11 =E4=B8=8B=E5=8D=886:51, Joel Stanley =E5=86=99=E9=81=
=93:
> > On Tue, 11 Jan 2022 at 07:52, Heyi Guo <guoheyi@linux.alibaba.com> wrot=
e:
> >> Hi all,
> >>
> >> Any comments?
> >>
> >> Thanks,
> >>
> >> Heyi
> >>
> >> =E5=9C=A8 2022/1/9 =E4=B8=8B=E5=8D=889:26, Heyi Guo =E5=86=99=E9=81=93=
:
> >>> The memory will be freed by the caller if transfer timeout occurs,
> >>> then it would trigger kernel panic if the peer device responds with
> >>> something after timeout and triggers the interrupt handler of aspeed
> >>> i2c driver.
> >>>
> >>> Set the msgs pointer to NULL to avoid invalid memory reference after
> >>> timeout to fix this potential kernel panic.
> > Thanks for the patch. How did you discover this issue? Do you have a
> > test I can run to reproduce the crash?
>
> We are using one i2c channel to communicate with another MCU by
> implementing user space SSIF protocol, and the MCU may not respond in
> time if it is busy. If it responds after timeout occurs, it will trigger
> below kernel panic:
>

Thanks for the details. It looks like you've done some testing of
this, which is good.

> After applying this patch, we'll get below warning instead:
>
> "bus in unknown state. irq_status: 0x%x\n"

Given we get to here in the irq handler, we've done these two tests:

 - aspeed_i2c_is_irq_error()
 - the state is not INACTIVE or PENDING

but there's no buffer ready for us to use. So what has triggered the
IRQ in this case? Do you have a record of the irq status bits?

I am wondering if the driver should know that the transaction has
timed out, instead of detecting this unknown state.


> > Can you provide a Fixes tag?
>
> I think the bug was introduced by the first commit of this file :(
>
> f327c686d3ba44eda79a2d9e02a6a242e0b75787
>
>
> >
> > Do other i2c master drivers do this? I took a quick look at the meson
> > driver and it doesn't appear to clear it's pointer to msgs.
>
> It is hard to say. It seems other drivers have some recover scheme like
> aborting the transfer, or loop each messages in process context and
> don't do much in IRQ handler, which may disable interrupts or not retain
> the buffer pointer before returning timeout.

I think your change is okay to go in as it fixes the crash, but first
I want to work out if there's some missing handling of a timeout
condition that we should add as well.


>
> Thanks,
>
> Heyi
>
>
> >
> >>> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
> >>>
> >>> -------
> >>>
> >>> Cc: Brendan Higgins <brendanhiggins@google.com>
> >>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> >>> Cc: Joel Stanley <joel@jms.id.au>
> >>> Cc: Andrew Jeffery <andrew@aj.id.au>
> >>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> >>> Cc: linux-i2c@vger.kernel.org
> >>> Cc: openbmc@lists.ozlabs.org
> >>> Cc: linux-arm-kernel@lists.infradead.org
> >>> Cc: linux-aspeed@lists.ozlabs.org
> >>> ---
> >>>    drivers/i2c/busses/i2c-aspeed.c | 5 +++++
> >>>    1 file changed, 5 insertions(+)
> >>>
> >>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c=
-aspeed.c
> >>> index 67e8b97c0c950..3ab0396168680 100644
> >>> --- a/drivers/i2c/busses/i2c-aspeed.c
> >>> +++ b/drivers/i2c/busses/i2c-aspeed.c
> >>> @@ -708,6 +708,11 @@ static int aspeed_i2c_master_xfer(struct i2c_ada=
pter *adap,
> >>>                spin_lock_irqsave(&bus->lock, flags);
> >>>                if (bus->master_state =3D=3D ASPEED_I2C_MASTER_PENDING=
)
> >>>                        bus->master_state =3D ASPEED_I2C_MASTER_INACTI=
VE;
> >>> +             /*
> >>> +              * All the buffers may be freed after returning to call=
er, so
> >>> +              * set msgs to NULL to avoid memory reference after fre=
eing.
> >>> +              */
> >>> +             bus->msgs =3D NULL;
> >>>                spin_unlock_irqrestore(&bus->lock, flags);
> >>>
> >>>                return -ETIMEDOUT;
