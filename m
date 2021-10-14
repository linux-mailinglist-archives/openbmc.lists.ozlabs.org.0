Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B23A42D437
	for <lists+openbmc@lfdr.de>; Thu, 14 Oct 2021 09:55:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVMCC5NLmz2yYd
	for <lists+openbmc@lfdr.de>; Thu, 14 Oct 2021 18:55:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=c8HDm9oI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=c8HDm9oI; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVMBr3ygSz2yLV
 for <openbmc@lists.ozlabs.org>; Thu, 14 Oct 2021 18:55:15 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id bl14so4696296qkb.4
 for <openbmc@lists.ozlabs.org>; Thu, 14 Oct 2021 00:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Dp7Fcvwsy95kPtN9qloRAs+U2licOB8bLuB3K/mNLQ=;
 b=c8HDm9oI7mqc1HGS7HKUIk3I9S1wbuGvXDOXlXiPpckhCIGsX4fxeBsMZ3z8SyhWsF
 H/sMafKWL9dkR4vJ9Lm6aIwxG5q0/LcfjzB6ug8xoEo8Y9JAhVTa2jD2LnxZCGkZS4cv
 Tn84riu5Ci7rN6gwmnbDqZQAa1BqNL2enTIQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Dp7Fcvwsy95kPtN9qloRAs+U2licOB8bLuB3K/mNLQ=;
 b=zLfzsEe5nNBZB96hAlSakkbeAnmYrIhEgWTSLFXbYebpNJvdgG6EtDYxLBsYE66CnG
 Ejb5+h/1vhD8zzzgfKNb9q8vjgL4Uka998R8DPffgDMFIiTLJ0RwMkr+KMFiCH2PrQmA
 qFeEcANRSAKoYEIJ8NciYzYjEO+0HGpPKpuMtr79eRok7ujgwgrc7lMOQ2M9uihNFtBz
 g7j5Nr76TCGSJnWdtWO8FmvauSDXTo9ymzfwmDsN7RLI4J7XqxkDR4EMFvPvRAc9z3tb
 1ociGJw9r4NiJ5aOzpGqou1UitzFGZJ5g4kil8+cBMBavnA6H195p9ZI5Yb65UGKFt4z
 sMEA==
X-Gm-Message-State: AOAM533uffDUVV2cO+SQHaR+Y8+OpEXh9icDDInOGbz2XEiPd5tEbz1U
 w7D3teSOu+z6/YovMTqmn82qADm4VUaQEsFgk+48hiah
X-Google-Smtp-Source: ABdhPJwQi1wcmA3xQ70fr9TNeUHUQMJiEvelGOV8fxT6+hHd1SrfyWo3vOQdUgibOOGSSas3lGVvYoLvEgECq10x7yE=
X-Received: by 2002:a37:68c4:: with SMTP id d187mr3481646qkc.36.1634198111931; 
 Thu, 14 Oct 2021 00:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211014072743.939293-1-wangzhiqiang02@inspur.com>
In-Reply-To: <20211014072743.939293-1-wangzhiqiang02@inspur.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 14 Oct 2021 07:55:00 +0000
Message-ID: <CACPK8XcO6==apQyCR7JZWf+u2JaYemOW23z22g0oKsGga99etg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: fp5280g2: Use the 64M layout
To: John Wang <wangzq.jn@gmail.com>
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
 George Liu <liuxiwei1013@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 14 Oct 2021 at 07:27, John Wang <wangzq.jn@gmail.com> wrote:
>
> Use the 64M layout since the flash on the board is 64M
>
> Signed-off-by: John Wang <wangzhiqiang02@inspur.com>

Thanks, merged to dev-5.14. I've also put it in the tree for v5.16.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> index 1752f3250e44..4574dcd72df8 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> @@ -245,7 +245,7 @@ flash@0 {
>                 label = "bmc";
>                 m25p,fast-read;
>                 spi-max-frequency = <50000000>;
> -#include "openbmc-flash-layout.dtsi"
> +#include "openbmc-flash-layout-64.dtsi"
>         };
>  };
>
> --
> 2.30.2
>
