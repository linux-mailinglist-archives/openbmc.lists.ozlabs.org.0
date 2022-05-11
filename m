Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BA9522910
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 03:40:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kyczr2J9hz3bdp
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 11:40:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=doQTqwTJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::935;
 helo=mail-ua1-x935.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=doQTqwTJ; dkim-atps=neutral
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyczS67dNz2yPv
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 11:40:03 +1000 (AEST)
Received: by mail-ua1-x935.google.com with SMTP id s1so216956uac.6
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 18:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CcFxQLzTZRJwr99fvgXAPxv27Gu79cyIN89beQ0h8+I=;
 b=doQTqwTJY/0aNgS3TuLFjyoXwLksQMSfsszsNSnDHaolf1MYeOl9gG5O24PLVU82fH
 btXj6S4frOw6tM9Z8GDA3by2QXpXn/WRgFG2WHiPhccEtDXkigJ3McQdvck16+qFbQUE
 zcajmkr9sYjabxlbjMGVYu3hiaVg9TVfrkJcfEgzK0w/ftyVRIOUzjJrdJFVyHoMfYz1
 xTTsT4FPfpa6wRskPwjoM8B5YNU8mRgis934ucNRgBsKSZbXoFHAdgPjgO6p5rGhYd9W
 T+jYjGuPqxjbF18YNLyhCe27fVQsAQxm7h+Farsbe/wFNi60+8nVHRybTq1F8v5W8g5s
 KStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CcFxQLzTZRJwr99fvgXAPxv27Gu79cyIN89beQ0h8+I=;
 b=JCz7q+9WTcew7eeu8AJvCwJscQkaEIUP1b2Aku69oUw1+t7dGeQUbLlS9EczxfZ6FM
 eClUCy/hqL0yADIrOaXCSXHyKXnH8c2Sd0w5r/Bu1kz/x/cGYjKHaJ4OAm5xxquYyN4+
 JJ9sbalyC7RvWpQVa5d3I9EphBF3F5Sa5PpxGFiDoDpZ2yZwp3IeR7Bnn0hvQWsTmQlN
 h84R0POTCs057qhXHrnB0Y79sMdMsthsDnCd+T/LJcICSFvX0kFY0J8qiFlqtBDdusQ4
 VS58Z/Mt6/vH4ILRC+6CLRmqzpCX2mbmM50DCYwdbyYrqx6IPStmdUO5MLfjfuaJSgRg
 B4Ng==
X-Gm-Message-State: AOAM531p8PPu8IliIlKoZWBdIddPCvbqn2vyUihN/VH61+w4bqHsp1xQ
 z6a5WED8qw0olXjG8AQuHNlO9hM8CBYht8mnQA==
X-Google-Smtp-Source: ABdhPJwOdeGJuYqe4UdD24r6xFX8A4WORqnypLWn7xKLOUFSl3SkCt3/PITp6+sTRwqH8HOqqFo3SqgByFDcT98cVao=
X-Received: by 2002:ab0:6f95:0:b0:362:8cb3:36f3 with SMTP id
 f21-20020ab06f95000000b003628cb336f3mr12861637uav.46.1652233200103; Tue, 10
 May 2022 18:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220510091654.8498-1-warp5tw@gmail.com>
 <20220510091654.8498-9-warp5tw@gmail.com>
 <Yno8KMycNbJ+VGtc@smile.fi.intel.com>
In-Reply-To: <Yno8KMycNbJ+VGtc@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Wed, 11 May 2022 09:39:48 +0800
Message-ID: <CACD3sJYVyV_fFJu9zXJGL1ro02KnkHoeNNSNB8O46FRwd6=-BA@mail.gmail.com>
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

Thank you for your comments and they will be addressed.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2022=E5=B9=B4=
5=E6=9C=8810=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:19=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Tue, May 10, 2022 at 05:16:53PM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > NPCM can support up to 10 own slave addresses.
> > In practice, only one address is actually being used.
> > In order to access addresses 2 and above, need to switch
> > register banks. The switch needs spinlock.
> > To avoid using spinlock for this useless feature
> > removed support of SA >=3D 2.
>
> > Also fix returned slave event enum.
> >
> > Remove some comment since the bank selection is not
> > required. The bank selection is not required since
> > the supported slave addresses are reduced.
>
> Fancy indentation. Please fix it in all your commit messages where it app=
lies.
>
> ...
>
> > +     if (addr_type > I2C_SLAVE_ADDR2 && addr_type <=3D I2C_SLAVE_ADDR1=
0) {
> > +             dev_err(bus->dev,
> > +                     "try to enable more then 2 SA not supported\n");
>
> Make it one line and drop {}.
>
> > +     }
>
> ...
>
> > +     if (addr_type > I2C_SLAVE_ADDR2 && addr_type <=3D I2C_SLAVE_ADDR1=
0) {
> > +             dev_err(bus->dev,
> > +                     "get slave: try to use more then 2 slave addresse=
s not supported\n");
>
> As per above be consistent with abbreviations ("SA" here, which makes lin=
e
> shorter) and follow the above recommendation.
>
> > +     }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Best Regards,
Tyrone
