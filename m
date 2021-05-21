Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5097D38CC31
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 19:30:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fmtsy5QHCz300P
	for <lists+openbmc@lfdr.de>; Sat, 22 May 2021 03:30:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=U8Xx32Z9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::334;
 helo=mail-ot1-x334.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=U8Xx32Z9; dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmtsd1dpMz307D;
 Sat, 22 May 2021 03:30:12 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id
 g7-20020a9d12870000b0290328b1342b73so10864036otg.9; 
 Fri, 21 May 2021 10:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=3cHQshoSRpML0Ek6dpsO2JucuH3tmTIJE0nhspmFbUc=;
 b=U8Xx32Z9nJRtwl0YWSnCCX0Zz8T4me4pKes/z19oTTrw9uDHwJQ2EoiHlhVz16ZrvE
 0JgbouNGBTimn1XQHoXel4YOqaRd66kiiatXDnP6iIr0zc1ALRmwt/vUSUrUB+oUwBVQ
 Aq6FgXa5WhitobphM1xTDoNHMfxsaropm1eqC13wgwcDKnk/6USk2HicrhtRLZd89XB5
 4Z8heUrFQqheRprFQo3zIgWLPxdOAetR0FRq6BT7buUdKlFbCwGx5p45kgnbep/SzfCO
 orLy8mFJCqm+2c/JZaUFhwKBhIKbEEya1iBOptjBmRG7D/hBBVkQTncVaW6tpTCmmo6e
 dZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=3cHQshoSRpML0Ek6dpsO2JucuH3tmTIJE0nhspmFbUc=;
 b=rCfCZejARjuUjt6bH50li4ymYPYXsCuIxdio6RIaO8x7gOB/3xafozxsfe//Yzn2I9
 miLmZvafH2QyboGb3AB387oGDWRB8NlkDlYzuSQf65Y2DhCbZfJlI1CX+ZwH/CfNJCo4
 JR9DuPiKxc8kUuLKxHZK2OFiNc09UCZaeygHAcdP2FkLaM+BpmKnNb3EDYQsupQe1R5+
 F9XJIleS6bjxJ/7IjDEQu77j27Rwm1vHuoHYQ/Wdogx8mvPhGLUsvc0XTkyp8eQENSaV
 ED/LtWF0qfTW4je/vd2G3lN6mxyz4iIDwD9i4Ls9m0/IpUwTsrQtNElNMcLw52oov4YI
 JQfw==
X-Gm-Message-State: AOAM532N+2Jm4SdUVJqV0AkvYrCxvGvyYtvLSJvadqGtuojZufViJUE7
 AdMZZq6XGNt21E0yyEkJQw==
X-Google-Smtp-Source: ABdhPJx0oSMzcOmTN5MQp5noq4fPcvpmE8RyTgX1v71H/r0d2w7fD0hm22YN8n1WZ0UC1Q1CrAEr6w==
X-Received: by 2002:a9d:6548:: with SMTP id q8mr9359075otl.311.1621618210635; 
 Fri, 21 May 2021 10:30:10 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id a18sm1013020oiy.24.2021.05.21.10.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 10:30:10 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:9c8f:21cb:3961:b550])
 by serve.minyard.net (Postfix) with ESMTPSA id 9F583180105;
 Fri, 21 May 2021 17:30:08 +0000 (UTC)
Date: Fri, 21 May 2021 12:30:07 -0500
From: Corey Minyard <minyard@acm.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3 10/16] ipmi: kcs_bmc: Don't enforce single-open policy
 in the kernel
Message-ID: <20210521173007.GJ2921206@minyard.net>
References: <20210510054213.1610760-1-andrew@aj.id.au>
 <20210510054213.1610760-11-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510054213.1610760-11-andrew@aj.id.au>
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
Reply-To: minyard@acm.org
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, avifishman70@gmail.com, venture@google.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com,
 robh+dt@kernel.org, arnd@arndb.de, openipmi-developer@lists.sourceforge.net,
 zweiss@equinix.com, chiawei_wang@aspeedtech.com,
 linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 10, 2021 at 03:12:07PM +0930, Andrew Jeffery wrote:
> Soon it will be possible for one KCS device to have multiple associated
> chardevs exposed to userspace (for IPMI and raw-style access). However,
> don't prevent userspace from:
> 
> 1. Opening more than one chardev at a time, or
> 2. Opening the same chardev more than once.
> 
> System behaviour is undefined for both classes of multiple access, so
> userspace must manage itself accordingly.

I don't understand why you want to allow this.  If the second open won't
work right, then why allow it?  Why remove code that causes the second
open to error?

-corey

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
>  	struct kcs_bmc_client *client;
> -	irqreturn_t rc;
> +	irqreturn_t rc = IRQ_NONE;
>  
>  	spin_lock(&kcs_bmc->lock);
>  	client = kcs_bmc->client;
> -	if (client) {
> +	if (client)
>  		rc = client->ops->event(client);
> -	} else {
> -		u8 status;
> -
> -		status = kcs_bmc_read_status(kcs_bmc);
> -		if (status & KCS_BMC_STR_IBF) {
> -			/* Ack the event by reading the data */
> -			kcs_bmc_read_data(kcs_bmc);
> -			rc = IRQ_HANDLED;
> -		} else {
> -			rc = IRQ_NONE;
> -		}
> -	}
>  	spin_unlock(&kcs_bmc->lock);
>  
>  	return rc;
> @@ -81,26 +69,28 @@ EXPORT_SYMBOL(kcs_bmc_handle_event);
>  
>  int kcs_bmc_enable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client)
>  {
> -	int rc;
> -
>  	spin_lock_irq(&kcs_bmc->lock);
> -	if (kcs_bmc->client) {
> -		rc = -EBUSY;
> -	} else {
> +	if (!kcs_bmc->client) {
> +		u8 mask = KCS_BMC_EVENT_TYPE_IBF;
> +
>  		kcs_bmc->client = client;
> -		rc = 0;
> +		kcs_bmc_update_event_mask(kcs_bmc, mask, mask);
>  	}
>  	spin_unlock_irq(&kcs_bmc->lock);
>  
> -	return rc;
> +	return 0;
>  }
>  EXPORT_SYMBOL(kcs_bmc_enable_device);
>  
>  void kcs_bmc_disable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client)
>  {
>  	spin_lock_irq(&kcs_bmc->lock);
> -	if (client == kcs_bmc->client)
> +	if (client == kcs_bmc->client) {
> +		u8 mask = KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE;
> +
> +		kcs_bmc_update_event_mask(kcs_bmc, mask, 0);
>  		kcs_bmc->client = NULL;
> +	}
>  	spin_unlock_irq(&kcs_bmc->lock);
>  }
>  EXPORT_SYMBOL(kcs_bmc_disable_device);
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> index 8b223e58d900..8a0b1e18e945 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -414,8 +414,7 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, priv);
>  
> -	aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE),
> -				   KCS_BMC_EVENT_TYPE_IBF);
> +	aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE), 0);
>  	aspeed_kcs_enable_channel(kcs_bmc, true);
>  
>  	kcs_bmc_add_device(&priv->kcs_bmc);
> diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
> index f8b7162fb830..ab4a8caf1270 100644
> --- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
> +++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
> @@ -202,8 +202,7 @@ static int npcm7xx_kcs_probe(struct platform_device *pdev)
>  	if (rc)
>  		return rc;
>  
> -	npcm7xx_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE),
> -				    KCS_BMC_EVENT_TYPE_IBF);
> +	npcm7xx_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE), 0);
>  	npcm7xx_kcs_enable_channel(kcs_bmc, true);
>  
>  	pr_info("channel=%u idr=0x%x odr=0x%x str=0x%x\n",
> -- 
> 2.27.0
> 
