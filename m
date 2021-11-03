Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2945443B20
	for <lists+openbmc@lfdr.de>; Wed,  3 Nov 2021 02:47:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkV5S4zz8z2xvw
	for <lists+openbmc@lfdr.de>; Wed,  3 Nov 2021 12:47:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=SMxYX+Fj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2f;
 helo=mail-qv1-xf2f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=SMxYX+Fj; dkim-atps=neutral
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkV512DjGz2xBr;
 Wed,  3 Nov 2021 12:47:16 +1100 (AEDT)
Received: by mail-qv1-xf2f.google.com with SMTP id g25so1081226qvf.13;
 Tue, 02 Nov 2021 18:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iIfhELKBA59uYTnqWLZdOTQFhHkJ8JIZdnz4Zyo8KZw=;
 b=SMxYX+FjngAizwzwGf0p+JkubhUWAXjRGqDCq5xJ87DyiD+8mXCwqkH/x3YfF5f29A
 xevwGdPchS1Fi5DrS3aexlrF5yG9gmA/jq6IJ1EjgqIBOD1whwOwinm0pghiUuVjdAP6
 GKfcbgfSk7Xuh4KzSSzrACWz11mURursOpVtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iIfhELKBA59uYTnqWLZdOTQFhHkJ8JIZdnz4Zyo8KZw=;
 b=nTHDTeshtTBQ0cipDbTQ31ArJ+kcXTrE8JpcpEsqsHgKjpOIJXAjmbOOVHVj4MUw0W
 G7nacPu1qHdJgtZGRmMCEajr1Nafa+uXiZeEd8yT1dxrcMwQXjb6sn0bi32VcMhYljXh
 0sTig9t9OtP0PQrkRIYdJV4IFGI9vFdApi/8qk9wkp5Qn/5DoKJQICqHIhygqfJDPRew
 gZuK+Hm8vk1w7a0aBmasJfSny7VvLWStcg9252A1/oCUp/kmAX2fiYAKb1QxZKm7Oqym
 I65lYE2U9LGFPWwAVaaDdNDOCnxQ+UNLd4BKIJ7nWuEF9oG81qAEFVFauSVTwlqwwp4B
 9V+A==
X-Gm-Message-State: AOAM530nHknc3s9JezFb9TbgvfwYIwfLg8kPsqj36a/mgXVyshKInJD0
 pa1+jPV8wsMUG64KblVtins409jgl0NDcM9P298=
X-Google-Smtp-Source: ABdhPJxWUZEryVqXcBikybAoLyADEf6kRUtBPv82PFH52VOA75zBpO5PHr7kAAXN7A+FwtfuY0PHMm74kIpUVbkNYTQ=
X-Received: by 2002:a05:6214:5002:: with SMTP id
 jo2mr39450110qvb.27.1635904032986; 
 Tue, 02 Nov 2021 18:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211103011357.22067-1-jammy_huang@aspeedtech.com>
In-Reply-To: <20211103011357.22067-1-jammy_huang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 3 Nov 2021 01:47:01 +0000
Message-ID: <CACPK8XcuhVVvbs4m5k=1d6oFiewEo2RqqOqf5R72KJ4yjiEiUw@mail.gmail.com>
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

On Wed, 3 Nov 2021 at 01:13, Jammy Huang <jammy_huang@aspeedtech.com> wrote:
>
> aspeed_video_get_resolution() will try to do res-detect again if the
> timing got in last try is invalid. But it will always time out because
> VE_SEQ_CTRL_TRIG_MODE_DET is only cleared after 1st mode-detect.
>
> To fix the problem, just clear VE_SEQ_CTRL_TRIG_MODE_DET before setting
> it in aspeed_video_enable_mode_detect().
>
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
> v2:
>   - update commit message
> ---
>  drivers/media/platform/aspeed-video.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 5ffbabf884eb..fea5e4d0927e 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -518,6 +518,10 @@ static void aspeed_video_enable_mode_detect(struct aspeed_video *video)
>         aspeed_video_update(video, VE_INTERRUPT_CTRL, 0,
>                             VE_INTERRUPT_MODE_DETECT);
>
> +       /* Disable mode detect in order to re-trigger */
> +       aspeed_video_update(video, VE_SEQ_CTRL,
> +                           VE_SEQ_CTRL_TRIG_MODE_DET, 0);
> +
>         /* Trigger mode detect */
>         aspeed_video_update(video, VE_SEQ_CTRL, 0, VE_SEQ_CTRL_TRIG_MODE_DET);
>  }
> @@ -809,10 +813,6 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>                         return;
>                 }
>
> -               /* Disable mode detect in order to re-trigger */
> -               aspeed_video_update(video, VE_SEQ_CTRL,
> -                                   VE_SEQ_CTRL_TRIG_MODE_DET, 0);
> -
>                 aspeed_video_check_and_set_polarity(video);
>
>                 aspeed_video_enable_mode_detect(video);
> --
> 2.25.1
>
