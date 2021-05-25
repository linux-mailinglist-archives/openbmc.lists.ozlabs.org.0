Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F6E38FBB1
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 09:29:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fq5Lr3LLTz2xtt
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 17:29:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=COoIlADa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::731;
 helo=mail-qk1-x731.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=COoIlADa; dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fq5LW3TGfz2xv2;
 Tue, 25 May 2021 17:29:23 +1000 (AEST)
Received: by mail-qk1-x731.google.com with SMTP id i67so29506616qkc.4;
 Tue, 25 May 2021 00:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4BA6UqvX9jBO1xKa7XUgf1vBNEjKeOfkciRH4B0dC6U=;
 b=COoIlADa7tLJQD4D95gezEkwp+5F4j8gn7yVIWYsnmw45zVtD4vK9Ao1/x7B0sAMxB
 pRDMzB8VXzkHizzKtXatIBESytLxPsicU5ezsNYTxaV/ROtdyK/865mXzdXQx8Cfq65X
 1Tbod/AnylIzvh6WfM1u2KOVASHRYHds+ine4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4BA6UqvX9jBO1xKa7XUgf1vBNEjKeOfkciRH4B0dC6U=;
 b=qtjYQzGL3MvWbj8gXVl/0W0oiff2Arqcgrol5K86p6c3+fJgwe5tt23/MzjcQHH/IA
 yukawMwnRBKIjPRy6Y/V4TQDQGszFWp5DGAZoT2AQOuEzLMXI/PUZP8U13CLxVgA22v7
 n9B55gum6oVvqDOjbp6VBomAVBD3m1p3RtWwicbg+/ypwq+YwL84XylW4mwXEfrCm8U7
 F9Iz4tDW8qYVeyBL3pFyJKbUD2CwbW1tK5FpEkb4K1I4gbMu0ZksnWkS02JxnKHwXLct
 AQRWsArI+lbdNojl4YKd1qfASw3iGuFBUGmOcazpoOMnzWgQ0A1nqVSgCbKDbiUEAWoL
 oDxA==
X-Gm-Message-State: AOAM532LHHi4AMurivFAoANzOY5jm2BDsyTU13A3sBb7bX5SarDE+fxb
 d8Hy1ILY++CjoRjYlGPAK/Ph6pMV1djp8qmTZOM=
X-Google-Smtp-Source: ABdhPJxKzrDa3VSpt0hXXJcRKDzsseymcQy9t4uFIRJUAQJ3ZUN47DWvKG2QIYS04WN6l520oVab/lNi/ety+HreRjs=
X-Received: by 2002:a37:6442:: with SMTP id y63mr5995781qkb.273.1621927759742; 
 Tue, 25 May 2021 00:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210525055308.31069-1-steven_lee@aspeedtech.com>
 <20210525055308.31069-3-steven_lee@aspeedtech.com>
In-Reply-To: <20210525055308.31069-3-steven_lee@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 25 May 2021 07:29:07 +0000
Message-ID: <CACPK8XcgqmYWw3uL=3zckweepnM0vMucuPU1THPCNowjCkka5w@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ARM: dts: aspeed-g6: Add pinctrl settings
To: Steven Lee <steven_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ASPEED PINCTRL DRIVERS" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, Hongwei Zhang <Hongweiz@ami.com>,
 Billy Tsai <billy_tsai@aspeedtech.com>,
 "open list:ASPEED PINCTRL DRIVERS" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ASPEED PINCTRL DRIVERS" <openbmc@lists.ozlabs.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 25 May 2021 at 05:53, Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> AST2600 supports 2 SGPIO master interfaces and 2 SGPIO slave interfaces.
> Currently, only SGPIO master 1 and SGPIO slve 1 in the pinctrl dtsi.
> SGPIO master 2 and slave 2 should be added in pinctrl dtsi as well.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>

Linus, feel free to take this entire series through your tree.

> ---
>  arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> index 7028e21bdd98..7e90d713f5e5 100644
> --- a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> @@ -862,11 +862,21 @@
>                 groups = "SGPM1";
>         };
>
> +       pinctrl_sgpm2_default: sgpm2_default {
> +               function = "SGPM2";
> +               groups = "SGPM2";
> +       };
> +
>         pinctrl_sgps1_default: sgps1_default {
>                 function = "SGPS1";
>                 groups = "SGPS1";
>         };
>
> +       pinctrl_sgps2_default: sgps2_default {
> +               function = "SGPS2";
> +               groups = "SGPS2";
> +       };
> +
>         pinctrl_sioonctrl_default: sioonctrl_default {
>                 function = "SIOONCTRL";
>                 groups = "SIOONCTRL";
> --
> 2.17.1
>
