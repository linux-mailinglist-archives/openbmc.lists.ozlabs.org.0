Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0A138E876
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 16:12:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpfKm47l7z2ym4
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 00:12:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pbgNUmfp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pbgNUmfp; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpfKS6xpdz2yjJ
 for <openbmc@lists.ozlabs.org>; Tue, 25 May 2021 00:11:54 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id r5so40848725lfr.5
 for <openbmc@lists.ozlabs.org>; Mon, 24 May 2021 07:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/yZGsZDGj6VwJI2huNhq3QoEWnA9XjvVe/EfZq4y7IU=;
 b=pbgNUmfpmE+TUnwYGWa4+Cr8UT5p+RNDrrQf6fokKwwro+TbWKERs2VaUCqCAqsBxA
 I5TWFMPioWQdKlL+6MfKFR/wp6EmqQGuoA1C+6bhCqfstK6RzS/ZhkqYuPyoxo8WbNBc
 XlsOS3fFXH+dAkql4342osYDPx8Ey7GqFptWyAYbp/ASsmyS6WraUNbATVAUcgzJWo/K
 T6rVcFOxsVeIqWjoSbjOdE7Eb1irD5xl1pBziojPDGreqr1x00ExHeA284yUpteD6x6y
 euIdJh+5pr5YNBBWZJPQM0Fvc9Dg+KbpX6mRFnYuB28NPTOIu37uncKP0J3Z/9GJZ8gM
 63ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/yZGsZDGj6VwJI2huNhq3QoEWnA9XjvVe/EfZq4y7IU=;
 b=PSJh0+Iu1Sbg79+dQkqrHxqRicEHKQfvfaKOcb9kuQYmf233NvTFDyyfvJlnGciCof
 IPOyx9oHA/oFIR0GvGK/eKS1sFJrc/jTwztRZ2L53PFsrRbw+VnZVYcuF6JI3KzHz7/S
 DOKHF3WzGeExInQ0o9iQqjME4CO0s6aHaRo6+IXXK46fhBAakYplaYc65sdwRQoC2yU9
 iukX28/vzoFsUU81CmDRwBh6z4fIGc0XCe5//TYf3REeqlpVetK16S9QC1y49HGacbqR
 g2chBt0lfEMpd9j2x6gKwpYKNcPTjJeeqdy3ejjtkLBPbdus2wZG6r4BRUCT/ONjCUEB
 OVsw==
X-Gm-Message-State: AOAM532JZC2DX2P2yxiqGW4pR2SI6x8rjY83OFjklJbQjgqAbqldLlue
 foHxYZIxPf+8MsAllBWuEPd2jqkA/14NAQ2Oiq4TTQ==
X-Google-Smtp-Source: ABdhPJw3DDszILd4fOwSk02DmS3LBF/6L9iWayO0ZEI9oK+oW8u6lCsJSES4QzzosVigXKy0dhQfIFXD4tnEHBmlMEw=
X-Received: by 2002:a05:6512:49b:: with SMTP id
 v27mr11106312lfq.29.1621865507531; 
 Mon, 24 May 2021 07:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210524073308.9328-1-steven_lee@aspeedtech.com>
 <20210524073308.9328-5-steven_lee@aspeedtech.com>
In-Reply-To: <20210524073308.9328-5-steven_lee@aspeedtech.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 24 May 2021 16:11:08 +0200
Message-ID: <CAPDyKFqd+ZdPVuFKf-C7ztQp_aH9HOXByq6qwykkdU9Aku3pAA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] mmc: sdhci-of-aspeed: Configure the SDHCIs as
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
 <devicetree@vger.kernel.org>, ryan_chen@aspeedtech.com,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 chin-ting_kuo@aspeedtech.com, open list <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Hongweiz@ami.com,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 24 May 2021 at 09:33, Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> The hardware provides capability configuration registers for each SDHCI
> in the global configuration space for the SD controller. Writes to the
> global capability registers are mirrored to the capability registers in
> the associated SDHCI. Configuration of the capabilities must be written
> through the mirror registers prior to initialisation of the SDHCI.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Applied for next, thanks!

Kind regards
Uffe


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
