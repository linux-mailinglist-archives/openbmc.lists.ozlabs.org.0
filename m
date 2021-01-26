Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 734E53039AB
	for <lists+openbmc@lfdr.de>; Tue, 26 Jan 2021 10:59:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQ2JX4rMMzDqCq
	for <lists+openbmc@lfdr.de>; Tue, 26 Jan 2021 20:59:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::e29;
 helo=mail-vs1-xe29.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JSZizunW; dkim-atps=neutral
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQ2HP633wzDqCq
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2021 20:58:24 +1100 (AEDT)
Received: by mail-vs1-xe29.google.com with SMTP id e15so8725776vsa.0
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2021 01:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mLEfURoFvMMPicE7Sci98/F9GqRXhnpDvzTDrgr8tH4=;
 b=JSZizunWnHFUkmtUHyAHOYnJD7wXa9KEiZveWMNJbTnIsq8DBDHrjQKEOAVIUnS48Z
 B89LBx4/bpXA2X9q/59Ie5CSj3LKHJW8WBFd/ZiMU0nbvpV36l+1/kjI3XNyFgX2CJvQ
 hMq5myY+0eEMn1T6cvm/zpTpATSRcY2hMgLA0YZ4BfwlqjcoTEu6WjHjqxpncT8ra3UL
 R/Q89uXzi+GFTylz+4amrwKIDE71qCVeU/Ml8E0so8uucmBgKVDaIF6mW6GLmW/Vohrn
 azwJ4PE5eJbhKEXypO4atxOccHGtZjJsh/Idz05fkAehRjL6+wzTRuW9nfGQGouv+fi/
 8r0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mLEfURoFvMMPicE7Sci98/F9GqRXhnpDvzTDrgr8tH4=;
 b=dinTTu0hVcbSNnYe3FweykmD1GX/dqTUgSVjB8H64pZmInBKhOzPFpdEHFg7t0leLl
 Wi/pfeaEBv5zEivZqkwLQYBgJkur5gf33JXZQwtdW4/SycRLPLRaKfJ3YKxWkZ/zh4YL
 W1IGvcy7WARsRvgBiuc7MKMGYY5GMg2M+kr/hkjFkdaKW3vDU5CeDtH6Fo5YBh0t3+Xl
 Id0anUevyedFe+7iyqHbipoNshL4qo/7yASL4ILBGHASpPOsl5i6800rwzivjTd3nmCW
 nqdgpVSd+TgVAu8W8a/mu1um0yKkpigzKxsbDFAHWYn5PkLQrZ9Cv4pGXd15j2/+dbPY
 2c6Q==
X-Gm-Message-State: AOAM532/DXzWateaArDRAiZ/DZvjF37krPxDiEyPSp6sxuI2XBdiUa1I
 4e+1zPI6y706CPt4jOCW76vtHpqD5QuBAR535r9qTQ==
X-Google-Smtp-Source: ABdhPJyxGvvKaiWsvdAfgnpUMrYd5zV8ocbx1A6czDj8b/zotF18PP3KFNdesTQFGkoR6pzaz7PSef5aB7V6Asl73Ks=
X-Received: by 2002:a67:f997:: with SMTP id b23mr3471044vsq.34.1611655100162; 
 Tue, 26 Jan 2021 01:58:20 -0800 (PST)
MIME-Version: 1.0
References: <20210125122802.982-1-arnd@kernel.org>
In-Reply-To: <20210125122802.982-1-arnd@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 26 Jan 2021 10:57:42 +0100
Message-ID: <CAPDyKFqhHw6N=j5xLuDJEiOn+D98xzR=hUYmxY81_7cq3aitdQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: aspeed: move kunit test into separate module
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Baolin Wang <baolin.wang@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 25 Jan 2021 at 13:28, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Having both the driver and the unit test in the same module
> leads to a link failure because of the extra init/exit functions:
>
> drivers/mmc/host/sdhci-of-aspeed-test.c:98:1: error: redefinition of '__inittest'
> kunit_test_suite(aspeed_sdhci_test_suite);
>
> Make it a separate module instead.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Arnd, thanks for the patch and for your help! However, this time
Andrew already posted a similar patch [1] to fix the problem, which I
have just applied.

[1]
https://patchwork.kernel.org/project/linux-mmc/patch/20210122114852.3790565-1-andrew@aj.id.au/

Kind regards
Uffe


> ---
>  drivers/mmc/host/Kconfig                |  2 +-
>  drivers/mmc/host/Makefile               |  1 +
>  drivers/mmc/host/sdhci-of-aspeed-test.c |  5 +++++
>  drivers/mmc/host/sdhci-of-aspeed.c      | 11 ++++-------
>  drivers/mmc/host/sdhci-of-aspeed.h      | 10 ++++++++++
>  5 files changed, 21 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/mmc/host/sdhci-of-aspeed.h
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index d6f00d1d6251..a248f9f6be91 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -169,7 +169,7 @@ config MMC_SDHCI_OF_ASPEED
>           If unsure, say N.
>
>  config MMC_SDHCI_OF_ASPEED_TEST
> -       bool "Tests for the ASPEED SDHCI driver"
> +       tristate "Tests for the ASPEED SDHCI driver"
>         depends on MMC_SDHCI_OF_ASPEED && KUNIT=y
>         help
>           Enable KUnit tests for the ASPEED SDHCI driver. Select this
> diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
> index 451c25fc2c69..5cc7e5f13587 100644
> --- a/drivers/mmc/host/Makefile
> +++ b/drivers/mmc/host/Makefile
> @@ -90,6 +90,7 @@ obj-$(CONFIG_MMC_SDHCI_DOVE)          += sdhci-dove.o
>  obj-$(CONFIG_MMC_SDHCI_TEGRA)          += sdhci-tegra.o
>  obj-$(CONFIG_MMC_SDHCI_OF_ARASAN)      += sdhci-of-arasan.o
>  obj-$(CONFIG_MMC_SDHCI_OF_ASPEED)      += sdhci-of-aspeed.o
> +obj-$(CONFIG_MMC_SDHCI_OF_ASPEED_TEST)  += sdhci-of-aspeed-test.o
>  obj-$(CONFIG_MMC_SDHCI_OF_AT91)                += sdhci-of-at91.o
>  obj-$(CONFIG_MMC_SDHCI_OF_ESDHC)       += sdhci-of-esdhc.o
>  obj-$(CONFIG_MMC_SDHCI_OF_HLWD)                += sdhci-of-hlwd.o
> diff --git a/drivers/mmc/host/sdhci-of-aspeed-test.c b/drivers/mmc/host/sdhci-of-aspeed-test.c
> index 34070605b28b..e7e42991534a 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed-test.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed-test.c
> @@ -2,6 +2,7 @@
>  /* Copyright (C) 2020 IBM Corp. */
>
>  #include <kunit/test.h>
> +#include "sdhci-of-aspeed.h"
>
>  static void aspeed_sdhci_phase_ddr52(struct kunit *test)
>  {
> @@ -96,3 +97,7 @@ static struct kunit_suite aspeed_sdhci_test_suite = {
>         .test_cases = aspeed_sdhci_test_cases,
>  };
>  kunit_test_suite(aspeed_sdhci_test_suite);
> +
> +MODULE_DESCRIPTION("Unit test for the ASPEED SD/SDIO/SDHCI Controllers");
> +MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index 3b0d381e1215..dcc80099f528 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -15,6 +15,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/spinlock.h>
>
> +#include "sdhci-of-aspeed.h"
>  #include "sdhci-pltfm.h"
>
>  #define ASPEED_SDC_INFO                        0x00
> @@ -42,7 +43,6 @@ struct aspeed_sdc {
>  struct aspeed_sdhci_tap_param {
>         bool valid;
>
> -#define ASPEED_SDHCI_TAP_PARAM_INVERT_CLK      BIT(4)
>         u8 in;
>         u8 out;
>  };
> @@ -123,8 +123,8 @@ aspeed_sdc_set_phase_taps(struct aspeed_sdc *sdc,
>  #define ASPEED_SDHCI_NR_TAPS           15
>  /* Measured value with *handwave* environmentals and static loading */
>  #define ASPEED_SDHCI_MAX_TAP_DELAY_PS  1253
> -static int aspeed_sdhci_phase_to_tap(struct device *dev, unsigned long rate_hz,
> -                                    int phase_deg)
> +int aspeed_sdhci_phase_to_tap(struct device *dev, unsigned long rate_hz,
> +                             int phase_deg)
>  {
>         u64 phase_period_ps;
>         u64 prop_delay_ps;
> @@ -158,6 +158,7 @@ static int aspeed_sdhci_phase_to_tap(struct device *dev, unsigned long rate_hz,
>
>         return inverted | tap;
>  }
> +EXPORT_SYMBOL_GPL(aspeed_sdhci_phase_to_tap);
>
>  static void
>  aspeed_sdhci_phases_to_taps(struct device *dev, unsigned long rate,
> @@ -579,10 +580,6 @@ static void __exit aspeed_sdc_exit(void)
>  }
>  module_exit(aspeed_sdc_exit);
>
> -#if defined(CONFIG_MMC_SDHCI_OF_ASPEED_TEST)
> -#include "sdhci-of-aspeed-test.c"
> -#endif
> -
>  MODULE_DESCRIPTION("Driver for the ASPEED SD/SDIO/SDHCI Controllers");
>  MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
>  MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.h b/drivers/mmc/host/sdhci-of-aspeed.h
> new file mode 100644
> index 000000000000..931e70781d08
> --- /dev/null
> +++ b/drivers/mmc/host/sdhci-of-aspeed.h
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +#ifndef _SDHCI_OF_ASPEED_H
> +#define _SDHCI_OF_ASPEED_H
> +
> +struct device;
> +int aspeed_sdhci_phase_to_tap(struct device *dev, unsigned long rate_hz,
> +                             int phase_deg);
> +#define ASPEED_SDHCI_TAP_PARAM_INVERT_CLK      BIT(4)
> +
> +#endif /* _SDHCI_OF_ASPEED_H */
> --
> 2.29.2
>
