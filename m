Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE3A46D575
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 15:17:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8K3w2swCz307W
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 01:17:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=p1Jz0sTM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531;
 helo=mail-ed1-x531.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=p1Jz0sTM; dkim-atps=neutral
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8K3C10Hgz308h
 for <openbmc@lists.ozlabs.org>; Thu,  9 Dec 2021 01:16:23 +1100 (AEDT)
Received: by mail-ed1-x531.google.com with SMTP id g14so8712907edb.8
 for <openbmc@lists.ozlabs.org>; Wed, 08 Dec 2021 06:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KLhxQdlpjbVMTlQMKSpDlPMiN1Zg/spaNOwCNsIH3Sg=;
 b=p1Jz0sTM/Vr8aJXiXX2cTU0ZaW24RdBC0G6MsKG8vXLzNQmp0CBoFth4oGQKT7AYSQ
 sVdgm1Qdbhs604SbT++465MGrJNGbPKr8fOi6tjtX4SHJeGgvnHtPspMLUsAo4GoDKyx
 RhQynqskCeaZEsH1zDJWAMxlo2sZnFN+gmWnzmIoX11NNibMzJ1Qd76SA63CP8vxdTUr
 Di1TYFCBrcTv2ZI4X0MvbGwD1xUhyR/eRy04DLA39spqCNR6a/fVDgxmpxqMZX1XP3/t
 0smt8iDCgijczUdlTvQpD46T+okPKBFrL6BjPyZsHxHrUJakRyhcq8QxrFU0fUFhwVTX
 moMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KLhxQdlpjbVMTlQMKSpDlPMiN1Zg/spaNOwCNsIH3Sg=;
 b=jyZcJZjglBtGXOrFFIIG+KViLV+ZpwiOpOOiR13qQ3mngYKMRYMQd62D7zoaNG+2/Q
 ztXBFsFdz85OAxgrXoPrVXVFkTSfTFbzFTEW2Mtwv4s1jBWq9Iq0vnvLtQxYIrmeIQ3N
 QxLo5gWEk40NBeCpkD1sJFfo0sYICpsO5u4v3cL4vgCG3NTYrbtmlcgPuwNKWgi9PdCz
 uftQiKpzvM8lU/kk8rUh/zcCTmiBQHAc2Y9CXR3sAIoQywZ4LBpCd78pW5Qhk2Fjv/Dd
 7n6OmxEHW6utPzUCr8EcZXj+Fm+NQTQ6NJV/e83HYZZnZRQ9dgCas1W7ALakJ36dgaKY
 GgMQ==
X-Gm-Message-State: AOAM533rK7ai1+/Dotd8tgdNlqHyBlRpvU0uLIVDmFoumA+og74/09t4
 giqT24H/Ph6BKpubmbAFtKrCwdnTb4c93+3E4ic=
X-Google-Smtp-Source: ABdhPJxhOheYtaqyypDuzPCT0bxzTxaW5/lEo+dd8oH4Y3ZMYqGNankJpzTTMosXhJhZ79j9Rg9FaLxll18EF6B6K14=
X-Received: by 2002:a17:906:6a0a:: with SMTP id
 qw10mr8177164ejc.141.1638972971450; 
 Wed, 08 Dec 2021 06:16:11 -0800 (PST)
MIME-Version: 1.0
References: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
 <20211207210823.1975632-6-j.neuschaefer@gmx.net>
 <CAHp75Vew=M_ofNM5pmeHtTJHXRUbbO4RrtgYAtLBznTBm3CS6Q@mail.gmail.com>
 <YbC6Bv2teZ5CFhFQ@latitude>
In-Reply-To: <YbC6Bv2teZ5CFhFQ@latitude>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 8 Dec 2021 16:14:38 +0200
Message-ID: <CAHp75VdYtLbCLi7iD0UT7MrPi9oxJLWA9ZCBo7uGbWxNCBdGyw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] pinctrl: nuvoton: Add driver for WPCM450
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 8, 2021 at 3:58 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
> On Wed, Dec 08, 2021 at 01:24:18PM +0200, Andy Shevchenko wrote:
> > On Tuesday, December 7, 2021, Jonathan Neusch=C3=A4fer <j.neuschaefer@g=
mx.net>
> > wrote:

...

> > > +       ours =3D ((1UL << gpio->num_irqs) - 1) << gpio->first_irq_bit=
;
> >
> > BIT()
>
> I'll use it, but in this case, I think it doesn't simplify much the
> whole expression all that much.

It is still better to use in my opinion.

> Is there perhaps a macro that
> constructs a continuous bitmask of N bits, perhaps additionally
> left-shifted by M bits?

> Maybe somewhere in the bitmap_* API...

Maybe, I dunno since I haven't clearly got this code anyway, so up to
you to check and see what to do about it.

...

> > > +       struct fwnode_handle *np;
> >
> >  Either be fully OF, or don=E2=80=99t name =E2=80=98np' here. We usuall=
y use fwnode or
> > =E2=80=98child=E2=80=99 in this case.
>
> Ah, I thought "np" (=3D node pointer) was still appropriate because I'm
> dealing with firmware _nodes_. My intention was indeed to switch fully
> to the fwnode API.

Just a convention "de facto".

...

> > > +               ret =3D gpiochip_add_pin_range(&gpio->gc,
> > > dev_name(pctrl->dev),
> > > +                                            0, bank->base, bank->len=
gth);
> > > +               if (ret) {
> > > +                       dev_err(pctrl->dev, "Failed to add pin range =
for
> > > GPIO bank %u\n", reg);
> > > +                       return ret;
> > > +               }
> >
> > Please move it to the corresponding callback.
>
> What's the corresponding callback?

https://elixir.bootlin.com/linux/latest/source/include/linux/gpio/driver.h#=
L400

--=20
With Best Regards,
Andy Shevchenko
