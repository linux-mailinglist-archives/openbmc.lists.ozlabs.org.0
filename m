Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9742E057A
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 05:48:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0P443sWZzDqQ1
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 15:48:36 +1100 (AEDT)
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
 header.s=google header.b=VklhxX/o; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0P3D04G3zDqQm;
 Tue, 22 Dec 2020 15:47:51 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id c7so10991102qke.1;
 Mon, 21 Dec 2020 20:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jhzT8c0zSzP0ywXe5TKHFtbJ3WCUgeB9D75CgQh7hjY=;
 b=VklhxX/oiWTdbSURqiK31rNW6JMHcT6Ep31a432CZZQM0IvJFJX2k1+IATEO2ePMz7
 xz/E+mLiY1Dm5reX4xJ1Xl+eVifZhfkDgdKLX1GnwL82vb5VwQxda/MUOU/imtaJDb21
 JewxqSqvO27q/0USJ6ebhXPsW8ZQM1bWtpoS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jhzT8c0zSzP0ywXe5TKHFtbJ3WCUgeB9D75CgQh7hjY=;
 b=LTZOXXtrCseV6s759O9/x00BqugpAZG1f89j8vP7++RxgeDN0WhshseyATXMp9X/2G
 2KU0/0SUQWsue4ptGBHlCFqTkZh4HR2qO1j8ivjQtarBHwnl164AbdJokRwQmrbnDlgk
 npOdLcwojeWbj7vQkiA+RAwcIqfPwnMkeGiIxUMczAYpTz++Vd3NgHNBnHf0FBVWRKpJ
 FUc5XbnvZvhPTSa/E0MbT8/30BnC7qfda1RVkW+bD1/QGtx2Iax3ZwLUt/DBebBFCEal
 Ebk0XBqz1tE/Bj74IvusIUonP/PhEAuS/pvf5uxyKM9Ypv0wHOLqXVduILuv6phpjGPh
 sBqg==
X-Gm-Message-State: AOAM531cOaPbX9Rqdw/BiBv9x0aCfgFtVSkrw6ANWp0G3cVZ8O+mL9jp
 3XV26eam3WZIQjiyMiW0beM/Ia9BlapAVMNe+V0=
X-Google-Smtp-Source: ABdhPJzD0mDzK0fUtV/9AAtwg4ua0v3wjsKGJfAQ/B8NgTaVsPevS7zOz/Ys2pLUkzNHs67W6zSSHmAlRj/2PPj9vaY=
X-Received: by 2002:a05:620a:4155:: with SMTP id
 k21mr20539624qko.55.1608612469458; 
 Mon, 21 Dec 2020 20:47:49 -0800 (PST)
MIME-Version: 1.0
References: <20201215024542.18888-1-zev@bewilderbeest.net>
 <20201215024542.18888-3-zev@bewilderbeest.net>
In-Reply-To: <20201215024542.18888-3-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 22 Dec 2020 04:47:37 +0000
Message-ID: <CACPK8XczCUgqOENABoDbc-qwbMxOh=1OUyBtuHSmDG_Zo571Wg@mail.gmail.com>
Subject: Re: [PATCH 2/3] aspeed-video: clear spurious interrupt bits
 unconditionally
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 15 Dec 2020 at 02:46, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> Instead of testing and conditionally clearing them one by one, we can
> instead just unconditionally clear them all at once.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

I had a poke at the assembly and it looks like GCC is clearing the
bits unconditionally anyway, so removing the tests provides no change.

Combining them is a good further optimization.

Reviewed-by: Joel Stanley <joel@jms.id.au>

A question unrelated to this patch: Do you know why the driver doesn't
clear the status bits in the interrupt handler? I would expect it to
write the value of sts back to the register to ack the pending
interrupt.

> ---
>  drivers/media/platform/aspeed-video.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index eb02043532e3..218aae3be809 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -558,6 +558,14 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
>         schedule_delayed_work(&video->res_work, delay);
>  }
>
> +/*
> + * Interrupts that we don't use but have to explicitly ignore because the
> + * hardware asserts them even when they're disabled in the VE_INTERRUPT_CTRL
> + * register.
> + */
> +#define VE_SPURIOUS_IRQS \
> +       (VE_INTERRUPT_CAPTURE_COMPLETE | VE_INTERRUPT_FRAME_COMPLETE)
> +
>  static irqreturn_t aspeed_video_irq(int irq, void *arg)
>  {
>         struct aspeed_video *video = arg;
> @@ -630,15 +638,8 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>                         aspeed_video_start_frame(video);
>         }
>
> -       /*
> -        * CAPTURE_COMPLETE and FRAME_COMPLETE interrupts come even when these
> -        * are disabled in the VE_INTERRUPT_CTRL register so clear them to
> -        * prevent unnecessary interrupt calls.
> -        */
> -       if (sts & VE_INTERRUPT_CAPTURE_COMPLETE)
> -               sts &= ~VE_INTERRUPT_CAPTURE_COMPLETE;
> -       if (sts & VE_INTERRUPT_FRAME_COMPLETE)
> -               sts &= ~VE_INTERRUPT_FRAME_COMPLETE;
> +       /* Squash known bogus interrupts */
> +       sts &= ~VE_SPURIOUS_IRQS;
>
>         if (sts)
>                 dev_err_ratelimited(video->dev, "unexpected interrupt asserted:"
> --
> 2.29.2
>
