Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5472D20F2
	for <lists+openbmc@lfdr.de>; Tue,  8 Dec 2020 03:41:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqkvZ2NXZzDqcH
	for <lists+openbmc@lfdr.de>; Tue,  8 Dec 2020 13:41:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=nQmn7fAP; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqktQ3HjMzDqJc;
 Tue,  8 Dec 2020 13:40:09 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id z3so11048293qtw.9;
 Mon, 07 Dec 2020 18:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JY14U8S62/FWXFTqIYq8u7QrCXxJofc9nJgVqZeSkFc=;
 b=nQmn7fAPmH9tazVlHIrlKmVuehOaj2oDM8avnT77YOd4Fn0Pjf9jpg47UVqPQQnt5B
 Jr0gFbSAmUKhfmhrfVfUzq1dMMlICeXjcBShehFjOPwwnM156HxMHugJKCoMIwbpkBZu
 7BpMichxgtUuktYqaYvBPIYldxMJCwfbLUR98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JY14U8S62/FWXFTqIYq8u7QrCXxJofc9nJgVqZeSkFc=;
 b=VSxLSuL4uA9xe3mtSbRkR4tj25oKh+moZ3wXteZqzvxBZP9hgk7LQniT8x5JE3JiNd
 HnEml3NteWin0Etd9/nHCphGgojpJV3vmSOT7ru2EMGFcvsuBO6/ELlkxhIgfwfmmdEr
 UptKpdmlejcjx0Lm9pds83T8SUUHjUD9t8bmFlxSh1exV9y86zt886Rbo01Gt1y4Pv8z
 GoaOvO5ezRgwBNMA6ZCSMiOnT74Nd27HGcnD1AOAiOFb8DPMYT7ReSd4wJirxvss8FsL
 5Q1UmvR0cVXnkK4vrCDyItwMgfZNE1BkgKwfVQWBaEl7yrJdF4olu4bM6O+JZNzVD/2t
 3qTQ==
X-Gm-Message-State: AOAM533q7El5yNBcREfqFetlp/fkqAvPSDtzh7I+DUqgbOxT+hH72Phj
 xo3FSblAZlYgdP9lxmdjyAaYtAk4MlD5SDDEOfc=
X-Google-Smtp-Source: ABdhPJyDbHNixeBukE5aPiglwr8vok7aJbSl6NlxqkJDSsm2S3NFATjBBkwB3FAEVtYFHvMfrSyk6o27aydT32p/XHU=
X-Received: by 2002:aed:2d65:: with SMTP id h92mr10793058qtd.263.1607395207466; 
 Mon, 07 Dec 2020 18:40:07 -0800 (PST)
MIME-Version: 1.0
References: <20201207164240.15436-1-jae.hyun.yoo@linux.intel.com>
 <20201207164240.15436-3-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20201207164240.15436-3-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Dec 2020 02:39:55 +0000
Message-ID: <CACPK8Xd3dz1WLGNGqMiAZxhMEeGHbkPtvO2rYQ36Kbj=Uvy-jA@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: aspeed: fix clock handling logic
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Michael Turquette <mturquette@baylibre.com>,
 Eddie James <eajames@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Stephen Boyd <sboyd@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 7 Dec 2020 at 16:33, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> Video engine uses eclk and vclk for its clock sources and its reset
> control is coupled with eclk so the current clock enabling sequence works
> like below.
>
>  Enable eclk
>  De-assert Video Engine reset
>  10ms delay
>  Enable vclk

This is the case after " clk: ast2600: fix reset settings for eclk and
vclk" is applied, correct? Without that patch applied the reset
sequence is correct by accident for the 2600, but it will be wrong for
the 2500?

> It introduces improper reset on the Video Engine hardware and eventually
> the hardware generates unexpected DMA memory transfers that can corrupt
> memory region in random and sporadic patterns. This issue is observed
> very rarely on some specific AST2500 SoCs but it causes a critical
> kernel panic with making a various shape of signature so it's extremely
> hard to debug.

I wasn't sure what you meant by "various shape of signature". Can you
elaborate, and/or share with us some examples of the signature?

> Moreover, the issue is observed even when the video
> engine is not actively used because udevd turns on the video engine
> hardware for a short time to make a query in every boot.
>
> To fix this issue, this commit changes the clock handling logic to make
> the reset de-assertion triggered after enabling both eclk and vclk. Also,
> it adds clk_unprepare call for a case when probe fails.
>
> Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

The code change looks correct and should be applied to stable.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/media/platform/aspeed-video.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index c46a79eace98..db072ff2df70 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -514,8 +514,8 @@ static void aspeed_video_off(struct aspeed_video *video)
>         aspeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff);
>
>         /* Turn off the relevant clocks */
> -       clk_disable(video->vclk);
>         clk_disable(video->eclk);
> +       clk_disable(video->vclk);
>
>         clear_bit(VIDEO_CLOCKS_ON, &video->flags);
>  }
> @@ -526,8 +526,8 @@ static void aspeed_video_on(struct aspeed_video *video)
>                 return;
>
>         /* Turn on the relevant clocks */
> -       clk_enable(video->eclk);
>         clk_enable(video->vclk);
> +       clk_enable(video->eclk);
>
>         set_bit(VIDEO_CLOCKS_ON, &video->flags);
>  }
> @@ -1719,8 +1719,11 @@ static int aspeed_video_probe(struct platform_device *pdev)
>                 return rc;
>
>         rc = aspeed_video_setup_video(video);
> -       if (rc)
> +       if (rc) {
> +               clk_unprepare(video->vclk);
> +               clk_unprepare(video->eclk);
>                 return rc;
> +       }
>
>         return 0;
>  }
> --
> 2.17.1
>
