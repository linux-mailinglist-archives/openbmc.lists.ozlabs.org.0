Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E549C3F6D5C
	for <lists+openbmc@lfdr.de>; Wed, 25 Aug 2021 04:15:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvV1F6yD5z2yJS
	for <lists+openbmc@lfdr.de>; Wed, 25 Aug 2021 12:14:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=PHELEcFG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::c35;
 helo=mail-oo1-xc35.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=PHELEcFG; dkim-atps=neutral
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvV0p1gT9z2xgN
 for <openbmc@lists.ozlabs.org>; Wed, 25 Aug 2021 12:14:31 +1000 (AEST)
Received: by mail-oo1-xc35.google.com with SMTP id
 z1-20020a4a2241000000b0028e8dfb83b4so4336103ooe.13
 for <openbmc@lists.ozlabs.org>; Tue, 24 Aug 2021 19:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EqCJDw6pwwqcA3u963UfsU6r31LKcgwNEuHo0x3pVt4=;
 b=PHELEcFGD+KCRb+ykFErfan7cTCGvFBynYZyiUM07izhx1J9Dq48E13dItIRSbzf9x
 mmKfAhGY3hJVqpeCLG7FVGeNzdNi/MugPEQFQqpNWcXzD6B7Ab7VXgW/PicyapTAAyF9
 DdnTKClFljT2/ZCX45WzsUVpEA8I0CaevOmLhY9joRwuYZR/jJ3VAevFyest4vAK3eSn
 1BXS9KeFieeeVlpfVRdUeYDe1U9Gk9y+zjK+V0TAaeOjhnkDK4SIrWetY4U0kHnQKIZc
 mFJsFVl8X5oia0wgoD0RwQRu2rVd3CtAVyWR9pr6G5fcbfdN+wNY830dyECo+EuBM7UE
 CX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EqCJDw6pwwqcA3u963UfsU6r31LKcgwNEuHo0x3pVt4=;
 b=eGYhei+VRiyX80VRxpJHZQ0GABVYX/t3A4E0XGr+hkbGOVLDA3bx5k2NRlusJ11yDK
 Yqsn6Ldq3WXNRoGqQqRdQNiuNnVHghPE7yazfKO1PwMIqGwfc6ENKq/MZGgIkp6/+Kwm
 HsKCyNK2HVjwz07jpz5cdPnX0z2ESik3w9awupNMUQMf824Xd0AXnWTN5DsU1B3nB29E
 NOYA1YcP3/bQHEHVShCZkCmlsJBfyPwVSbDL9gff21fnyXqbnk5VSe2m59CIExr0hUTR
 VUIUytIgTI7nE63XJYyXErNBUfVMO7QtucO6E5GbzPaaKIBy7EtOXkAP88lKj557CI5S
 7ZRw==
X-Gm-Message-State: AOAM531CbXNJSmgZLpB9nEo8l0E476p//bqUXFFo/9nQITlpVfbgSu2u
 tHxIftAaEI5kQw9S0ky6rzN18c7KSrqVxWRm0ph/CQ==
X-Google-Smtp-Source: ABdhPJwGdyLaOrvtYRVGttPSukOVCRVyx+hg8mPlVBNhC/K0UG/FYc5Wa1O4T8axKx/aN0mDFUp1YoufiSBg5dsuJnI=
X-Received: by 2002:a4a:754b:: with SMTP id g11mr32762267oof.10.1629857667201; 
 Tue, 24 Aug 2021 19:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210617220229.7352-1-zev@bewilderbeest.net>
In-Reply-To: <20210617220229.7352-1-zev@bewilderbeest.net>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 25 Aug 2021 10:14:16 +0800
Message-ID: <CAGm54UEvQG9_AiL_o9R3ZVpF4oT0Te7DC+oHLWsNGrwVuCfJJw@mail.gmail.com>
Subject: Re: [Phishing Risk] [External] [PATCH v3] media: aspeed-video: ignore
 interrupts that aren't enabled
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>, openbmc <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>, open list <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jun 18, 2021 at 6:02 AM Zev Weiss <zev@bewilderbeest.net> wrote:
>
> As partially addressed in commit 65d270acb2d6 ("media: aspeed: clear
> garbage interrupts"), the ASpeed video engine sometimes asserts
> interrupts that the driver hasn't enabled.  In addition to the
> CAPTURE_COMPLETE and FRAME_COMPLETE interrupts dealt with in that
> patch, COMP_READY has also been observed.  Instead of playing
> whack-a-mole with each one individually, we can instead just blanket
> ignore everything we haven't explicitly enabled.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>
> Changes since v2 [1]:
>  - minor commit message improvements
>
> Changes since v1 [0]:
>  - dropped error message
>  - switched to a blanket-ignore approach as suggested by Ryan
>
> [0] https://lore.kernel.org/linux-arm-kernel/20201215024542.18888-1-zev@bewilderbeest.net/
> [1] https://lore.kernel.org/openbmc/20210506234048.3214-1-zev@bewilderbeest.net/
>
>  drivers/media/platform/aspeed-video.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 7bb6babdcade..77611c296a25 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -563,6 +563,12 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>         struct aspeed_video *video = arg;
>         u32 sts = aspeed_video_read(video, VE_INTERRUPT_STATUS);
>
> +       /*
> +        * Hardware sometimes asserts interrupts that we haven't actually
> +        * enabled; ignore them if so.
> +        */
> +       sts &= aspeed_video_read(video, VE_INTERRUPT_CTRL);
> +

Without the patch, the driver gets an unhandled IRQ in a few hours
after the KVM page is opened.
This patch is tested on Bytedance's OpenBMC system and the issue has
not been reproduced anymore.

Tested-by: Lei YU <yulei.sh@bytedance.com>

-- 
BRs,
Lei YU
