Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 229EBE762A
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 17:31:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4720bM4bbFzDrM2
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 03:31:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d41;
 helo=mail-io1-xd41.google.com; envelope-from=navid.emamdoost@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IEVfVXYq"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4720Z60KFrzDrTK;
 Tue, 29 Oct 2019 03:30:21 +1100 (AEDT)
Received: by mail-io1-xd41.google.com with SMTP id p6so11400393iod.7;
 Mon, 28 Oct 2019 09:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V/+YXkmrDex7nEr+gkqIoyiFItObqxb735/pgi9TyOw=;
 b=IEVfVXYqi71X+5wVl3Ese6uVmR7+J/VABWSAUt7H4jonMAuWXEZACHPKzDWU8PaTdQ
 lRfIaqsTOOqdC5QeAI95fcxyC2ALi8O2yrs7v2oszQwXMyqLSeu98BMk8/d4Y4HOTZCW
 Ip3dgukKFPd8Z+K/JVq17v79VV8bhl5POK/5YviTYJ19ZSLcyB1vPkcQbC3dx6E+1Op8
 rxl6p/utkpHicJVLDdRasCAKRULk6rq0gId0DIzIyLkCjkQOmXS+tziKwY5XhuGq6VVm
 /TMxt+tb3v26IeEHYmc44XaG8cjhvOKaMysrOafos6Iyr3V6O8RhD5xbccRIugY0lNxW
 YRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V/+YXkmrDex7nEr+gkqIoyiFItObqxb735/pgi9TyOw=;
 b=ExpI7cLK0B6TXzKsjRozDD12lDNTlfpKSozrXwH09541qFxA1vT2MlgGJFaROsliy+
 2XlXf88ry49QCjQir0HDDIp6UKDNpv91b9/WY7ZuBjgKalMBOe6b2SZRH4T5g+ahrLov
 +AhcpGcXvB3oUO4Bb3SjoxcUFeZ1PSRk4plrnDeIgkY2LSdMQhFwaMDUJZV4yaxGpSjG
 aIXJxBjqxEhrCGtHmeKpwfxgxTM8qye0hJSOVKLIRvTUGJYPWz48aAET/9dVaHwwcnKu
 1wAYtbYlVkkoh6vhUgdqNIecB7DZxhajaFUC0aIjjU83+dN23Km38c9STUcUk95mK85k
 fZkQ==
X-Gm-Message-State: APjAAAV1Q5d3d+WoLYcOS2Jlx9wuJkgr1RM2q1IOzVVoXIdvAa2wwbue
 +p0PFze7YsqdiV2plsnwK6pbUU4fuDkzksbniHE=
X-Google-Smtp-Source: APXvYqzk/zLyOx63qqddiGsEf2n1A10g0Xbr4HwW628LXscP5JAk3K//9Mo38REgUHJBpGQfWEZeoUeMnJ3rGvH8ZNI=
X-Received: by 2002:a02:330e:: with SMTP id c14mr18313186jae.5.1572280217811; 
 Mon, 28 Oct 2019 09:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191026042519.29446-1-navid.emamdoost@gmail.com>
 <d9c04318-586a-bfc2-fce6-6218c6bab1d6@linux.intel.com>
In-Reply-To: <d9c04318-586a-bfc2-fce6-6218c6bab1d6@linux.intel.com>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Mon, 28 Oct 2019 11:30:06 -0500
Message-ID: <CAEkB2EQXmHJoMJJJULHHFy4gp6a=QiCe5SoxkWehnpKWNVw=_A@mail.gmail.com>
Subject: Re: [PATCH] media: aspeed-video: Fix memory leaks in
 aspeed_video_probe
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Kangjie Lu <kjlu@umn.edu>, openbmc@lists.ozlabs.org,
 Eddie James <eajames@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>,
 Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 28, 2019 at 11:27 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> Hi Navid,
>
> On 10/25/2019 9:25 PM, Navid Emamdoost wrote:
> > In the implementation of aspeed_video_probe() the allocated memory for
> > video should be released in case of failure. Release video if either
> > devm_ioremap_resource() or aspeed_video_init() or
> > aspeed_video_setup_video() fails.
> >
> > Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
> > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> > ---
> >   drivers/media/platform/aspeed-video.c | 14 ++++++++++----
> >   1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> > index eb12f3793062..8c473356132d 100644
> > --- a/drivers/media/platform/aspeed-video.c
> > +++ b/drivers/media/platform/aspeed-video.c
> > @@ -1663,18 +1663,24 @@ static int aspeed_video_probe(struct platform_device *pdev)
> >
> >       video->base = devm_ioremap_resource(video->dev, res);
> >
> > -     if (IS_ERR(video->base))
> > -             return PTR_ERR(video->base);
> > +     if (IS_ERR(video->base)) {
> > +             rc = PTR_ERR(video->base);
> > +             goto free_video;
> > +     }
> >
> >       rc = aspeed_video_init(video);
> >       if (rc)
> > -             return rc;
> > +             goto free_video;
> >
> >       rc = aspeed_video_setup_video(video);
> >       if (rc)
> > -             return rc;
> > +             goto free_video;
> >
> >       return 0;
> > +
> > +free_video:
> > +     kfree(video);
> > +     return rc;
> >   }
> >
> >   static int aspeed_video_remove(struct platform_device *pdev)
> >
>
> Can we simply change kzalloc in aspeed_video_probe with devm_kzalloc
> so that we don't need to take care of freeing of video? I think it would
> be more simpler.

Sounds a neat plan, will send v2.

>
> Cheers,
>
> Jae



-- 
Navid.
