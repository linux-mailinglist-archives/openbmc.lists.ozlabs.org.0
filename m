Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBB238BB8D
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 03:28:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmTX33Cxnz302V
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 11:28:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Sl1Wz/gv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Sl1Wz/gv; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmTWl1QFhz2yWw;
 Fri, 21 May 2021 11:28:18 +1000 (AEST)
Received: by mail-qk1-x732.google.com with SMTP id 124so5961652qkh.10;
 Thu, 20 May 2021 18:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rs6thmgUaHVj6lO+92UyZl2hfWUhp6SVg7wcSk1xLCw=;
 b=Sl1Wz/gv5tJHWD0z4jeICdsW+RE8XAfqAOSO/1BC93sOBPkZYhRKmHxgOZgzUDMmw2
 GEnDmKkh8xIziJalEyTy5SClAFAcPCw92c1GMJwPWarH/4sMOE3DtXO8J23dTlKY6tws
 ahB/4m7ZvKuIF53WudkhcLTgr4aE8oJS9ElOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rs6thmgUaHVj6lO+92UyZl2hfWUhp6SVg7wcSk1xLCw=;
 b=sBw4VCnsAWo/1Vn+EA55myhse2HAbEoQ1vaxtwRWEXLoPE5lOjV01Unc5wimeuOZ5a
 VEy1vq8d0BBYFz1UfytPJIfTgrdY+yU1ydP5xMS0hMrQpVQXrxOWGD25kivYltqnfhFT
 OnwQF3uMNDPPqadKxqq2KnATJmhB+SkQbr6HPjdfQhdtE3ZJ1ERvLQFqzJoPeUng8KX9
 h/dOImPtaC6b38/m0Im30LtadpovpVq0uyPNpcirf91ERQafcmdAFPIeQohlnDB69d2+
 oRai0iNSwlj7q5qJ1JqKiyiFSq0e6xBRq1wAvdnp00SGEyfic83tLNFUSmElxREkoDQu
 RTdw==
X-Gm-Message-State: AOAM530KORAQpCcnTkDuFDbGmr1LdY1mthDo83sHNk5FbpTNkCVvWyXF
 kY2B0QJA4fVecW+qyyk3Kc+7MDI5tnRW/aTxwPA=
X-Google-Smtp-Source: ABdhPJy4l49xEG6HNUsRy/adcsP5Eli0FTi8QH22aHxqC4c1gU4AN7/BSZ7Emt8VD9GxZPcrBMLUTFfORw5nqV3HKo0=
X-Received: by 2002:a05:620a:704:: with SMTP id 4mr7956453qkc.66.1621560495404; 
 Thu, 20 May 2021 18:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210520101346.16772-1-steven_lee@aspeedtech.com>
 <20210520101346.16772-4-steven_lee@aspeedtech.com>
In-Reply-To: <20210520101346.16772-4-steven_lee@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 May 2021 01:28:03 +0000
Message-ID: <CACPK8XfbNyAswQtpbc=Ymv2wNmh0MbJqQEibD1R-cU+FWcckMA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] mmc: sdhci-of-aspeed: Configure the SDHCIs as
 specified by the devicetree.
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
 <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 "open list:ASPEED SD/MMC DRIVER" <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 20 May 2021 at 10:16, Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> The hardware provides capability configuration registers for each SDHCI
> in the global configuration space for the SD controller. Writes to the
> global capability registers are mirrored to the capability registers in
> the associated SDHCI. Configuration of the capabilities must be written
> through the mirror registers prior to initialisation of the SDHCI.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

MMC maintainers, please ignore my other mail about taking the dts
patch through your tree. I didn't realise there were two dts patches;
I'll take them both through the aspeed tree once they are ready.
Please don't let that review stop you from applying this patch.

Cheers,

Joel

> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 48 ++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index d001c51074a0..65b5685f6c15 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -31,6 +31,11 @@
>  #define   ASPEED_SDC_S0_PHASE_OUT_EN   GENMASK(1, 0)
>  #define   ASPEED_SDC_PHASE_MAX         31
>
> +/* SDIO{10,20} */
> +#define ASPEED_SDC_CAP1_1_8V           (0 * 32 + 26)
> +/* SDIO{14,24} */
> +#define ASPEED_SDC_CAP2_SDR104         (1 * 32 + 1)
> +
>  struct aspeed_sdc {
>         struct clk *clk;
>         struct resource *res;
> @@ -72,6 +77,37 @@ struct aspeed_sdhci {
>         const struct aspeed_sdhci_phase_desc *phase_desc;
>  };
>
> +/*
> + * The function sets the mirror register for updating
> + * capbilities of the current slot.
> + *
> + *   slot | capability  | caps_reg | mirror_reg
> + *   -----|-------------|----------|------------
> + *     0  | CAP1_1_8V   | SDIO140  |   SDIO10
> + *     0  | CAP2_SDR104 | SDIO144  |   SDIO14
> + *     1  | CAP1_1_8V   | SDIO240  |   SDIO20
> + *     1  | CAP2_SDR104 | SDIO244  |   SDIO24
> + */
> +static void aspeed_sdc_set_slot_capability(struct sdhci_host *host, struct aspeed_sdc *sdc,
> +                                          int capability, bool enable, u8 slot)
> +{
> +       u32 mirror_reg_offset;
> +       u32 cap_val;
> +       u8 cap_reg;
> +
> +       if (slot > 1)
> +               return;
> +
> +       cap_reg = capability / 32;
> +       cap_val = sdhci_readl(host, 0x40 + (cap_reg * 4));
> +       if (enable)
> +               cap_val |= BIT(capability % 32);
> +       else
> +               cap_val &= ~BIT(capability % 32);
> +       mirror_reg_offset = ((slot + 1) * 0x10) + (cap_reg * 4);
> +       writel(cap_val, sdc->regs + mirror_reg_offset);
> +}
> +
>  static void aspeed_sdc_configure_8bit_mode(struct aspeed_sdc *sdc,
>                                            struct aspeed_sdhci *sdhci,
>                                            bool bus8)
> @@ -328,6 +364,7 @@ static inline int aspeed_sdhci_calculate_slot(struct aspeed_sdhci *dev,
>  static int aspeed_sdhci_probe(struct platform_device *pdev)
>  {
>         const struct aspeed_sdhci_pdata *aspeed_pdata;
> +       struct device_node *np = pdev->dev.of_node;
>         struct sdhci_pltfm_host *pltfm_host;
>         struct aspeed_sdhci *dev;
>         struct sdhci_host *host;
> @@ -372,6 +409,17 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
>
>         sdhci_get_of_property(pdev);
>
> +       if (of_property_read_bool(np, "mmc-hs200-1_8v") ||
> +           of_property_read_bool(np, "sd-uhs-sdr104")) {
> +               aspeed_sdc_set_slot_capability(host, dev->parent, ASPEED_SDC_CAP1_1_8V,
> +                                              true, slot);
> +       }
> +
> +       if (of_property_read_bool(np, "sd-uhs-sdr104")) {
> +               aspeed_sdc_set_slot_capability(host, dev->parent, ASPEED_SDC_CAP2_SDR104,
> +                                              true, slot);
> +       }
> +
>         pltfm_host->clk = devm_clk_get(&pdev->dev, NULL);
>         if (IS_ERR(pltfm_host->clk))
>                 return PTR_ERR(pltfm_host->clk);
> --
> 2.17.1
>
