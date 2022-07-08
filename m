Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EA156B28D
	for <lists+openbmc@lfdr.de>; Fri,  8 Jul 2022 08:12:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfNGq3hgMz3c5G
	for <lists+openbmc@lfdr.de>; Fri,  8 Jul 2022 16:12:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=bvIyCcEg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=bvIyCcEg;
	dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfNGP1kzXz3bs0
	for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2022 16:11:55 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id a5so14432153wrx.12
        for <openbmc@lists.ozlabs.org>; Thu, 07 Jul 2022 23:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/EVd2t8u0wYpi9/paxO5YZCw9y6lD7+mIYk1oqwON0U=;
        b=bvIyCcEgEApxTrEnUrJDeSDe+duZbBLVixfTFAcnPXoVm5oCT7y64/SW05ngiKXh6T
         csRLTX32aVgANSvw46X/SwARUFmlVvfW9h2NXm8fDTnllAwuLM8J7uHp6MYTcYwdGozm
         akyLWwg7nWD5Q/Fhx7JFQVrB8a3RvSfLMiE7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/EVd2t8u0wYpi9/paxO5YZCw9y6lD7+mIYk1oqwON0U=;
        b=lOH++4AVS8PObmWdGlE53DBwihc8gJr/rzOmCHceBrq8sxpH0DwHs6itoBFC+josVY
         E+mVdEVYfQ9GEP7pzzrXfhvg6Q+2VBUKkVxetrDrzNiCvSGpYN1xH9HDq3bSxd4/IC++
         KDr93ph9oQH6ZpB5832ZTf6rQAkxGiOG0Y2UfEXRB0vLXgEG/x2YK6hw36ecVvYEXyX2
         FZ8ZB5NquLGyizK11qq989owLXaRBRC6PwcWOMZbNpaPz8RDH5B8z9qDv85E8PHeEfts
         sRAIom9+59nv3E2xsBpq21/NaQmhU+tphmal4WezxoMvEjNU/lz5p8mUPG9+hE99/FRv
         Cdww==
X-Gm-Message-State: AJIora9vsJDAAs6Yiff6QHk10c+t9CJsdvZzYoOTh2oU68tLLXbpERf3
	s8R/skZ0Qfv84s1CJ14I40NC6EcWXEIzwgQzCxo=
X-Google-Smtp-Source: AGRyM1uAZMGj7UrPRi5v1SkIvTOi2N2iglxsCd3ZJiTyTjkzY4L9Cv5U3WJToF20mYAdi2TVToToR16F9rttvW2/0yI=
X-Received: by 2002:a05:6000:993:b0:21b:8f16:5b3f with SMTP id
 by19-20020a056000099300b0021b8f165b3fmr1497829wrb.628.1657260709197; Thu, 07
 Jul 2022 23:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220707223058.2722999-1-quic_jaehyoo@quicinc.com>
 <20220707223058.2722999-3-quic_jaehyoo@quicinc.com> <CACPK8XdaSPTyH8c0wd5ZTiJxvbWZ+9bWdcQ9bih6wCVFbsv17Q@mail.gmail.com>
 <6e3fe4e2-e32a-36a1-2c9f-e0e3b22c5462@quicinc.com>
In-Reply-To: <6e3fe4e2-e32a-36a1-2c9f-e0e3b22c5462@quicinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Jul 2022 06:11:36 +0000
Message-ID: <CACPK8Xea69=c63cq+oBnRtiogaGRU4TCnjUazSitdqWrnZkOVw@mail.gmail.com>
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

On Fri, 8 Jul 2022 at 05:59, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>
> On 7/7/2022 10:47 PM, Joel Stanley wrote:
> > On Thu, 7 Jul 2022 at 22:32, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
> >>
> >> Add initial version of Qualcomm DC-SCM V1 board. It has BMC_OK GPIO
> >> initialization code as an initial commit.
> >>
> >> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> >> ---
> >> Changes in v2:
> >> * Changed GPIO handling using GPIO driver. (Joel)
> >> * Moved board specific code to the manufacturer folder. (Joel)
> >>
> >>   arch/arm/mach-aspeed/ast2600/Kconfig |  8 ++++++
> >>   board/qualcomm/dc-scm-v1/Kconfig     | 15 ++++++++++
> >>   board/qualcomm/dc-scm-v1/Makefile    |  1 +
> >>   board/qualcomm/dc-scm-v1/dc-scm-v1.c | 42 ++++++++++++++++++++++++++++
> >>   4 files changed, 66 insertions(+)
> >>   create mode 100644 board/qualcomm/dc-scm-v1/Kconfig
> >>   create mode 100644 board/qualcomm/dc-scm-v1/Makefile
> >>   create mode 100644 board/qualcomm/dc-scm-v1/dc-scm-v1.c
> >>
> >> diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
> >> index 46cc1ad1dbd9..713bdf37d83f 100644
> >> --- a/arch/arm/mach-aspeed/ast2600/Kconfig
> >> +++ b/arch/arm/mach-aspeed/ast2600/Kconfig
> >> @@ -46,6 +46,13 @@ config TARGET_AST2600_INTEL
> >>            AST2600-INTEL is an Intel Eagle Stream CRB with
> >>            AST2600 as the BMC.
> >>
> >> +config TARGET_QUALCOMM_DC_SCM_V1
> >> +       bool "QUALCOMM-DC-SCM-V1"
> >> +       depends on ASPEED_AST2600
> >> +       help
> >> +         QUALCOMM-DC-SCM-V1 is a Qualcomm DC-SCM V1 board which is
> >> +         equipped with AST2600.
> >> +
> >>   endchoice
> >>
> >>   source "board/aspeed/evb_ast2600/Kconfig"
> >> @@ -53,5 +60,6 @@ source "board/aspeed/fpga_ast2600/Kconfig"
> >>   source "board/aspeed/slt_ast2600/Kconfig"
> >>   source "board/aspeed/ast2600_ibm/Kconfig"
> >>   source "board/aspeed/ast2600_intel/Kconfig"
> >> +source "board/qualcomm/dc-scm-v1/Kconfig"
> >>
> >>   endif
> >> diff --git a/board/qualcomm/dc-scm-v1/Kconfig b/board/qualcomm/dc-scm-v1/Kconfig
> >> new file mode 100644
> >> index 000000000000..57e311a20729
> >> --- /dev/null
> >> +++ b/board/qualcomm/dc-scm-v1/Kconfig
> >> @@ -0,0 +1,15 @@
> >> +if TARGET_QUALCOMM_DC_SCM_V1
> >> +
> >> +config SYS_BOARD
> >> +       default "dc-scm-v1"
> >> +
> >> +config SYS_VENDOR
> >> +       default "qualcomm"
> >> +
> >> +config SYS_SOC
> >> +       default "ast2600"
> >> +
> >> +config SYS_CONFIG_NAME
> >> +       default "evb_ast2600a1_spl"
> >> +
> >> +endif
> >> diff --git a/board/qualcomm/dc-scm-v1/Makefile b/board/qualcomm/dc-scm-v1/Makefile
> >> new file mode 100644
> >> index 000000000000..cb2aae7f9298
> >> --- /dev/null
> >> +++ b/board/qualcomm/dc-scm-v1/Makefile
> >> @@ -0,0 +1 @@
> >> +obj-y += dc-scm-v1.o
> >> diff --git a/board/qualcomm/dc-scm-v1/dc-scm-v1.c b/board/qualcomm/dc-scm-v1/dc-scm-v1.c
> >> new file mode 100644
> >> index 000000000000..4b81eac46bdf
> >> --- /dev/null
> >> +++ b/board/qualcomm/dc-scm-v1/dc-scm-v1.c
> >> @@ -0,0 +1,42 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> >> + */
> >> +
> >> +#include <common.h>
> >> +#include <asm/gpio.h>
> >> +
> >> +#define BMC_OK_GPIO "gpio@1e780000171"
> >
> > Wow, is that how the u-boot driver works? That's eye watering!
> >
> >> +
> >> +static void gpio_init(void)
> >> +{
> >> +       struct gpio_desc desc;
> >> +       int ret;
> >> +
> >> +       ret = dm_gpio_lookup_name(BMC_OK_GPIO, &desc);
> >> +       if (ret)
> >> +               return;
> >> +       ret = dm_gpio_request(&desc, "bmc_ok");
> >> +       if (ret)
> >> +               return;
> >> +       ret = dm_gpio_set_dir_flags(&desc, GPIOD_IS_OUT);
> >> +       if (ret)
> >> +               goto free_exit;
> >> +
> >> +       dm_gpio_set_value(&desc, 0);
> >
> > Given you just want to set the value, you could use a gpio hog. Sorry
> > for not mentioning it before, it only just occurred to me:
> >
> > +&gpio0 {
> > +       u-boot,dm-pre-reloc;
> > +
> > +       bmc_okay {
> > +               u-boot,dm-pre-reloc;
> > +               gpio-hog;
> > +               output-high;
> > +               gpios = <ASPEED_GPIO(V, 3) GPIO_ACTIVE_LOW>;
> > +       };
> > +};
> >
> > Then you don't need any code.
>
> Yes, this part can be changed like you suggested but this board specific
> code needs to be added since other implementations are also in the queue
> such as other gpio handling code, default fan speed setting, FRU
> parsing, MAC address setting and NC-SI fdt overriding so I want to add
> this set as is as an initial commit.

Okay. I'll merge this series and we can see how it evolves from there.

We should consider doing future development on the upstream list, and
backporting from there.

>
> Thanks,
> Jae
>
> >> +
> >> +free_exit:
> >> +       dm_gpio_free(desc.dev, &desc);
> >> +}
> >> +
> >> +int board_early_init_f(void)
> >> +{
> >> +       return 0;
> >> +}
> >> +
> >> +int board_late_init(void)
> >> +{
> >> +       gpio_init();
> >> +
> >> +       return 0;
> >> +}
> >> --
> >> 2.25.1
> >>
