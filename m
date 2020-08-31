Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9983258459
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 01:18:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgR3G5FCxzDqWM
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 09:18:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=BviGURK3; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgR2R6tKxzDqN0
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 09:18:06 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id p9so4997950ejf.6
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 16:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mPglTKKG4Ei8fJD6Z+VCwe80/PVzrC44xDr8fnz2Rqw=;
 b=BviGURK3raswCRPuEEHHCm/xoM/JMkKit0f1CXnmW3zJl9yaqPNREpgetwx4Qr0Vk7
 e3mB5bv68jFG8MLRRdg9rjwSCs2cywSAupi3vFVT0LHEqw61F7SWvQoGWL5m0fRzNQwK
 ES7EIXPfdEfXv5mo+9R3xw8iSvBoWxpp09z3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mPglTKKG4Ei8fJD6Z+VCwe80/PVzrC44xDr8fnz2Rqw=;
 b=DbaEtFrksU3BS4w0ra5yQ/tlO2xlCXxJFYdQxM8dxQaX5jlUpgUB1bkaoDrNNOKAMF
 KOOfns35g4iokOnNPDG3Xce/cqabn+9PcUJiM8KxnkOSkzdXyp3E3rl/Q0dNosisVfj8
 kogsFgW0YOpgmhwvvmh2Z3uTJA6LOR37gp6c18MvNGoq9629ah92x56ZgKyMqgGKYm4V
 N5/nBR/OY3G9H+Ny+1WgaIJEuKOy//S3OzgUK1yMtKR8JF+w53etGnBDifszeGhU3WND
 0lQQWERHX9tpqbfBe/v/TrZxZJdczI4Mg4j8V4DCxu2Elctk2R9KehpNKawCkd82CjoN
 2//Q==
X-Gm-Message-State: AOAM5335a9aohUtI699EjuybPZspYPTN6xbUvKWUfaVkSijllhp1zOGy
 mypKgr7xl5BgpPRc2TKfsnX6BTaWJXmkV7nRT7s=
X-Google-Smtp-Source: ABdhPJyYMTAFWTJob2rE3xlfDaAs5W7rSg79fMoMLN1ZU+sxa+2VhC0T39OEvJ8aaYQ1cCrEV3oS775xBUn2rwNc9Y4=
X-Received: by 2002:a17:906:2542:: with SMTP id
 j2mr2943555ejb.442.1598915882245; 
 Mon, 31 Aug 2020 16:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200831190130.47060-1-eajames@linux.ibm.com>
 <20200831190130.47060-4-eajames@linux.ibm.com>
In-Reply-To: <20200831190130.47060-4-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Aug 2020 23:17:50 +0000
Message-ID: <CACPK8XeY4nkTTJSqRMWMjVJt8Qz9v2eVOWbm_HpCFu9-Jqkn=w@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 3/5] mmc: Add support for
 devicetree parameters for Aspeed controller
To: Eddie James <eajames@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>
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

On Mon, 31 Aug 2020 at 19:01, Eddie James <eajames@linux.ibm.com> wrote:
>
> The Aspeed SDHC needs some additional parameters set to function
> correctly. These should be encoded in the devicetree.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Does this use the same binding as the kernel patches that Andrew is
going to send upstream?

Can this one go straight to upstream u-boot?

> ---
>  drivers/mmc/aspeed_sdhci.c    |  2 ++
>  drivers/mmc/aspeed_sdhci_ic.c | 16 ++++++++++++++++
>  drivers/mmc/sdhci.c           |  8 ++++++++
>  include/mmc.h                 |  1 +
>  include/sdhci.h               |  6 +++++-
>  5 files changed, 32 insertions(+), 1 deletion(-)
>  mode change 100755 => 100644 drivers/mmc/aspeed_sdhci.c
>
> diff --git a/drivers/mmc/aspeed_sdhci.c b/drivers/mmc/aspeed_sdhci.c
> old mode 100755
> new mode 100644
> index f4cdfe039f..36cbf29db5
> --- a/drivers/mmc/aspeed_sdhci.c
> +++ b/drivers/mmc/aspeed_sdhci.c
> @@ -93,6 +93,8 @@ static int aspeed_sdhci_probe(struct udevice *dev)
>         host->mmc = &plat->mmc;
>         if (ret)
>                 return ret;
> +
> +       host->mmc->drv_type = dev_read_u32_default(dev, "sdhci-drive-type", 0);
>         host->mmc->priv = host;
>         host->mmc->dev = dev;
>         upriv->mmc = host->mmc;
> diff --git a/drivers/mmc/aspeed_sdhci_ic.c b/drivers/mmc/aspeed_sdhci_ic.c
> index fd62ab3eae..b8dd5d52f9 100644
> --- a/drivers/mmc/aspeed_sdhci_ic.c
> +++ b/drivers/mmc/aspeed_sdhci_ic.c
> @@ -9,6 +9,10 @@
>  #include <errno.h>
>  #include <fdtdec.h>
>  #include <asm/io.h>
> +#include <linux/io.h>
> +#include <linux/ioport.h>
> +
> +#define TIMING_PHASE_OFFSET 0xf4
>
>  struct aspeed_sdhci_general_reg {
>         u32 genreal_info;
> @@ -32,6 +36,9 @@ static int aspeed_sdhci_irq_probe(struct udevice *dev)
>  {
>         struct aspeed_sdhci_general_data *priv = dev_get_priv(dev);
>         int ret = 0;
> +       struct resource regs;
> +       void __iomem  *sdhci_ctrl_base;
> +       u32 timing_phase;
>
>         debug("%s(dev=%p) \n", __func__, dev);
>
> @@ -41,6 +48,15 @@ static int aspeed_sdhci_irq_probe(struct udevice *dev)
>                 return ret;
>         }
>
> +       ret = dev_read_resource(dev, 0, &regs);
> +       if (ret < 0)
> +               return ret;
> +
> +       sdhci_ctrl_base = (void __iomem  *)regs.start;
> +
> +       timing_phase = dev_read_u32_default(dev, "timing-phase", 0);
> +       writel(timing_phase, sdhci_ctrl_base + TIMING_PHASE_OFFSET);
> +
>         return 0;
>  }
>
> diff --git a/drivers/mmc/sdhci.c b/drivers/mmc/sdhci.c
> index ff506cdf9d..2505d5b8be 100644
> --- a/drivers/mmc/sdhci.c
> +++ b/drivers/mmc/sdhci.c
> @@ -460,6 +460,7 @@ static int sdhci_set_ios(struct mmc *mmc)
>  #endif
>         u32 ctrl;
>         u32 gen_addr, gen_ctrl;
> +       u16 ctrl_2;
>         struct sdhci_host *host = mmc->priv;
>
>         if (host->ops && host->ops->set_control_reg)
> @@ -518,6 +519,13 @@ static int sdhci_set_ios(struct mmc *mmc)
>
>         sdhci_writeb(host, ctrl, SDHCI_HOST_CONTROL);
>
> +       if ((SDHCI_GET_VERSION(host) >= SDHCI_SPEC_300)) {
> +               ctrl_2 = sdhci_readw(host, SDHCI_HOST_CONTROL_2);
> +               ctrl_2 &= ~SDHCI_DRIVER_STRENGTH_MASK;
> +               ctrl_2 |= host->mmc->drv_type << SDHCI_DRIVER_STRENGTH_SHIFT;
> +               sdhci_writew(host, ctrl_2, SDHCI_HOST_CONTROL_2);
> +       }
> +
>         /* If available, call the driver specific "post" set_ios() function */
>         if (host->ops && host->ops->set_ios_post)
>                 host->ops->set_ios_post(host);
> diff --git a/include/mmc.h b/include/mmc.h
> index 1f30f71d25..4834dbaf81 100644
> --- a/include/mmc.h
> +++ b/include/mmc.h
> @@ -639,6 +639,7 @@ struct mmc {
>                                   * accessing the boot partitions
>                                   */
>         u32 quirks;
> +       int drv_type;
>  };
>
>  struct mmc_hwpart_conf {
> diff --git a/include/sdhci.h b/include/sdhci.h
> index 14884e4dbb..6f85895480 100644
> --- a/include/sdhci.h
> +++ b/include/sdhci.h
> @@ -144,7 +144,11 @@
>
>  #define SDHCI_ACMD12_ERR       0x3C
>
> -/* 3E-3F reserved */
> +#define SDHCI_HOST_CONTROL_2        0x3E
> +#define SDHCI_DRIVER_STRENGTH_MASK  0x30
> +#define SDHCI_DRIVER_STRENGTH_SHIFT 4
> +
> +/* 3F reserved */
>
>  #define SDHCI_CAPABILITIES     0x40
>  #define  SDHCI_TIMEOUT_CLK_MASK        0x0000003F
> --
> 2.26.2
>
