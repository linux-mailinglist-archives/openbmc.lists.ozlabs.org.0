Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D83AA566369
	for <lists+openbmc@lfdr.de>; Tue,  5 Jul 2022 08:52:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LcYHz5wQ2z3bWM
	for <lists+openbmc@lfdr.de>; Tue,  5 Jul 2022 16:51:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JSNUHNHt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JSNUHNHt;
	dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LcYHb5kxVz2yn5
	for <openbmc@lists.ozlabs.org>; Tue,  5 Jul 2022 16:51:39 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id bi22-20020a05600c3d9600b003a04de22ab6so6721006wmb.1
        for <openbmc@lists.ozlabs.org>; Mon, 04 Jul 2022 23:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GFMn+gwD4Zg/vDy+BUytmBTGXWHqlIfK8kOeVYntNSE=;
        b=JSNUHNHtDPNJW0mCFkMtt84IEerxMSlHj13Yyhj0fxPXdrMZTyCO/FHZazPLRSLw0+
         vBJ2wwdttmvEX7FWZDfIEMTcOj8YiBzz2SVZzEfVnL0wC5ehcVGhRY9uxlSzBgLwDkbn
         18WVtEUrvPWMz68MIAHxT9SX5CyY4PlDVbXX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GFMn+gwD4Zg/vDy+BUytmBTGXWHqlIfK8kOeVYntNSE=;
        b=1uAL7uX5/X5Aj8mm2QDnuH5ZhHT/sjK8CPsBe+MNkizfRoTmSDdE9aN/yrJZ2fFqez
         ruoVMGjEij9Uim0M/ZoyZyhRFyYv1ofWW5y6tvHRvnUYTQy1VdvLM+Mqzq4oAG6txX/I
         s3g0k1V0jjFkIojDzOhZwxbEcai8JbnXYj/Z42vfjbGPvjdpapIjeL2sQgQ98ClZhCqP
         uWjc69qig+KzDbEflPRWIL6+9T9qVq7Aa/Bb1SCldFcgxFUxtHDBQ04+ObvXlGWkJ0/w
         IacnciW00fhSGHqbF1+WwKGpaklZxuGn8KlSi+TZeoTgtoex5dkWckSKcNyZy+NOElFq
         GI9w==
X-Gm-Message-State: AJIora+ccsic056Pnxls6aeUT5qaQs8yB8ELD9s46t+/bjdc3abcA/9E
	YuYN75GnKHfAhB2PCaUK1g1W0dF8Qmn3KDpY93802lel
X-Google-Smtp-Source: AGRyM1vuDMfXGYNG1X//cV5exRCnzBT9PRRnGZ5qtE4ShUOHE97Vgx1CIaTRyms97MtkxFgXCkOgccFIVMahwt1rLKU=
X-Received: by 2002:a7b:cd0d:0:b0:3a1:8f1e:cb2f with SMTP id
 f13-20020a7bcd0d000000b003a18f1ecb2fmr20252364wmj.10.1657003895582; Mon, 04
 Jul 2022 23:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220630200227.2292079-1-quic_jaehyoo@quicinc.com> <20220630200227.2292079-3-quic_jaehyoo@quicinc.com>
In-Reply-To: <20220630200227.2292079-3-quic_jaehyoo@quicinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 5 Jul 2022 06:51:23 +0000
Message-ID: <CACPK8Xf5KjQZMX=8NnVDGw=oXHB2OrhY-NY4=jDXMZU=0LMEAA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 2/3] board:
 ast2600_qualcomm: add initial version of Qualcomm DC-SCM V1 board
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Graeme Gregory <quic_ggregory@quicinc.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 30 Jun 2022 at 20:02, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>
> Add initial version of Qualcomm DC-SCM V1 board to support Qualcomm
> specific options.
>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> ---
>  arch/arm/mach-aspeed/ast2600/Kconfig      |  8 ++++++
>  board/aspeed/ast2600_qualcomm/Kconfig     | 15 +++++++++++
>  board/aspeed/ast2600_qualcomm/Makefile    |  1 +
>  board/aspeed/ast2600_qualcomm/dc-scm-v1.c | 33 +++++++++++++++++++++++
>  4 files changed, 57 insertions(+)
>  create mode 100644 board/aspeed/ast2600_qualcomm/Kconfig
>  create mode 100644 board/aspeed/ast2600_qualcomm/Makefile
>  create mode 100644 board/aspeed/ast2600_qualcomm/dc-scm-v1.c
>
> diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
> index 46cc1ad1dbd9..252458846a84 100644
> --- a/arch/arm/mach-aspeed/ast2600/Kconfig
> +++ b/arch/arm/mach-aspeed/ast2600/Kconfig
> @@ -46,6 +46,13 @@ config TARGET_AST2600_INTEL
>           AST2600-INTEL is an Intel Eagle Stream CRB with
>           AST2600 as the BMC.
>
> +config TARGET_AST2600_QUALCOMM_DC_SCM_V1
> +       bool "AST2600_QUALCOMM_DC_SCM_V1"
> +       depends on ASPEED_AST2600
> +       help
> +         AST2600-QUALCOMM-DC-SCM-V1 is a Qualcomm DC-SCM V1 board which is
> +         equipped with AST2600.
> +
>  endchoice
>
>  source "board/aspeed/evb_ast2600/Kconfig"
> @@ -53,5 +60,6 @@ source "board/aspeed/fpga_ast2600/Kconfig"
>  source "board/aspeed/slt_ast2600/Kconfig"
>  source "board/aspeed/ast2600_ibm/Kconfig"
>  source "board/aspeed/ast2600_intel/Kconfig"
> +source "board/aspeed/ast2600_qualcomm/Kconfig"
>
>  endif
> diff --git a/board/aspeed/ast2600_qualcomm/Kconfig b/board/aspeed/ast2600_qualcomm/Kconfig
> new file mode 100644
> index 000000000000..3ede24c34dee
> --- /dev/null
> +++ b/board/aspeed/ast2600_qualcomm/Kconfig
> @@ -0,0 +1,15 @@
> +if TARGET_AST2600_QUALCOMM_DC_SCM_V1
> +
> +config SYS_BOARD
> +       default "ast2600_qualcomm"
> +
> +config SYS_VENDOR
> +       default "aspeed"

Out of interest, how does u-boot handle this upstream? Does a board
made by company Y with a chip made by company X considered vendor X,
or vendor Y?

> +
> +config SYS_SOC
> +       default "ast2600"
> +
> +config SYS_CONFIG_NAME
> +       default "evb_ast2600"
> +
> +endif
> diff --git a/board/aspeed/ast2600_qualcomm/Makefile b/board/aspeed/ast2600_qualcomm/Makefile
> new file mode 100644
> index 000000000000..cb2aae7f9298
> --- /dev/null
> +++ b/board/aspeed/ast2600_qualcomm/Makefile
> @@ -0,0 +1 @@
> +obj-y += dc-scm-v1.o
> diff --git a/board/aspeed/ast2600_qualcomm/dc-scm-v1.c b/board/aspeed/ast2600_qualcomm/dc-scm-v1.c
> new file mode 100644
> index 000000000000..40bc85e068ad
> --- /dev/null
> +++ b/board/aspeed/ast2600_qualcomm/dc-scm-v1.c
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <common.h>
> +#include <asm/io.h>
> +
> +/* GPIO registers */
> +#define GPIO_BASE              0x1e780000
> +#define GPIO_UVWX_VAL          (GPIO_BASE + 0x88)
> +#define GPIO_UVWX_VAL_V3       BIT(11)
> +#define GPIO_UVWX_DIR          (GPIO_BASE + 0x8c)
> +#define GPIO_UVWX_DIR_V3       BIT(11)
> +
> +static void gpio_init(void)
> +{
> +       /* Set GPIOV3 (BMC_OK) as an output with value low explicitly. */

Is there a reason you don't use the gpio driver?

(Again, you need to explain your decisions in the commit message).

> +       writel(readl(GPIO_UVWX_DIR) | GPIO_UVWX_DIR_V3, GPIO_UVWX_DIR);
> +       writel(readl(GPIO_UVWX_VAL) & ~GPIO_UVWX_VAL_V3, GPIO_UVWX_VAL);
> +}
> +
> +int board_early_init_f(void)
> +{
> +       gpio_init();
> +
> +       return 0;
> +}
> +
> +int board_late_init(void)

Do you need to include this if it's doing nothing?

> +{
> +       return 0;
> +}
> --
> 2.25.1
>
