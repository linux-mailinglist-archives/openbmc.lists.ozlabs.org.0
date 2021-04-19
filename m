Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AF436420C
	for <lists+openbmc@lfdr.de>; Mon, 19 Apr 2021 14:50:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP69F74zZz2yYg
	for <lists+openbmc@lfdr.de>; Mon, 19 Apr 2021 22:50:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=l6FC7Ua1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f30;
 helo=mail-qv1-xf30.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=l6FC7Ua1; dkim-atps=neutral
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP68z4v66z2xVt
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 22:49:54 +1000 (AEST)
Received: by mail-qv1-xf30.google.com with SMTP id x27so16792542qvd.2
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 05:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w2n6dUtA1rKXLo131YjOoiKnBTV2seyqWX7KoGaAIuU=;
 b=l6FC7Ua1IBE+Dby0+67xCz0mkRwudLS29YnxrYFvuQLmdtKgaxG6k1BuoaVoKugsvf
 pQtF+jPijWVVnD9f/pu4RDl0CafqbZ+yf+dmdCDpuNFObZyN+JMjTaNVfGPOksyz6oYN
 VIZ/6Hop4U04j/hq4KDyI5/lkgZJt+3+LOUCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w2n6dUtA1rKXLo131YjOoiKnBTV2seyqWX7KoGaAIuU=;
 b=YTMHbN+rE+kQjD0aVAQvMRH9tKrT6CZgPmt+4mBMKLOdaAxB8bqJahETfyfzUnL/t/
 jipJ3V9jmA0pdbhV+0YLHA8+fOv0//1LJye4Ue0XvDmscVQ1cxyiwbSJsLeQYi/tYKcE
 Ny3TozTRHnQu9rLOKQVFwQTFvetEA9s91WPiRAYnU0CPR+0SNyk/x4lqbWP+sxs2T/f4
 iE070+Enz1h89FH49LczMpDDweqCrH80ZUkcRWR8FPL0t+PwflsqQJ7Q5O8so1cgqLWo
 ayLnCrkuCdDlcrVlPc9IpB/toExdNltVhDhkMh3viucU2UHo6r3Vd9J0L/xp27mdL8nc
 pLeQ==
X-Gm-Message-State: AOAM531aAaJfR437zswKieqztUW+HfkYJT0ylFa0TGXvKlFQbFef3X67
 sn2qszc7D1dNmM5ak4uccPO2jVFXw6oFG1njtEk=
X-Google-Smtp-Source: ABdhPJxaV7xKu3A8eK1LxV7NuURHd+6/oyDyK3wEG1YiSDZoVmXX7P3CF3MBtNjt2UgOaF3Bah1YIHPKr+GA1VVHCL8=
X-Received: by 2002:a0c:d786:: with SMTP id z6mr20660494qvi.18.1618836591061; 
 Mon, 19 Apr 2021 05:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210413080755.73572-1-joel@jms.id.au>
 <20210413080755.73572-11-joel@jms.id.au>
 <cacf13c1-91b2-ad51-606e-bb208d13ec36@linux.vnet.ibm.com>
 <9779de4a-6985-8b94-9fb6-55c74a7a722f@linux.vnet.ibm.com>
 <CACPK8XcNyXUhe=43NCR1RzrexJGYWw2S-kXWsYDzNYAJujnmpg@mail.gmail.com>
 <001cda88-6e0f-cd48-d274-3764d0ceb18d@linux.vnet.ibm.com>
In-Reply-To: <001cda88-6e0f-cd48-d274-3764d0ceb18d@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 19 Apr 2021 12:49:38 +0000
Message-ID: <CACPK8XdHNDv8ELvKR9jEps7eR8Lj0n0hXp-TL48kDWWUyMH26g@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 10/11] crypto: Add driver
 for Aspeed HACE
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 15 Apr 2021 at 21:38, Klaus Heinrich Kiwi
<klaus@linux.vnet.ibm.com> wrote:
>
>
>
> On 4/14/2021 11:32 PM, Joel Stanley wrote:
> >> Another interesting thing is that the SPL tries to boot from UART, but neither
> >> my fitImages, Legacy images or even RAW images are working.. Not sure if we need
> >> some special handling of those images before feeding them to the spl ymodem loader?
> > I wasn't able to get the SPL to load any images - raw binaries or FIT
> > - from eMMC either. Something is going wrong, but I am unsure what it
> > is. I will continue to debug.
>
> I was able to make it work on real hardware (rainier100) with the following changes
> (in addition to the other fixups already mentioned in this thread):
>
>  From a2a2819455ec5de689fd0702cce20bfb18ec11b1 Mon Sep 17 00:00:00 2001
> From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> Date: Thu, 15 Apr 2021 15:16:37 -0300
> Subject: [PATCH] HACE fixups:
>
>   * The AST2600 workbook mentions that the list structure passed to
>     ASPEED_HACE_HASH_SRC needs to be 8-byte aligned. Normally, glibc's
>     malloc() would always align memory to (at least) 8-bytes, but that's
>     the case with u-boot's pre-sdram malloc() implementation. So we need
>     to explicitly align the context to 8-bytes with malign().

We're not using the HACE engine pre-SDRAM, so we should be ok.

common/dlmalloc.c:

    8-byte alignment is guaranteed by normal malloc calls, so don't
    bother calling memalign with an argument of 8 or less.

Were you able to observe any allocations that were not aligned?

>
>   * The __atribute__ ((align 8)) doesn't have an effect in struct
>     elements. Remove it.

Agreed.

>
>   * Since the struct aspeed_hash_ctx->list element is what we need to
>     make sure is aligned to 9-bytes, move that to the first element of
>     the array, and call-out the fact that this needs to be aligned in
>     the declaration.

9 bytes? Did you mean 8?

Regardless, the array in the structure should be aligned as there will
be no padding earlier in the struct. I have added a runtime check for
this and have not hit that in my testing so far.

>
>    * Clear HACE_HASH_ISR before issuing new command

This makes sense.

I will send out a new series for review. I've tested it thoroughly in
qemu, and have tested the u-boot -> Linux path on hardware.

Cheers,

Joel

>
> Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> ---
>   drivers/crypto/aspeed_hace.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/crypto/aspeed_hace.c b/drivers/crypto/aspeed_hace.c
> index 473d4d7391..0551fe6c83 100644
> --- a/drivers/crypto/aspeed_hace.c
> +++ b/drivers/crypto/aspeed_hace.c
> @@ -51,12 +51,19 @@ struct aspeed_sg {
>         u32 addr;
>   };
>
> +
> +/*
> + * Note: element 'list' below needs to be 8-byte aligned,
> + *       keep it as the first element so that we can always
> + *       guarantee that when allocating the struct (that should
> + *       also be 8-byte aligned)
> + */
>   struct aspeed_hash_ctx {
> +       struct aspeed_sg list[ASPEED_MAX_SG];
>         u32 method;
>         u32 digest_size;
>         u32 len;
>         u32 count;
> -       struct aspeed_sg list[ASPEED_MAX_SG] __attribute__((aligned(8)));
>   };
>
>   struct aspeed_hace {
> @@ -85,6 +92,9 @@ static int digest_object(const void *src, unsigned int length, void *digest,
>                 return -EINVAL;
>         }
>
> +       /* clear any pending interrupt */
> +       writel(HACE_HASH_ISR, base + ASPEED_HACE_STS);
> +
>         writel((u32)src, base + ASPEED_HACE_HASH_SRC);
>         writel((u32)digest, base + ASPEED_HACE_HASH_DIGEST_BUFF);
>         writel(length, base + ASPEED_HACE_HASH_DATA_LEN);
> @@ -145,12 +155,13 @@ int hw_sha_init(struct hash_algo *algo, void **ctxp)
>                 return -ENOTSUPP;
>         }
>
> -       ctx = calloc(1, sizeof(*ctx));
> +       ctx = memalign(8, sizeof(struct aspeed_hash_ctx));
>
>         if (ctx == NULL) {
>                 debug("Cannot allocate memory for context\n");
>                 return -ENOMEM;
>         }
> +       ctx->len = ctx->count = 0;
>         ctx->method = method | HACE_SG_EN;
>         ctx->digest_size = algo->digest_size;
>         *ctxp = ctx;
> --
> 2.25.1
>
>
>
>
>
> --
> Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
