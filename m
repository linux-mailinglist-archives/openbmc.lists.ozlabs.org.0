Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DE72804EC
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 19:16:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2KXP3nBwzDqbG
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 03:16:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d44;
 helo=mail-io1-xd44.google.com; envelope-from=avifishman70@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PhU9qdrP; dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2KWH6yy5zDqSF
 for <openbmc@lists.ozlabs.org>; Fri,  2 Oct 2020 03:15:03 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id g128so7531723iof.11
 for <openbmc@lists.ozlabs.org>; Thu, 01 Oct 2020 10:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z+7Lt80oBeAGmb9TBQ2+JaFU8H0QfKMoZ05cXeDXD9U=;
 b=PhU9qdrPsdyEV4/IkasacTEJJ/IceRDChfTyR2GjTJOu+JE8YVw41h4EnNCIXyHx5K
 VxmwBQOp/VoPC6lRilRIeSw7sMZGwUJP65HpUyF2TrpIRJl+/9FIMyFS4rfDArgzjAD3
 9wnWYcn+4/8yfn7hbYcPmUCmoziaZDj5a5jwGBQFsY5NoDdFGWqGoq/vDemy7KGur45v
 zm1FX0djCPnwkbkCXSOaTfMMr+9jce90wF6JMv8v/IBGyuFz8MHRNLwswd3fiO4g+NHq
 oofiBj1Itz5FRRpIPuGr6PodDzBe7vGZD9jfuIea6hO5/Kxx3GR1NgIlRiDlU+kp/2Gb
 EsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z+7Lt80oBeAGmb9TBQ2+JaFU8H0QfKMoZ05cXeDXD9U=;
 b=PAdQHiFQcJEPS12gzv6GKqWHqg0tMFb+i6CeqQT0kpeDUoRA8NhGtgX/U0t1LooaZL
 UsPkoHi5WnXclN2TZ3AhzxAO3XtASXsCW/gAHlcFjpEofvURzGoX7Pf+oxQCiSHVBSE/
 Obcxzer7bnFt6VjYkxFQ89BPLjfbGcLTtFFrzlBgsVb1tcZqdQMaA23rW/Sw8gCMV8A6
 EGdiLgIa3qKL7kWPvPlWaJHL3fCcrEy79BS8wD3wpHVcY87UFS05qC6w3h7f+E+ppzex
 yLhddfdVM//6aiJ2Af8rrC92tIAkTkmCGKnC0cUuZwGIoZBsHF7IIoB0COcdeQVoFvCr
 yFnQ==
X-Gm-Message-State: AOAM531rV0xRd27KsA0BB2qGmUrX23t8Zy+EU3YBxqQEaOzGgLsZYN2U
 v1OEmY+Ke05kDmFpyeMH2MaDdSGN62WwzH59kA==
X-Google-Smtp-Source: ABdhPJy8DcqWDEWw9DLV6GesYGG7ZYbppxk0xqAtTGsejro8nMut9O+LwsIpL8jZd0UL1L6908xTBbJaDiAXgQZhBLU=
X-Received: by 2002:a02:ccdb:: with SMTP id k27mr6786779jaq.103.1601572500365; 
 Thu, 01 Oct 2020 10:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200930071342.98691-1-tali.perry1@gmail.com>
 <20200930093117.GY3956970@smile.fi.intel.com>
 <CAHb3i=sWxiVLCC0hfY+6-_x92ZEMY7Ctyyuz9CbMYxrH_BqAZQ@mail.gmail.com>
 <CAHp75Vc3Bw-dTpEmpeUpB4n5-8-xGPx+jm_HkB5Pj6Qr8U=CAw@mail.gmail.com>
In-Reply-To: <CAHp75Vc3Bw-dTpEmpeUpB4n5-8-xGPx+jm_HkB5Pj6Qr8U=CAw@mail.gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Thu, 1 Oct 2020 20:13:49 +0300
Message-ID: <CAKKbWA4gHobXFGi5CiPnawWoMOi0GFrCbzanuOFZ+Aky6=9Mpg@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: npcm7xx: Support changing bus speed using debugfs.
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
Cc: Alex Qiu <xqiu@google.com>, Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy,

Customers using BMC with complex i2c topology asked us to support
changing bus frequency at run time, for example same device will
communicate with one slave at 100Kbp/s and another with 400kbp/s and
maybe also with smae device at different speed (for example an i2c
mux).
This is not only for debug.
Can DT overlay support that?

On Thu, Oct 1, 2020 at 6:40 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Oct 1, 2020 at 8:34 AM Tali Perry <tali.perry1@gmail.com> wrote:
> > On Wed, Sep 30, 2020 at 12:31 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Wed, Sep 30, 2020 at 10:13:42AM +0300, Tali Perry wrote:
> > > > Systems that can dinamically add and remove slave devices
> > >
> > > dynamically
> > >
> > > > often need to change the bus speed in runtime.
> > >
> > > > This patch exposes the bus frequency to the user.
> > >
> > > Expose the bus frequency to the user.
> > >
> > > > This feature can also be used for test automation.
> > >
> > > In general I think that DT overlays or so should be user rather than =
this.
> > > If we allow to change bus speed settings for debugging purposes it mi=
ght make
> > > sense to do this on framework level for all drivers which support tha=
t (via
> > > additional callback or so).
> >
> > Do you mean adding something like this:
>
> Nope. I meant to use DT description for that. I=C2=B2C core should cope
> with DT already.
> I do not understand why you need special nodes for that rather than DT
> overlay which will change the speed for you.
>
> --
> With Best Regards,
> Andy Shevchenko



--=20
Regards,
Avi
