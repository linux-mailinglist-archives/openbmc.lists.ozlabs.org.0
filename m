Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D50E1377EC7
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 10:57:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fdw0s5v2qz2yxF
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 18:57:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=Ugh8AVz0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=wak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Ugh8AVz0; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fdw0Y1Gcdz2ykM
 for <openbmc@lists.ozlabs.org>; Mon, 10 May 2021 18:56:58 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id c3so22217352lfs.7
 for <openbmc@lists.ozlabs.org>; Mon, 10 May 2021 01:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kHxzCY7AfSaUYaZPvpG+K8Mp6kNFmW6UZ5JKXBLrNBg=;
 b=Ugh8AVz0j/y5FVEguqnwoGJOVAd1Es46HaXVjCm7xkAS00hx7vQliT78eQXj9mMr9s
 cxqafO4XY9SMH2acz0fJP5sSxQrpfF4l8y176nbzSlB41Yh5PHy5ciDkJc1ILJ9eurQA
 nDIjqtZ6IZCDlYl5lyXzJClFzZQowPAISBZJg8wY0FQRM8hTUZNIhveCA3PrzuW0F5Kw
 CNvNS25btU/x70QJ1EWCWTaPtOLcIr0oYWpUSZgNtpgcZ9W+P4Do0lf+PU7SQIgbEP8B
 SDyu9pvay7yxBdreAdOpjacPGnEov/PW1hq3MRFH+gB3l6/kVB1CD2kUv9ub+Bkl0GSs
 bTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kHxzCY7AfSaUYaZPvpG+K8Mp6kNFmW6UZ5JKXBLrNBg=;
 b=QfUcA1iwAKK0u4CpLaybsoXCpG8DGzCxuRxD42/oJd+G5XBpse+OkF2ESZt+sAG59c
 9c3mQ8tToU+mFKMnSW8aNuX3yGWuyfg7VJiaYzoqEqlbZDlDKw8CtCC9SUW0XJExypnj
 IjNoqNBUBa7COUWsnA8HLyFR2jHRh3DiIpaSWxL3muQbI7JSJb6ZUTmh2lbLZnZdKhqR
 1PGKKtn2giyFnQLYqUk/rGugZnT69M4jNYzrvmHz/b1lwNz2Kyn3HLzCNUPBuPjYr/N6
 XAmAw7mVG9ZUEY/N6HKOPGFvWbWQKjUCNYsTGaVRWERlkjrE4uT54UuL5U/G8nkbAzCk
 9sWg==
X-Gm-Message-State: AOAM531QsJCXeG6oz3LJCVt0qybl4WK/FOwvBMBP3f3q+2PZ/15tGpVG
 0dVxqkygWTr/dTokXYqLT2829dskyTSQesZqJG1uxgyXbN9Pvg==
X-Google-Smtp-Source: ABdhPJyzBlUeqh1J5ZiWkCgXT+UNxnaIHuptCjp5y2JXyWv33x1gFMS9N+fkBcwPUdVsO7sIUBfBxkfTJFoNu2UV/L4=
X-Received: by 2002:ac2:58da:: with SMTP id u26mr16166775lfo.18.1620637011672; 
 Mon, 10 May 2021 01:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210510064955.1704652-1-andrew@aj.id.au>
 <20210510064955.1704652-11-andrew@aj.id.au>
In-Reply-To: <20210510064955.1704652-11-andrew@aj.id.au>
From: William Kennington <wak@google.com>
Date: Mon, 10 May 2021 01:56:40 -0700
Message-ID: <CAPnigKku-EjOnV9gsmnXzH=XZxSU78iLeccNbsK8k2_4b4UwSg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 v3 10/18] ipmi: kcs_bmc: Don't enforce
 single-open policy in the kernel
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Why would we want to change this? I personally think the original
mutual exclusion policy makes even more sense with multiple client
types, so that the upstack programs actually know when they are being
locked out. Having clients that are able to open the fd but remain
broken if they don't do higher level synchronization just feels like a
good way to have hard to understand behavior.

On Sun, May 9, 2021 at 11:56 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Soon it will be possible for one KCS device to have multiple associated
> chardevs exposed to userspace (for IPMI and raw-style access). However,
> don't prevent userspace from:
>
> 1. Opening more than one chardev at a time, or
> 2. Opening the same chardev more than once.
>
> System behaviour is undefined for both classes of multiple access, so
> userspace must manage itself accordingly.
>
> The implementation delivers IBF and OBF events to the first chardev
> client to associate with the KCS device. An open on a related chardev
> cannot associate its client with the KCS device and so will not
> receive notification of events. However, any fd on any chardev may race
> their accesses to the data and status registers.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/char/ipmi/kcs_bmc.c         | 34 ++++++++++-------------------
>  drivers/char/ipmi/kcs_bmc_aspeed.c  |  3 +--
>  drivers/char/ipmi/kcs_bmc_npcm7xx.c |  3 +--
>  3 files changed, 14 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
> index 7081541bb6ce..ad9ff13ba831 100644
> --- a/drivers/char/ipmi/kcs_bmc.c
> +++ b/drivers/char/ipmi/kcs_bmc.c
> @@ -55,24 +55,12 @@ EXPORT_SYMBOL(kcs_bmc_update_status);
>  irqreturn_t kcs_bmc_handle_event(struct kcs_bmc_device *kcs_bmc)
>  {
>         struct kcs_bmc_client *client;
> -       irqreturn_t rc;
> +       irqreturn_t rc = IRQ_NONE;
>
>         spin_lock(&kcs_bmc->lock);
>         client = kcs_bmc->client;
> -       if (client) {
> +       if (client)
>                 rc = client->ops->event(client);
> -       } else {
> -               u8 status;
> -
> -               status = kcs_bmc_read_status(kcs_bmc);
> -               if (status & KCS_BMC_STR_IBF) {
> -                       /* Ack the event by reading the data */
> -                       kcs_bmc_read_data(kcs_bmc);
> -                       rc = IRQ_HANDLED;
> -               } else {
> -                       rc = IRQ_NONE;
> -               }
> -       }
>         spin_unlock(&kcs_bmc->lock);
>
>         return rc;
> @@ -81,26 +69,28 @@ EXPORT_SYMBOL(kcs_bmc_handle_event);
>
>  int kcs_bmc_enable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client)
>  {
> -       int rc;
> -
>         spin_lock_irq(&kcs_bmc->lock);
> -       if (kcs_bmc->client) {
> -               rc = -EBUSY;
> -       } else {
> +       if (!kcs_bmc->client) {
> +               u8 mask = KCS_BMC_EVENT_TYPE_IBF;
> +
>                 kcs_bmc->client = client;
> -               rc = 0;
> +               kcs_bmc_update_event_mask(kcs_bmc, mask, mask);
>         }
>         spin_unlock_irq(&kcs_bmc->lock);
>
> -       return rc;
> +       return 0;
>  }
>  EXPORT_SYMBOL(kcs_bmc_enable_device);
>
>  void kcs_bmc_disable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client)
>  {
>         spin_lock_irq(&kcs_bmc->lock);
> -       if (client == kcs_bmc->client)
> +       if (client == kcs_bmc->client) {
> +               u8 mask = KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE;
> +
> +               kcs_bmc_update_event_mask(kcs_bmc, mask, 0);
>                 kcs_bmc->client = NULL;
> +       }
>         spin_unlock_irq(&kcs_bmc->lock);
>  }
>  EXPORT_SYMBOL(kcs_bmc_disable_device);
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> index fade0e2faf2c..2c88b34b803c 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -414,8 +414,7 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, priv);
>
> -       aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE),
> -                                  KCS_BMC_EVENT_TYPE_IBF);
> +       aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE), 0);
>         aspeed_kcs_enable_channel(kcs_bmc, true);
>
>         kcs_bmc_add_device(&priv->kcs_bmc);
> diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
> index f8b7162fb830..ab4a8caf1270 100644
> --- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
> +++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
> @@ -202,8 +202,7 @@ static int npcm7xx_kcs_probe(struct platform_device *pdev)
>         if (rc)
>                 return rc;
>
> -       npcm7xx_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE),
> -                                   KCS_BMC_EVENT_TYPE_IBF);
> +       npcm7xx_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE), 0);
>         npcm7xx_kcs_enable_channel(kcs_bmc, true);
>
>         pr_info("channel=%u idr=0x%x odr=0x%x str=0x%x\n",
> --
> 2.27.0
>
