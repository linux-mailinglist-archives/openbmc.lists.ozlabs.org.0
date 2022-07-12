Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D64571A6B
	for <lists+openbmc@lfdr.de>; Tue, 12 Jul 2022 14:48:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lj0sg4dbSz3c3D
	for <lists+openbmc@lfdr.de>; Tue, 12 Jul 2022 22:48:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GqU/u0Ul;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GqU/u0Ul;
	dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lj0sD14CZz2x9J
	for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2022 22:47:42 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id 136so13729712ybl.5
        for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2022 05:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nuKIucR4KkuGyNu77o8BMuklCnlGTYu08xOm0VTgdvk=;
        b=GqU/u0UlCR6S91EqqKnO0JOpU9rLiT7tbPk0Wkx/SrM4UWJYrcl1e0tR//MWxWfhlO
         c5Hz6NuofNkEIyx9vVL6U73Y2jdAV/me94++R4ZedtiPQor6j5LpefQEzpvSIHdLRfv9
         yI8A9FKt5KfSokgAHN9ERtG963U/REg9j8H0IQxa00Kp4m2p4hBr0Q4TEEcTr+me6Hla
         0zFQCD4vTCrO1FQGXUPOOkvnYDC64UVjPC7Vy+Cv0z05O7C6gX20yNfm0pResEKK7VjK
         GpcsvaoBOZN80/En12Gy8gjmMifGwOnS1yYuKPZkOCaq0242959il3sgRns+h8Z8k3tY
         aaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nuKIucR4KkuGyNu77o8BMuklCnlGTYu08xOm0VTgdvk=;
        b=aKcrGLtEyb3pAD9vL8MJPSEU9QsKQcXfqyJawhagRP0NisGdCYK36HVqbSiIIs6PMD
         5u6EftXVtG5nTXqCR0QyZ12nn5L83DZBoQSuBwEOiPle50camM1sehYrdZFNL4f6PplX
         rZahgTEGXhpxgGy/TbRFVZfk4M8IGLUvktE++sanSPsEXqWjmCuohaRqHnTaWTFnCt0E
         kj5blptqYNkiBi23CEI/WKMPO/5eU9ENwLkOd1R1D8pu6y0KM83zWHLV04vAMEE+6LJJ
         Zo/9Zf7A5pto5Q+HrT+JvrIDhwbvTup2KQDlqyrvWHhOx8Sf7OOaTbWXO2fWoef+0fqW
         V+xg==
X-Gm-Message-State: AJIora+Rk6ntOVAcqp2vEQvRtAqd/vQbMvmgdLZkRFl8N0OfWMsVA1qa
	uLBb86f0dCAplcbWSUc8Q71FC4KbwjIGI73spPY=
X-Google-Smtp-Source: AGRyM1sKejbUO1HoZjE4lSyDoKO9Miu7goYifaotbPEm1foAGgKjrYVSe34gWUcQ2nkEyr2fAzNJ96SJe5dnVWQnEBE=
X-Received: by 2002:a25:cbcf:0:b0:66e:8893:a02c with SMTP id
 b198-20020a25cbcf000000b0066e8893a02cmr22814673ybg.460.1657630058486; Tue, 12
 Jul 2022 05:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220710102110.39748-1-tmaimon77@gmail.com> <20220710102110.39748-3-tmaimon77@gmail.com>
 <CAHp75VdaT8WjoHYgmUY+mKVaUivLGGeaRJAkwfRjHspPAmw_XQ@mail.gmail.com> <CAP6Zq1iQL2R67dbdQiXW_JUWrGne9xp-9yQ97vQOb4RveQE7Yw@mail.gmail.com>
In-Reply-To: <CAP6Zq1iQL2R67dbdQiXW_JUWrGne9xp-9yQ97vQOb4RveQE7Yw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 Jul 2022 14:47:01 +0200
Message-ID: <CAHp75VfYbFYcp6eKQsSJ9-0Wz-9=UaM8ERWyOkcXfWvinZHB7w@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver
To: Tomer Maimon <tmaimon77@gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, zhengbin13@huawei.com, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 12, 2022 at 1:33 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
> On Sun, 10 Jul 2022 at 22:36, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Sun, Jul 10, 2022 at 12:44 PM Tomer Maimon <tmaimon77@gmail.com> wrote:

Please, remove unneeded context when replying!

...

> > > +       if (pincfg[pin].flag & SLEWLPC) {
> > > +               switch (arg) {
> > > +               case 0:
> > > +                       regmap_update_bits(gcr_regmap, NPCM8XX_GCR_SRCNT,
> > > +                                          SRCNT_ESPI, 0);
> > > +                       return 0;
> > > +               case 1:
> > > +                       regmap_update_bits(gcr_regmap, NPCM8XX_GCR_SRCNT,
> > > +                                          SRCNT_ESPI, SRCNT_ESPI);
> > > +                       return 0;
> > > +               default:
> > > +                       return -EINVAL;
> > > +               }
> > > +       }
> > > +
> > > +       return -EINVAL;
> >
> > Why not to use usual pattern, i.e.
> >
> >   if (error_condition)
> >     return -EINVAL;
> What do you mean? like if (arg>1) return -EINVAL? It just seems more readable.

  if (!(pincfg[pin].flag & SLEWLPC))
    return -EINVAL;

  switch(...) {
    ...
  }

> > here and everywhere in the similar cases?
> can you point me to which more cases you mean?

Any you find that follows this pattern. Actually the rule of thumb is
to address all places in the code even if reviewer has given a comment
against one occurrence of something.

...

> > > +               val = ioread32(bank->base + NPCM8XX_GP_N_ODSC)
> > > +               & pinmask;
> >
> > What was happened to indentation? Check entire file for indentation to be okay.
> Sorry, I didn't understand, could you explain the comment again?

Indentation is a code formatting technique that allows the text to be
more readable. In particular when lines are split they should
logically follow what code does and point to the code relation. Here
you have '&' on the next line with indentation starting at the 'val's
column. This is not readable and confusing. In this case formatting on
one line fixes all issues. Possible alternative is to clearly show how
the 'val' is being modified:

   val = ioread32(...);
   val &= mask;

But see above about the amount of LoCs.

...

> > > +                       } else if ((nanosecs > 3496) && (nanosecs <= 4136)) {
> > > +                               iowrite32(0x60, bank->base + NPCM8XX_GP_N_DBNCP0 + (i * 4));
> > > +                       } else if ((nanosecs > 4136) && (nanosecs <= 5025)) {
> > > +                               iowrite32(0x70, bank->base + NPCM8XX_GP_N_DBNCP0 + (i * 4));
> >
> > With switch-case with ranges it will be much more visible what's going
> > on. Also think about it, maybe you can use some formula instead? Or
> > table (array of integers) approach where index will show the lowest
> > range value.
> There it can be described in a formula. Will be done with switch-case

I'm not sure I follow. If you can use a formula, use it!

...

> > > +               if (ret) {
> > > +                       dev_err(dev, "bgpio_init() failed\n");
> > > +                       return ret;
> > > +               }
> >
> > Use
> >
> >   return dev_err_probe(...)
> Why it is better to use dev_err_probe?

(beside deferred probe, which may be not the case here)
- standardized format
- less LoCs

> I am not sure that the error will be EPROBE_DEFER, all the failure
> cases the driver returned the
> error in the code.

...and it's fine to use dev_err_probe() as stated in its documentation.

> > In ->probe() and satellite functions.

-- 
With Best Regards,
Andy Shevchenko
