Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 074CC7917E
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 18:54:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y5PN3lgRzDqRg
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 02:54:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UhM52LN5"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y5Np5SZNzDqJX
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 02:53:30 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id z3so2695589iog.0
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 09:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iCFQqYIsIHUuEI1zjQL1qrOWxSUO9qXF3sIVxAvbwSY=;
 b=UhM52LN5XGqZ/4g08xPziW3KDRUTEYB3xh9AsB6YP6onaqTgFL+t8JnUilZJPBphTf
 VOiFZ1mKxTZzB+w9GRMUJCcDgmVAkmgzg/fqacrvgcKw1pxSZI/ASWGFKY+JsovGG5aZ
 anR/x+yLweATOEOOXXqqan6a12Bl7TQmZUv20cb9ngMA0dQbIAIuURSuG2XxXZO8Fpf0
 7EXQVrPRBNrHaujN/NOSoT7yQIgaBEGpHNOCKA0kDeAs5y+MQg0/dUjIinn0pXB5Z6yY
 4wmMGaK7Hw7p8HsangTL0+vFadK5zWNpK1K7zzT3lEgPTemNiHCajcKlPd5Ykb2EmzNo
 EVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iCFQqYIsIHUuEI1zjQL1qrOWxSUO9qXF3sIVxAvbwSY=;
 b=Os/0+PdF8gbxmKIbe89m7OaJakT3tmcbeZB+tMbWfVvM5M0p+z8ObrrOB5Ta4N1eDt
 fxwkUZsNEekCdy+tduWkmzsFm0XqiStUva8Dtp468diOM/R0S3KY7uvaSM1Dyuz3Rogt
 bDT8GA1JAeswdfbUty5Qywvx7wnsZVt6GI+YuiB9Eyppx5w786Zp3wCst9ZLEbOD6E/H
 3y+G74541Q21DB9Hse2AZAPcPcdt4aHbSqfC1h/UmoI5YlNH5xJi02vCSMGppcXHG7dy
 w6XowrSdJLRoW18YWSqDpqQj+ALM93ymDdVeF7QKQ4Sjv8egXThqJNarfg+7JP0LQrA8
 Fq+A==
X-Gm-Message-State: APjAAAU2S9D4828U8KsGVQLsrFjI3ewqjwxa7YjAZW+WVnwcAsq8QSTW
 iS3uO6PZBaVi2g8KAU1Va8yXbChGIgTAklKQpw==
X-Google-Smtp-Source: APXvYqzZXOeuD12CYNHQ2l59sm2VPqnEtZIuLx75p0SpOLCZi3eb/xpaCQOIR5sti4CZP+hxeUxLHIx+meDoNv/SjSU=
X-Received: by 2002:a6b:f80e:: with SMTP id o14mr32870690ioh.1.1564419208818; 
 Mon, 29 Jul 2019 09:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190729164307.200716-1-avifishman70@gmail.com>
 <CAKKbWA6=9rBhR7iTfH27FZXPtuin9FengQh77T6Qgb3XDuZaYA@mail.gmail.com>
In-Reply-To: <CAKKbWA6=9rBhR7iTfH27FZXPtuin9FengQh77T6Qgb3XDuZaYA@mail.gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 29 Jul 2019 19:52:39 +0300
Message-ID: <CAKKbWA6K4=qL7i5i2_jhB7KHBX3D+YsREP7yECdgD4j6VZFrLg@mail.gmail.com>
Subject: Re: [PATCH] [v4] clocksource/drivers/npcm: fix GENMASK and timer
 operation
To: Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Avi Fishman <avifishman70@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Please discard this. my mail tool corruppted it again.

On Mon, Jul 29, 2019 at 7:50 PM Avi Fishman <avifishman70@gmail.com> wrote:
>
> NPCM7XX_Tx_OPER GENMASK bits where wrong,
> Since NPCM7XX_REG_TICR0 register reset value of those bits was 0,
> it did not cause an issue.
> in npcm7xx_timer_oneshot() the original NPCM7XX_REG_TCSR0 register was
> read again after masking it with ~NPCM7XX_Tx_OPER so the masking didn't
> take effect.
>
> npcm7xx_timer_periodic() was not wrong but it wrote to NPCM7XX_REG_TICR0
> in a middle of read modify write to NPCM7XX_REG_TCSR0 which is
> confusing.
> npcm7xx_timer_oneshot() did wrong calculation
>
> Signed-off-by: Avi Fishman <avifishman70@gmail.com>
> ---
>  drivers/clocksource/timer-npcm7xx.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clocksource/timer-npcm7xx.c
> b/drivers/clocksource/timer-npcm7xx.c
> index 8a30da7f083b..9780ffd8010e 100644
> --- a/drivers/clocksource/timer-npcm7xx.c
> +++ b/drivers/clocksource/timer-npcm7xx.c
> @@ -32,7 +32,7 @@
>  #define NPCM7XX_Tx_INTEN               BIT(29)
>  #define NPCM7XX_Tx_COUNTEN             BIT(30)
>  #define NPCM7XX_Tx_ONESHOT             0x0
> -#define NPCM7XX_Tx_OPER                        GENMASK(27, 3)
> +#define NPCM7XX_Tx_OPER                        GENMASK(28, 27)
>  #define NPCM7XX_Tx_MIN_PRESCALE                0x1
>  #define NPCM7XX_Tx_TDR_MASK_BITS       24
>  #define NPCM7XX_Tx_MAX_CNT             0xFFFFFF
> @@ -84,8 +84,6 @@ static int npcm7xx_timer_oneshot(struct
> clock_event_device *evt)
>
>         val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
>         val &= ~NPCM7XX_Tx_OPER;
> -
> -       val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
>         val |= NPCM7XX_START_ONESHOT_Tx;
>         writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);
>
> @@ -97,12 +95,11 @@ static int npcm7xx_timer_periodic(struct
> clock_event_device *evt)
>         struct timer_of *to = to_timer_of(evt);
>         u32 val;
>
> +       writel(timer_of_period(to), timer_of_base(to) + NPCM7XX_REG_TICR0);
> +
>         val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
>         val &= ~NPCM7XX_Tx_OPER;
> -
> -       writel(timer_of_period(to), timer_of_base(to) + NPCM7XX_REG_TICR0);
>         val |= NPCM7XX_START_PERIODIC_Tx;
> -
>         writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);
>
>         return 0;
> --
> 2.18.0



-- 
Regards,
Avi
