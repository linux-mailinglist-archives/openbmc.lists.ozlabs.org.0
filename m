Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AF356B263
	for <lists+openbmc@lfdr.de>; Fri,  8 Jul 2022 07:48:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfMkm3LPQz3c1Y
	for <lists+openbmc@lfdr.de>; Fri,  8 Jul 2022 15:48:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=X+Wi5Y0j;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=X+Wi5Y0j;
	dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfMkM6cL6z3bgC
	for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2022 15:47:37 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id v14so29074549wra.5
        for <openbmc@lists.ozlabs.org>; Thu, 07 Jul 2022 22:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IJTfYHjrK1Xx6kzWbCTSNzZOPjisNKu7NpRyHTJBG4A=;
        b=X+Wi5Y0jbYdSejp6yoUJ/YJpT5vPmYsNP/nWXol1gR162duyfTPRKVPSNFQmaVlHAH
         qIQMy+l5xCZJ/8pNsvMpxbIC+4CJTlZZZtc5LkpMsD88P8D1ahaBRrMN0aAfMSZOVkSo
         fE9hgJx7lExcB64t2qrUzEihpRaIgvanRdb08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IJTfYHjrK1Xx6kzWbCTSNzZOPjisNKu7NpRyHTJBG4A=;
        b=ENIYS6DaI4j/WZiVmAH6ErgZUvUp65HARx5zWD31XyfD092j0ROfWY0X0HP9g/Y9be
         gJbwSh6MCMJkMEvKorXqTEpBOzdBeH5xmd5bnxmynBpXV5ZdFZwhP6o4s/CK2X80dmI2
         G+uqYo0ly4whnxPLG+/s4peUw8IDnxOh1OhyfnUsQ6j75ZmIZb3+qb5tUqtj+AKuRA1x
         wK1KcT1w7dEu7QTYxBo3Mxw/Z2DcIziBXPuN6b/TIjvYDcMVDnUIU3x8J5pbTrkECZKW
         xy2MSHYXJWRJPFwk5QfnOVHe2OCJ7LCwVUdfRogMbrnDmHDWwl/ECSuza4PaVsCKh4u+
         k+zw==
X-Gm-Message-State: AJIora9mqt5nWIFhEu/I36IMZzyjknjVK7matl1VKQ88/Ds69HIgPK+x
	dAWnradfRjDiGe8VP6o3BMb1N9AGPYhETcDSFu0=
X-Google-Smtp-Source: AGRyM1tgRveMaal1ytocz6yC4huzBGSIpLUueT+6x4CrCLXTEPDSpYl9y2v6lqWlyUiYeOwVychRnYSFxj1gGS4C6uA=
X-Received: by 2002:adf:fdc4:0:b0:21d:6f76:5193 with SMTP id
 i4-20020adffdc4000000b0021d6f765193mr1381898wrs.606.1657259253616; Thu, 07
 Jul 2022 22:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220707223058.2722999-1-quic_jaehyoo@quicinc.com> <20220707223058.2722999-3-quic_jaehyoo@quicinc.com>
In-Reply-To: <20220707223058.2722999-3-quic_jaehyoo@quicinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Jul 2022 05:47:21 +0000
Message-ID: <CACPK8XdaSPTyH8c0wd5ZTiJxvbWZ+9bWdcQ9bih6wCVFbsv17Q@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 2/2] board: qualcomm:
 dc-scm-v1: add initial version of Qualcomm DC-SCM V1 board
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

On Thu, 7 Jul 2022 at 22:32, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>
> Add initial version of Qualcomm DC-SCM V1 board. It has BMC_OK GPIO
> initialization code as an initial commit.
>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> ---
> Changes in v2:
> * Changed GPIO handling using GPIO driver. (Joel)
> * Moved board specific code to the manufacturer folder. (Joel)
>
>  arch/arm/mach-aspeed/ast2600/Kconfig |  8 ++++++
>  board/qualcomm/dc-scm-v1/Kconfig     | 15 ++++++++++
>  board/qualcomm/dc-scm-v1/Makefile    |  1 +
>  board/qualcomm/dc-scm-v1/dc-scm-v1.c | 42 ++++++++++++++++++++++++++++
>  4 files changed, 66 insertions(+)
>  create mode 100644 board/qualcomm/dc-scm-v1/Kconfig
>  create mode 100644 board/qualcomm/dc-scm-v1/Makefile
>  create mode 100644 board/qualcomm/dc-scm-v1/dc-scm-v1.c
>
> diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
> index 46cc1ad1dbd9..713bdf37d83f 100644
> --- a/arch/arm/mach-aspeed/ast2600/Kconfig
> +++ b/arch/arm/mach-aspeed/ast2600/Kconfig
> @@ -46,6 +46,13 @@ config TARGET_AST2600_INTEL
>           AST2600-INTEL is an Intel Eagle Stream CRB with
>           AST2600 as the BMC.
>
> +config TARGET_QUALCOMM_DC_SCM_V1
> +       bool "QUALCOMM-DC-SCM-V1"
> +       depends on ASPEED_AST2600
> +       help
> +         QUALCOMM-DC-SCM-V1 is a Qualcomm DC-SCM V1 board which is
> +         equipped with AST2600.
> +
>  endchoice
>
>  source "board/aspeed/evb_ast2600/Kconfig"
> @@ -53,5 +60,6 @@ source "board/aspeed/fpga_ast2600/Kconfig"
>  source "board/aspeed/slt_ast2600/Kconfig"
>  source "board/aspeed/ast2600_ibm/Kconfig"
>  source "board/aspeed/ast2600_intel/Kconfig"
> +source "board/qualcomm/dc-scm-v1/Kconfig"
>
>  endif
> diff --git a/board/qualcomm/dc-scm-v1/Kconfig b/board/qualcomm/dc-scm-v1/Kconfig
> new file mode 100644
> index 000000000000..57e311a20729
> --- /dev/null
> +++ b/board/qualcomm/dc-scm-v1/Kconfig
> @@ -0,0 +1,15 @@
> +if TARGET_QUALCOMM_DC_SCM_V1
> +
> +config SYS_BOARD
> +       default "dc-scm-v1"
> +
> +config SYS_VENDOR
> +       default "qualcomm"
> +
> +config SYS_SOC
> +       default "ast2600"
> +
> +config SYS_CONFIG_NAME
> +       default "evb_ast2600a1_spl"
> +
> +endif
> diff --git a/board/qualcomm/dc-scm-v1/Makefile b/board/qualcomm/dc-scm-v1/Makefile
> new file mode 100644
> index 000000000000..cb2aae7f9298
> --- /dev/null
> +++ b/board/qualcomm/dc-scm-v1/Makefile
> @@ -0,0 +1 @@
> +obj-y += dc-scm-v1.o
> diff --git a/board/qualcomm/dc-scm-v1/dc-scm-v1.c b/board/qualcomm/dc-scm-v1/dc-scm-v1.c
> new file mode 100644
> index 000000000000..4b81eac46bdf
> --- /dev/null
> +++ b/board/qualcomm/dc-scm-v1/dc-scm-v1.c
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <common.h>
> +#include <asm/gpio.h>
> +
> +#define BMC_OK_GPIO "gpio@1e780000171"

Wow, is that how the u-boot driver works? That's eye watering!

> +
> +static void gpio_init(void)
> +{
> +       struct gpio_desc desc;
> +       int ret;
> +
> +       ret = dm_gpio_lookup_name(BMC_OK_GPIO, &desc);
> +       if (ret)
> +               return;
> +       ret = dm_gpio_request(&desc, "bmc_ok");
> +       if (ret)
> +               return;
> +       ret = dm_gpio_set_dir_flags(&desc, GPIOD_IS_OUT);
> +       if (ret)
> +               goto free_exit;
> +
> +       dm_gpio_set_value(&desc, 0);

Given you just want to set the value, you could use a gpio hog. Sorry
for not mentioning it before, it only just occurred to me:

+&gpio0 {
+       u-boot,dm-pre-reloc;
+
+       bmc_okay {
+               u-boot,dm-pre-reloc;
+               gpio-hog;
+               output-high;
+               gpios = <ASPEED_GPIO(V, 3) GPIO_ACTIVE_LOW>;
+       };
+};

Then you don't need any code.

> +
> +free_exit:
> +       dm_gpio_free(desc.dev, &desc);
> +}
> +
> +int board_early_init_f(void)
> +{
> +       return 0;
> +}
> +
> +int board_late_init(void)
> +{
> +       gpio_init();
> +
> +       return 0;
> +}
> --
> 2.25.1
>
