Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F3948ABB6
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 11:52:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JY6vm0tC0z30DX
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 21:52:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=iy8TwFF4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2d;
 helo=mail-qv1-xf2d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=iy8TwFF4; dkim-atps=neutral
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JY6vJ5vRxz2yfr;
 Tue, 11 Jan 2022 21:51:38 +1100 (AEDT)
Received: by mail-qv1-xf2d.google.com with SMTP id hu2so17896640qvb.8;
 Tue, 11 Jan 2022 02:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WW/ErXuM7aTThn8DyOtAxfHC+Lf/dAu6aF/ysr/kDtQ=;
 b=iy8TwFF44l+/tUgYTLhp7Cm+F03uo/wvxz6bjpch4q9ZrjF8KY4CTo4cH0pcLNIPQZ
 WgmTqDF14LmBZTQ/CK0AJ6CZrQ1V6VVJ+Gur0yR78DsI7OqeyG15uEZr+KwjW7w3ABhE
 151Tv7E2gmimx0dpdcSfYjPPuWUqmpfXDtEEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WW/ErXuM7aTThn8DyOtAxfHC+Lf/dAu6aF/ysr/kDtQ=;
 b=1B0CdidqAebv8SWar+vhZRO96v3a+ww0R/+idj6R5Ao4Fc1mJoUXOYpSxpqgU6aaLL
 HIyzyG9BB/GfH5+g19AvKpaL3ayMwAvtPfedeoenj9j8EuxfgiVrWAVdtyhpMBsUdqrB
 rV1BGgJI1DXN7CUfbGcyFEVLjbvtzKJXGYmZ2v5R0A59DQkOhrOJ6K2mORhnY1/KsruC
 KAb+k4pqmto8p9KWBudQYMMkn50Exx3Bik4UjriE7cUhOBJC2NeNHZBpQds3IweGBKM7
 0mvB4pOGZp+rn5QLEM5zzvHMWhrvsx8kGdDgeZ1wVv0i4O++ifblZFKwFNJfpMsn4Y/F
 tCjg==
X-Gm-Message-State: AOAM530LKRuw64i21+1IPL10LtRqMDZkkmQSunYp76xZHBVcXI+7u7IP
 FGQEaPhUy+kaurEbIWr91socnuk/7hm2iMaQC6A=
X-Google-Smtp-Source: ABdhPJwt9p/tA3IkzY4pwfvtSr0KZDZ035KTUfqJ7iLltePV28fkkpcn/7KMIUQ58fumeDWt58a21jTwY1bs+1+spiw=
X-Received: by 2002:a05:6214:2522:: with SMTP id
 gg2mr3178151qvb.65.1641898293761; 
 Tue, 11 Jan 2022 02:51:33 -0800 (PST)
MIME-Version: 1.0
References: <20220109132613.122912-1-guoheyi@linux.alibaba.com>
 <ad5e5438-4a3f-2447-4af3-7caa91e7252a@linux.alibaba.com>
In-Reply-To: <ad5e5438-4a3f-2447-4af3-7caa91e7252a@linux.alibaba.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 11 Jan 2022 10:51:22 +0000
Message-ID: <CACPK8XcYp9iAD3fjBQCax41C-1UpA+1AQW3epyEooYzNLt7R5g@mail.gmail.com>
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

On Tue, 11 Jan 2022 at 07:52, Heyi Guo <guoheyi@linux.alibaba.com> wrote:
>
> Hi all,
>
> Any comments?
>
> Thanks,
>
> Heyi
>
> =E5=9C=A8 2022/1/9 =E4=B8=8B=E5=8D=889:26, Heyi Guo =E5=86=99=E9=81=93:
> > The memory will be freed by the caller if transfer timeout occurs,
> > then it would trigger kernel panic if the peer device responds with
> > something after timeout and triggers the interrupt handler of aspeed
> > i2c driver.
> >
> > Set the msgs pointer to NULL to avoid invalid memory reference after
> > timeout to fix this potential kernel panic.

Thanks for the patch. How did you discover this issue? Do you have a
test I can run to reproduce the crash?

Can you provide a Fixes tag?

Do other i2c master drivers do this? I took a quick look at the meson
driver and it doesn't appear to clear it's pointer to msgs.

> >
> > Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
> >
> > -------
> >
> > Cc: Brendan Higgins <brendanhiggins@google.com>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Joel Stanley <joel@jms.id.au>
> > Cc: Andrew Jeffery <andrew@aj.id.au>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: linux-i2c@vger.kernel.org
> > Cc: openbmc@lists.ozlabs.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-aspeed@lists.ozlabs.org
> > ---
> >   drivers/i2c/busses/i2c-aspeed.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-a=
speed.c
> > index 67e8b97c0c950..3ab0396168680 100644
> > --- a/drivers/i2c/busses/i2c-aspeed.c
> > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > @@ -708,6 +708,11 @@ static int aspeed_i2c_master_xfer(struct i2c_adapt=
er *adap,
> >               spin_lock_irqsave(&bus->lock, flags);
> >               if (bus->master_state =3D=3D ASPEED_I2C_MASTER_PENDING)
> >                       bus->master_state =3D ASPEED_I2C_MASTER_INACTIVE;
> > +             /*
> > +              * All the buffers may be freed after returning to caller=
, so
> > +              * set msgs to NULL to avoid memory reference after freei=
ng.
> > +              */
> > +             bus->msgs =3D NULL;
> >               spin_unlock_irqrestore(&bus->lock, flags);
> >
> >               return -ETIMEDOUT;
