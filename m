Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1461ADA59F
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 08:30:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tznP2RG2zDqc4
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 17:30:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="hCsUWOgc"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tzmh1nyzzDqHG
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 17:30:09 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id f16so851435qkl.9
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 23:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0lIjuNNOx5MkPlzYvhSkqCyHs1z6UpcpPep0ii4aKIc=;
 b=hCsUWOgcC1SMoYoCKvs1YT0QkcV+IX+c77lqnYYJ0dEfLoCl/O1qHA+hmwphjKgtYW
 3RzzBxeo8mQ78ObuPPzrY4ICrhf11jR05FPa/xmOPdp37qPDHE/t7aIwDhMFUaKDxdmo
 aKJ2IlT82Wbax4Dr0Ce47YEHleVTCXonrHh5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0lIjuNNOx5MkPlzYvhSkqCyHs1z6UpcpPep0ii4aKIc=;
 b=mkag42Hz0fdN91oDaylpkpFNmB5dDUm//f+vD4XK0NUp9p+bnBHbTEa3G/pZrcprGJ
 hmsckTT8vxMTm7blSV1tbYnBYqlBgh4JbpiKEu3DEWdDJz9J3S+r33Rgut/zfzm2RDRr
 57U+I2p6tBgmKVGAP+rFUnV7qNqfOHlhT5uOUzKlYLEVG1mramiDJxyHZK8tim42ZtfN
 z4hEs29n9ElNwXn9lfEWSVe/FB+MjuXlGUUEJysHnB6OTA/c3j8Ub8T4GavdL1h5jZro
 TgBbOUPKUQX4ZhuVdaQryy7jFTMXNVTgrwzquTpcDJow/uHEswWmJD3jLin9E/aDgLaG
 9Q8g==
X-Gm-Message-State: APjAAAXPhy3PfpEYcnyjKd4rDdawl6aGHSbKo8IzsfQN8eXYQd9qDsk1
 Hlgz38kQvsszvH/k5GjupN1VGnkugkMIjLkiUtqcNszr
X-Google-Smtp-Source: APXvYqzZzVX1liMpwM8Gr34TEbEVFYKGQEE6cBlCzP6/ssLwtsuTYoOWX6D03XKMsk6QMD4g5ITcuWPh4ZQq2n4ND2k=
X-Received: by 2002:a37:4dca:: with SMTP id a193mr1810773qkb.292.1571293805724; 
 Wed, 16 Oct 2019 23:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191017062544.25110-1-andrew@aj.id.au>
In-Reply-To: <20191017062544.25110-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Oct 2019 06:29:53 +0000
Message-ID: <CACPK8Xe=q_rxYjgiGtY1i0KRmxJiZnbL7E0mTZ=4BMFrsZS_Ug@mail.gmail.com>
Subject: Re: [PATCH qemu aspeed-4.2] hw/arm/aspeed: Fix STRAP2 configuration
 for Tacoma
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 17 Oct 2019 at 06:24, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> We were writing the STRAP2 configuration to the STRAP1 property/register
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Nice, I have the same patch in my tree, and forgot about it.

Reviewed-by: Joel

> ---
>  hw/arm/aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index ad86ef2eccec..807868224c6c 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -711,7 +711,7 @@ static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data)
>      mc->desc       = "Aspeed AST2600 EVB (Cortex A7)";
>      amc->soc_name  = "ast2600-a0";
>      amc->hw_strap1 = TACOMA_BMC_HW_STRAP1;
> -    amc->hw_strap1 = TACOMA_BMC_HW_STRAP2;
> +    amc->hw_strap2 = TACOMA_BMC_HW_STRAP2;
>      amc->fmc_model = "mx66l1g45g";
>      amc->spi_model = "mx66l1g45g";
>      amc->num_cs    = 2;
> --
> 2.20.1
>
