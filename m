Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B69443567C
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 01:26:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZRZj6N6mz307l
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 10:26:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=mCnnSO6H;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=mCnnSO6H; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZRZM1mr8z2xt5
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 10:26:18 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id b15so4715278qkl.10
 for <openbmc@lists.ozlabs.org>; Wed, 20 Oct 2021 16:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hRg9RErBQNfvImSoD9a7pAywYG5AiygovHCZO0C5pPQ=;
 b=mCnnSO6HmZLwNdGrfwJ9/VIqiVIu7XBBd6i4k9v4iTWmKNWwIE43hLXeuh32TZtvjw
 /IfQXMyQQ87ZXITtm46QYkiBtwJAZROT6p+xAZf/WSK/1MEZhokpEPyvQTTMP2CVN8FZ
 Oy1o4mbQKnmzHR/GGcI7DzPEHmK+2+cQJV2Z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hRg9RErBQNfvImSoD9a7pAywYG5AiygovHCZO0C5pPQ=;
 b=4Vtw+bbMBlfzc6tj00rluXj9mu3wYKIVtcwcJ9ru9VnXJuKwhbwqcaCIeD0qAbKnbs
 PAepCImGS37rtz+5VShTkJPxTJYpW4ruFG/WKx+8G6ROdOfiLRzEgpDCKwd3pC+/r8jx
 5yY8mI9X/oCsFym7litsB6yO9BLzebgrbda+b1OFpVNQLk4cdjQWoHke26dFk8t6vGbz
 WHiNsD4H36bVzA2EQx7eYAuDUh/lJECyfhV8HDP1ag7QNBe5KUjZlvlK8SmY/WyLU82D
 +gW1AxQdwwt3tAbucJ2DJelI/OZ7K/3QQ5jvfo7HnlQUwLiinZhBCTzvwT2i1R8oFHB7
 Pxqg==
X-Gm-Message-State: AOAM5325jCUB08lB4vRozh09rTtswgvumQhgmtd1cxv0j8kbjqqWJ3C5
 Zo2uBjuA54+bg2DpIvdAFM4UyJvKgyRoPkjDzu4=
X-Google-Smtp-Source: ABdhPJxVn20TzlFa1CiFNV4BNJd8mB1V9ucqd5q/PHRTFW7Ue8RFGgwE/9BwoUicjhDPTxT56bTDHB0L9jei3ofnEyw=
X-Received: by 2002:a05:620a:4247:: with SMTP id
 w7mr1757145qko.381.1634772374992; 
 Wed, 20 Oct 2021 16:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211020215321.33960-1-eajames@linux.ibm.com>
In-Reply-To: <20211020215321.33960-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 20 Oct 2021 23:26:02 +0000
Message-ID: <CACPK8XfJL7mxeech9phwR4hLHTymGfdtq8Cj+-f6nZGmMPZ=ag@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.14 0/5] ARM: dts: aspeed: Rainier and Everest
 devicetree updates
To: Eddie James <eajames@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 20 Oct 2021 at 21:53, Eddie James <eajames@linux.ibm.com> wrote:
>
> This is a number of additions, fixes, and cleanups for the Rainier and
> Everest systems.
>
> Eddie James (5):
>   ARM: dts: aspeed: Fix ADC iio-hwmon battery node name
>   ARM: dts: aspeed: rainier and everest: Remove PCA gpio specification
>   ARM: dts: aspeed: everest: Add I2C switch on bus 8
>   ARM: dts: aspeed: everest: Add IBM Operation Panel I2C device
>   ARM: dts: aspeed: everest: Fix bus 15 muxed eeproms

Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks Eddie, applied to dev-5.14.

>
>  arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 719 ++-----------------
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 517 +------------
>  2 files changed, 52 insertions(+), 1184 deletions(-)
>
> --
> 2.27.0
>
