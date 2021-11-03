Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92457443B2A
	for <lists+openbmc@lfdr.de>; Wed,  3 Nov 2021 02:54:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkVDy2vBmz2xtr
	for <lists+openbmc@lfdr.de>; Wed,  3 Nov 2021 12:54:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=jcXf+Ciu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c;
 helo=mail-qv1-xf2c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=jcXf+Ciu; dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkVDV0CG7z2xBl;
 Wed,  3 Nov 2021 12:53:45 +1100 (AEDT)
Received: by mail-qv1-xf2c.google.com with SMTP id k29so1127865qve.6;
 Tue, 02 Nov 2021 18:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gFLcv2iNn7US3zrzasnPKO6AXCRPJ7gLb5jCvOGUADY=;
 b=jcXf+Ciuvaj6v+ls6ZTfBbuy40OoXomKmlu/Ez5YnrrwxsRcn7jKAexUfD92xaKAMZ
 X56CskUI//poNj06E/w2ktPXhlxzFnou/XirhfFWpL9cT0JmkD77jhPObpDRGrJfV+Tc
 4AvuRnDMzTBUIfM8bsX2RvisklPuE4XwySge0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gFLcv2iNn7US3zrzasnPKO6AXCRPJ7gLb5jCvOGUADY=;
 b=S6dcpOAmBUd9JyneR+nHtCVgYI7Cb4+MDWNdX5theebuLOq0eelF8mAGU0SiCjjR/3
 drpCLuX4B8+/mT+2e18LD4K2rCy8PSrRdHfHq1IUXJBSdQKlZrI4/WiPbq/QlfJ//HQ0
 doqH2nEyv1yjBIH7YHjR3MMLO2erJqsjYQ3q9mjWswFcPWR+fBNpVUJ0bnwFWp5wCiIy
 nU8C4i5KGIMlNcA1brR97zDPH8y4f3jcciRFSxg80BABJXGylD87qFPTonzjDsCjU7DC
 BSBF23GdAZ/Ztqr159HHDfqxa2HjcC6Vf+8+G2ysvtfeQp3DXUwBC+NX23678An62zJL
 xzpA==
X-Gm-Message-State: AOAM5319FQ+0omlIot0KRNsL8sp1KMf6sxo4WcNCWYhyEziVvi9TziRH
 cT6uAI+JnMkrzkfps1sJQ6SS5czJl66G+kXU/j0=
X-Google-Smtp-Source: ABdhPJy+StW+jzV25J6j1PkhBBtaSlkzkbT0bmfoxMxho8odzhmOY+bBdTb1ZsA8NxUhj4WcozWN0R7Get9OfSe6ThA=
X-Received: by 2002:a0c:edb0:: with SMTP id h16mr29696762qvr.17.1635904422404; 
 Tue, 02 Nov 2021 18:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211103011357.22067-1-jammy_huang@aspeedtech.com>
 <CACPK8XcuhVVvbs4m5k=1d6oFiewEo2RqqOqf5R72KJ4yjiEiUw@mail.gmail.com>
In-Reply-To: <CACPK8XcuhVVvbs4m5k=1d6oFiewEo2RqqOqf5R72KJ4yjiEiUw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 3 Nov 2021 01:53:30 +0000
Message-ID: <CACPK8XezrCtCbKVgNOPNt+N_7ki6Rctf9M8oLBHyixa+Wph2Sw@mail.gmail.com>
Subject: Re: [PATCH v2] media: aspeed: fix mode-detect always time out at 2nd
 run
To: Jammy Huang <jammy_huang@aspeedtech.com>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 3 Nov 2021 at 01:47, Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 3 Nov 2021 at 01:13, Jammy Huang <jammy_huang@aspeedtech.com> wrote:
> >
> > aspeed_video_get_resolution() will try to do res-detect again if the
> > timing got in last try is invalid. But it will always time out because
> > VE_SEQ_CTRL_TRIG_MODE_DET is only cleared after 1st mode-detect.
> >
> > To fix the problem, just clear VE_SEQ_CTRL_TRIG_MODE_DET before setting
> > it in aspeed_video_enable_mode_detect().
> >
> > Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> > Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

When applying, can we please have this tag added:

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")

Cheers,

Joel


>
> > ---
> > v2:
> >   - update commit message
> > ---
> >  drivers/media/platform/aspeed-video.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> > index 5ffbabf884eb..fea5e4d0927e 100644
> > --- a/drivers/media/platform/aspeed-video.c
> > +++ b/drivers/media/platform/aspeed-video.c
> > @@ -518,6 +518,10 @@ static void aspeed_video_enable_mode_detect(struct aspeed_video *video)
> >         aspeed_video_update(video, VE_INTERRUPT_CTRL, 0,
> >                             VE_INTERRUPT_MODE_DETECT);
> >
> > +       /* Disable mode detect in order to re-trigger */
> > +       aspeed_video_update(video, VE_SEQ_CTRL,
> > +                           VE_SEQ_CTRL_TRIG_MODE_DET, 0);
> > +
> >         /* Trigger mode detect */
> >         aspeed_video_update(video, VE_SEQ_CTRL, 0, VE_SEQ_CTRL_TRIG_MODE_DET);
> >  }
> > @@ -809,10 +813,6 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
> >                         return;
> >                 }
> >
> > -               /* Disable mode detect in order to re-trigger */
> > -               aspeed_video_update(video, VE_SEQ_CTRL,
> > -                                   VE_SEQ_CTRL_TRIG_MODE_DET, 0);
> > -
> >                 aspeed_video_check_and_set_polarity(video);
> >
> >                 aspeed_video_enable_mode_detect(video);
> > --
> > 2.25.1
> >
