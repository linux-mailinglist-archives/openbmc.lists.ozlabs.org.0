Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBDF25806A
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 20:11:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgJDV4CWmzDqSy
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 04:11:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=vZaqRz6g; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgJCS4jhMzDqRc
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 04:10:27 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id 37so4455553oto.4
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 11:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VjcOX+O6+Q0wVLVy5iOGuljY1HLUCKGrM2Zx4jaHF0E=;
 b=vZaqRz6gPaztwYQyRjYHR8xtBaNnsakq7VS7gV1Jc2XbRTtD3KOy2/T7zfVrl7Ux41
 m1n0QBSe07CxKazXvcJNC0qphB0ZM+F/RZjGclPdxPOyRIHHRotMD2u8Reilqq3Myt9t
 rgTYnm4TiWZ6QqaLHb5/J3a0tRHoXezu30kMr8imgBwyjdcnydc9nDu7FeRKyB6s3E4x
 6/yDTDyrcJg7rJiR9v10GikVAZHmp/mz1hT3K8ZvwaEwHbrwDRLYkgVQop12EIUogMcO
 AvUJnuyQ5gFNW5MnufPLajm+bduenZYdgux9DfNckAmmArxY9lp3WMU2oFqRZAX56c5W
 ajvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VjcOX+O6+Q0wVLVy5iOGuljY1HLUCKGrM2Zx4jaHF0E=;
 b=QmyhiiXczuPUAxbIVxcdmG2PdE1/PyyuWgk2RNF+ayfHFQ8U4LNRXMaFIjh1UYHzEh
 z25JMF357U84lsP2vXSbC5bwBE5Gdzf9bU/+TFTBblPrF+/0SQSJYpU/5YW7Dr391VCF
 IBHx1hcqlUuUVCubmeZqre/wZfomIhzp4TsEkbQDIjrHirXxcAj/W2lbq2FPCR09hfJ2
 IIHowQ71PZYY4s0lT13bhuQC67O3zhRPSAxYFrwyUgz0vqH89xRP3Tf1bMh27Vy8nvim
 RXjk8Evts1YlV69tGIHl7T5jN3imYZcpPPifS/Z/gMnBa7FDR17I10rDI85RImRyUxKW
 Zk2A==
X-Gm-Message-State: AOAM530TpdvHN732iv7KGdMTiISqoYhrEpy6nEES40O8x0qul11OqBlS
 cMPov1iVP2XAIQvpUrL1rk0otq+VztSR7Ku90oCn1Q==
X-Google-Smtp-Source: ABdhPJwOgUYMtjt9QOITuY87oezIiwUst1TAAS19PpHboVYHCLYkQhWhxobP65iEGxxUZlwrpCSiZH+ta1y30jMxkos=
X-Received: by 2002:a9d:7f06:: with SMTP id j6mr1714141otq.274.1598897423402; 
 Mon, 31 Aug 2020 11:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200830213121.239533-1-tali.perry1@gmail.com>
 <CACPK8Xev4w4BxrxR1zQPk=wiHCK2fSGD9tEeAQwPe_uayGw_CA@mail.gmail.com>
In-Reply-To: <CACPK8Xev4w4BxrxR1zQPk=wiHCK2fSGD9tEeAQwPe_uayGw_CA@mail.gmail.com>
From: Alex Qiu <xqiu@google.com>
Date: Mon, 31 Aug 2020 11:10:12 -0700
Message-ID: <CAA_a9xKVEA-6n=rMA8Sk6zJpWV4_qGCcXwN7kFUFpJKuDiG=Bg@mail.gmail.com>
Subject: Re: [PATCH v3] i2c: npcm7xx: Fix timeout calculation
To: Joel Stanley <joel@jms.id.au>
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
Cc: Benjamin Fair <benjaminfair@google.com>, Wolfram Sang <wsa@the-dreams.de>,
 Avi Fishman <avifishman70@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, linux-i2c@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Aug 30, 2020 at 8:35 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Sun, 30 Aug 2020 at 21:31, Tali Perry <tali.perry1@gmail.com> wrote:
> >
> > timeout_usec value calculation was wrong, the calculated value
> > was in msec instead of usec.
> >
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Reviewed-by: Avi Fishman <avifishman70@gmail.com>
>
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
> Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Alex Qiu <xqiu@google.com>
>
> Cheers,
>
> Joel
>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> > index 75f07138a6fa..dfcf04e1967f 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -2093,8 +2093,12 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> >                 }
> >         }
> >
> > -       /* Adaptive TimeOut: astimated time in usec + 100% margin */
> > -       timeout_usec = (2 * 10000 / bus->bus_freq) * (2 + nread + nwrite);
> > +       /*
> > +        * Adaptive TimeOut: estimated time in usec + 100% margin:
> > +        * 2: double the timeout for clock stretching case
> > +        * 9: bits per transaction (including the ack/nack)
> > +        */
> > +       timeout_usec = (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nread + nwrite);
> >         timeout = max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
> >         if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
> >                 dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
> >
> > base-commit: d012a7190fc1fd72ed48911e77ca97ba4521bccd
> > --
> > 2.22.0
> >
