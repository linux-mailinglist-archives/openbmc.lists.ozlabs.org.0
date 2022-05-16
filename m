Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C58C527B60
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 03:24:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1hNh37vRz3byL
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 11:24:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jLxemqpw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92a;
 helo=mail-ua1-x92a.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jLxemqpw; dkim-atps=neutral
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1hNH5TwQz3bdB
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 11:23:41 +1000 (AEST)
Received: by mail-ua1-x92a.google.com with SMTP id x11so5294550uao.2
 for <openbmc@lists.ozlabs.org>; Sun, 15 May 2022 18:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7wuXO57c0JtXqV5NdAvSdjaT7cOyGnW8IqIXRcho3Sc=;
 b=jLxemqpwDv3YIlAWxavQtM/R0fB+JS+RanuyHTfmcZVVq1IsYjB7/tbyLeXAnMlWtc
 t1ATdP3DVFy4V8JCbAObbLpC0n5K6OGz4aePehxPCYiKVRfzBB+lfEuxkFK7ziSxLA3X
 F/X1wg1G9xTIQevmNjxcApVZnbyVSnVuwbaUQoVEQXOtqcdB4jYIx4IxNKH7uGa48RTB
 OHXcEHP9GslvHInoVwaPl7bvXCeBJVCjo6DsFtqNZCoh0JMNoAMaFine049A86yv4yqn
 tKQq2RVNInTXx8wj2kycJW9+CBDKflXYyO4nF3cJKtmTJdJcUoiFmRZZy7xOXwd1k7gH
 eHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7wuXO57c0JtXqV5NdAvSdjaT7cOyGnW8IqIXRcho3Sc=;
 b=hlpH1tZb678kbHii9dm+lchOkPWitkzkmfwQVULxLlcAG7CjPItqUEVoDy72wnLI+G
 CeBYbtNxe5Kyslqor2+XMCTfFHi8yK+UrwsVgdXzP8TP3ZM+MQH3M0eXF4L+1FlMS7e6
 PINSK/9btn5g+XuxJ4xnaWsoZrrFrbCm2++gyr6YSIC21J41+Ksz7sVr8WhdKV6APsQl
 Pl3rG42hbHQWsQHI/TqUozhFZMvnCf02P3dDopD+1cEMUb0hIuwI1MmZknYWgAUxUfWE
 d5Fnz1ibIfBPySqXTX3n1lT0R55dTnps48nf25/1FQx2OzPOyR2hA/BlrEewV+US8+IR
 pUnA==
X-Gm-Message-State: AOAM530t8zXEaHewDuFcVHwMBwlckRC/wLkwCbYgwVHumEJAhqPT5Zy4
 +d2Sg994gQF0w4JWAunLUHog8tKsAz7MNsbeLA==
X-Google-Smtp-Source: ABdhPJwNLMRahavW5whCZBPGo059+0UY3efbiL9iQ4RtWbjJJpSVEhPXj0XzodbmI/P/D96ykhaUca+cEqub5JmtEXs=
X-Received: by 2002:a9f:31ce:0:b0:360:4d8:3eeb with SMTP id
 w14-20020a9f31ce000000b0036004d83eebmr5136218uad.73.1652664217430; Sun, 15
 May 2022 18:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220510091654.8498-1-warp5tw@gmail.com>
 <20220510091654.8498-9-warp5tw@gmail.com>
 <Yno8KMycNbJ+VGtc@smile.fi.intel.com>
 <CACD3sJYVyV_fFJu9zXJGL1ro02KnkHoeNNSNB8O46FRwd6=-BA@mail.gmail.com>
In-Reply-To: <CACD3sJYVyV_fFJu9zXJGL1ro02KnkHoeNNSNB8O46FRwd6=-BA@mail.gmail.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 16 May 2022 09:23:25 +0800
Message-ID: <CACD3sJZxzs28Ruxifw1vjgKmOr0Z3WgC6SpciwjyvkRMZh8ykw@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] i2c: npcm: Remove own slave addresses 2:10
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 jsd@semihalf.com, krzysztof.kozlowski+dt@linaro.org, benjaminfair@google.com,
 openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, arnd@arndb.de, sven@svenpeter.dev,
 robh+dt@kernel.org, Avi.Fishman@nuvoton.com, semen.protsenko@linaro.org,
 avifishman70@gmail.com, venture@google.com, linux-kernel@vger.kernel.org,
 wsa@kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com,
 jarkko.nikula@linux.intel.com, olof@lixom.net, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy:

I would like to have your comments about the "Fancy indentation"
because I'm not sure if I get the point.

I remove extra empty lines and reformat the commit message.

Please see the details below.

Thank you.

Tyrone Ting <warp5tw@gmail.com> =E6=96=BC 2022=E5=B9=B45=E6=9C=8811=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=889:39=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Andy:
>
> Thank you for your comments and they will be addressed.
>
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2022=E5=B9=
=B45=E6=9C=8810=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:19=E5=AF=AB=
=E9=81=93=EF=BC=9A
> >
> > On Tue, May 10, 2022 at 05:16:53PM +0800, Tyrone Ting wrote:
> > > From: Tali Perry <tali.perry1@gmail.com>
> > >
> > > NPCM can support up to 10 own slave addresses.
> > > In practice, only one address is actually being used.
> > > In order to access addresses 2 and above, need to switch
> > > register banks. The switch needs spinlock.
> > > To avoid using spinlock for this useless feature
> > > removed support of SA >=3D 2.
> >
> > > Also fix returned slave event enum.
> > >
> > > Remove some comment since the bank selection is not
> > > required. The bank selection is not required since
> > > the supported slave addresses are reduced.
> >
> > Fancy indentation. Please fix it in all your commit messages where it a=
pplies.
> >

I modify the commit message as following:

NPCM can support up to 10 own slave addresses. In practice, only one
address is actually being used. In order to access addresses 2 and above,
need to switch register banks. The switch needs spinlock.
To avoid using spinlock for this useless feature removed support of SA >=3D
2. Also fix returned slave event enum.

Remove some comment since the bank selection is not required. The bank
selection is not required since the supported slave addresses are reduced.

> > ...
> >
> > > +     if (addr_type > I2C_SLAVE_ADDR2 && addr_type <=3D I2C_SLAVE_ADD=
R10) {
> > > +             dev_err(bus->dev,
> > > +                     "try to enable more then 2 SA not supported\n")=
;
> >
> > Make it one line and drop {}.
> >
> > > +     }
> >
> > ...
> >
> > > +     if (addr_type > I2C_SLAVE_ADDR2 && addr_type <=3D I2C_SLAVE_ADD=
R10) {
> > > +             dev_err(bus->dev,
> > > +                     "get slave: try to use more then 2 slave addres=
ses not supported\n");
> >
> > As per above be consistent with abbreviations ("SA" here, which makes l=
ine
> > shorter) and follow the above recommendation.
> >
> > > +     }
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >
>
> Best Regards,
> Tyrone

Best Regards,
Tyrone
