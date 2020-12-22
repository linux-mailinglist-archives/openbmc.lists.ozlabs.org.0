Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E222E0564
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 05:35:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0Nn24zkNzDqQB
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 15:35:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=GrKyju7r; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0Nm60XHgzDqDl;
 Tue, 22 Dec 2020 15:34:42 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id z11so10935113qkj.7;
 Mon, 21 Dec 2020 20:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PmY1Zbvh4P5fvr7vf3dYvsRt7lpuDqOG99f8cRvMW2Y=;
 b=GrKyju7r5Q55J4AEUPA+SDTGZg+Q0Rl8bpjFEOY7Wf1W7lvAh+3vJzCVrUF51b8DOJ
 zMZtths6IEkGwaO9na4a4ouDj76WbiJDCdRm8q61C6r1Ubxb+5iNB2coHyViB+Gvs14J
 KggaDh8uAa9rgGhcc9pFidYBFp8jRHg8c2wBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PmY1Zbvh4P5fvr7vf3dYvsRt7lpuDqOG99f8cRvMW2Y=;
 b=NnknbJ0lrPTshxaxg5+7UN/Ko3Yq8lRgZOTn7If2NVArocEKMLOk39ODOzSq+16MeV
 /hL5M1YruGSBGYTLu6Jldva4GfK1E2uRKPNXOM1lYoZe8rngNgKebU8qFbJ4vYLvmc1B
 lY0rAHOcZau/NlbmEZApEv0InAPVUM2D/yCxampejK53PAHYMf7mQMqmAV+9/IWLPLIk
 w4n2110vmk4KNDYSCt3S6anmSgi6uRcEmORCAIrmzSHrL62MZ0VInjIKRzffcevo75NY
 ZHLUO/20kjQlgYD44SHljjXQjkEJeuSn8KKsIYe2jQKjeKN8VGuJloFGkeQdb4lMEY1y
 GXtw==
X-Gm-Message-State: AOAM530p/Zn7O7EigkLE76WifZ7JVirJus0DrWE1wvSK+gEOowmFvV/E
 ous6YYxiy9vo93y4bt3aJ4jC4cbKFEfJ+AyBVXo=
X-Google-Smtp-Source: ABdhPJwphoIU/ETccJ0+oBIrWPt5ewRHb2AZGa28DlUbwZupNShcyclpTxbkFNL6J4Za9zG8/A4dFQpfPCoTBgNIOyA=
X-Received: by 2002:a05:620a:4155:: with SMTP id
 k21mr20507246qko.55.1608611678607; 
 Mon, 21 Dec 2020 20:34:38 -0800 (PST)
MIME-Version: 1.0
References: <20201215024542.18888-1-zev@bewilderbeest.net>
 <20201215024542.18888-2-zev@bewilderbeest.net>
In-Reply-To: <20201215024542.18888-2-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 22 Dec 2020 04:34:26 +0000
Message-ID: <CACPK8XfPCjBbjM2V1oiD=di6MD6ewJs0NFewA0=kZfx_eL29gQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] aspeed-video: add error message for unhandled
 interrupts
To: Zev Weiss <zev@bewilderbeest.net>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, 
 Ryan Chen <ryan_chen@aspeedtech.com>
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
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 15 Dec 2020 at 02:46, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> This device seems to have a propensity for asserting interrupts that
> aren't enabled -- in addition to the CAPTURE_COMPLETE and FRAME_COMPLETE
> interrupts squashed in commit 65d270acb2d662c3346793663ac3a759eb4491b8,
> COMP_READY has also been observed.  Adding a message diagnosing what
> happened in the event of unhandled interrupt status bits should
> hopefully make the debugging process simpler for any others that pop up
> in the future.

Ryan, is this a known issue with the video engine hardware?

>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  drivers/media/platform/aspeed-video.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 7d98db1d9b52..eb02043532e3 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -562,6 +562,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>  {
>         struct aspeed_video *video = arg;
>         u32 sts = aspeed_video_read(video, VE_INTERRUPT_STATUS);
> +       u32 orig_sts = sts;
>
>         /*
>          * Resolution changed or signal was lost; reset the engine and
> @@ -639,6 +640,10 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>         if (sts & VE_INTERRUPT_FRAME_COMPLETE)
>                 sts &= ~VE_INTERRUPT_FRAME_COMPLETE;
>
> +       if (sts)
> +               dev_err_ratelimited(video->dev, "unexpected interrupt asserted:"
> +                                   " sts=%08x, orig_sts=%08x", sts, orig_sts);

Do you want to do this before clearing the FRAME and CAPTURE bits?

> +
>         return sts ? IRQ_NONE : IRQ_HANDLED;
>  }
>
> --
> 2.29.2
>
