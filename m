Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6022C522D6E
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 09:32:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kymnb1jtcz3dqg
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 17:32:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=IVinlS/4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::431;
 helo=mail-wr1-x431.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=IVinlS/4; dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KymmL1cq4z3cJ3
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 17:30:58 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id h16so972382wrb.2
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 00:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dClzNi9RvDtM7uC8HYfpCyWhYPO5N4INuIFN1aqGBh8=;
 b=IVinlS/466kwAbdUoTnt7L9A+RLlb/qZXBjfHlF7NoSZhjZLZFKC5ZuBeCmyREY4sC
 VPQrz1zkP4La91sljyXzUxJbCf/MyzEZ0bt9nx2vGr3xW4Rx2qIGQ2plfbmoZOditn6f
 fLhnE7lqmPFbmTbEqYLokXQDlztLkfQZDmAmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dClzNi9RvDtM7uC8HYfpCyWhYPO5N4INuIFN1aqGBh8=;
 b=vgFrfrTrgBd2q+DKqE5O6oS5r2Po0GS7yI09t2h/zhu8PaHZRFv3ZkCCQNdC3ccad8
 JedKg+u/Y4smh8A1DM4/ZWbthAUH51KV2Kb4ZNQPhjEG25ufXRpprwhG2/EIKPlbOXv2
 EwNOZJm0n4TvWCiSoS1QLAKqkhlctzasISC4AQ38h+qvQoPcvjx7ixBkKkdR8EqVP5Or
 KDJkI8GuUUeL/viHucFg5NnfyVlmfiMI1XO7diwz8lDb+KyMcFMzk+239QPH7ekanNrZ
 TqcC5RRS9pFwU6cw7zXeFDL8WKAYgnxILDsjrjOMiJT4t5BTz4ozTfnja148Qsd3pU6Z
 UuTQ==
X-Gm-Message-State: AOAM533H8IVx8djNvn/f5pNKQc2Y++w0+/JL9LVIGqcFQ5YsZPconCPL
 dFtmOvWHXO9MIgR1gUwhVr5pclS+lumtwhEtnOA=
X-Google-Smtp-Source: ABdhPJzdQkA9bt018b6jFi+i42lZ198cNY+3ZT/jcEloo0EZ+8usoORTdFRqIobX6sis5zBpCw4RzSJXrIAJmvn+CTI=
X-Received: by 2002:a5d:6d05:0:b0:20c:64fd:f98a with SMTP id
 e5-20020a5d6d05000000b0020c64fdf98amr21358744wrq.474.1652254254445; Wed, 11
 May 2022 00:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220421083151.1887871-1-patrick.rudolph@9elements.com>
 <20220421083151.1887871-3-patrick.rudolph@9elements.com>
In-Reply-To: <20220421083151.1887871-3-patrick.rudolph@9elements.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 May 2022 07:30:42 +0000
Message-ID: <CACPK8XcmW6uL_FMii9WYfaLNj9UN8D4fvHD-rgo1QbysZSLNng@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 2/4] arm/mach-aspeed:
 Add support for CONFIG_DRAM_UART_TO_UART1
To: Patrick Rudolph <patrick.rudolph@9elements.com>
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
Cc: christian.walter@9elements.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 takken@us.ibm.com, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 21 Apr 2022 at 08:32, Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:
>
> Update the Kconfig and allow a board to use CONFIG_DRAM_UART_TO_UART1.
> The platform code already uses this Kconfig symbol, but it always
> evaluated to false.
> This is required on IBM/Genesis3 as it uses RDX1/TDX1 as debug uart.
>
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/mach-aspeed/ast2500/Kconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/mach-aspeed/ast2500/Kconfig b/arch/arm/mach-aspeed/ast2500/Kconfig
> index 4f992f442d..e7ff00cdba 100644
> --- a/arch/arm/mach-aspeed/ast2500/Kconfig
> +++ b/arch/arm/mach-aspeed/ast2500/Kconfig
> @@ -17,6 +17,12 @@ config TARGET_EVB_AST2500
>           20 pin JTAG, pinouts for 14 I2Cs, 3 SPIs and eSPI, 8 PWMs.
>  endchoice
>
> +config DRAM_UART_TO_UART1
> +       bool
> +       prompt "Route debug UART to UART1"
> +       help
> +         Route debug UART to TXD1/RXD1 pins.
> +
>  source "board/aspeed/evb_ast2500/Kconfig"
>
>  endif
> --
> 2.35.1
>
