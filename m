Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CED733475D6
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 11:21:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F546F6JxMz30Lp
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 21:21:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hGdgJIzr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::936;
 helo=mail-ua1-x936.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hGdgJIzr; dkim-atps=neutral
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F54600HV5z2yYw
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 21:21:41 +1100 (AEDT)
Received: by mail-ua1-x936.google.com with SMTP id e1so294981uaa.4
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7apWozlOt2FqRFycW0Hur3TIoMg6mDhSrYsqHBdsqD4=;
 b=hGdgJIzrda8kSnAFgL4/2AUpL5DTF8JT9DcD9XJSSpJprxaISt3xgyXRR3jSTS8hG5
 uL4YqQ/0t1Wc4rlLCIuHzW2N0vlvtZQcUqKEXndQDVU8y9ab7HORaN2ubRe0VbcnfiF7
 SWAF2+YXtocGRkfGZPFjC88QArPPOgUXpu5lNHGECtxP/9a6i8uiLSTQh/ldr9aO6OU6
 Z8x+8pP+FbqFtXh2Lr1o9Z2lpL8IjqMDs/Dyk351DYp+IgUrv9G6/kEQV6+BsfmBMqYm
 NhKE8+zdjIas5GNlgwbqdTrMbWauhdm9//jvwQXb4FC9hqIXfrtUfXnrSw4lqBzQUiRW
 ySYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7apWozlOt2FqRFycW0Hur3TIoMg6mDhSrYsqHBdsqD4=;
 b=srcWoDTeyL3mzd6WSpl4+aKrNwnRL2fK/YYoZj8QVWHvN0dltKPpz0AVIsBVTeaNmP
 cCQUgw0Mcm+4p6ykhzm5rlWiCoGRze0MEhmoIDHxNZvh0ngUvEVRyVFQPobEOydYAUe1
 E7oketgwF78bwQYF3ginbDhsRS2jXWdMaIONVFZuy7odfRZrVRQoa4IyNFCOj3JTn5DF
 Dt0nvdVLPnJ9oRDm/9TI9GLeRWeVxo1PIMce4n/iBHcqVuSRngw/DUgc3csilYOvvPzm
 vhrs7jWM2yvlO7sQxz402M4JQFi7/gTiXmTZ9OKpNPEtqA27yFCP8n9w3oeJxDD4sTUH
 mbPA==
X-Gm-Message-State: AOAM533BoOWj+5gr7jEmIz9KNwX4rYx/qH0dvgN9ggFdWZFFJ5fEAZLD
 fy36obBGislV3JHnPscqmQaLTV5S2Ui6ksI7DKvMJg==
X-Google-Smtp-Source: ABdhPJx11OsxN0jvvUTrVF43kL0pyJRkssrUH5DhNuWjNKYwMbxeLZCTPogRmz6xHOov1pAOQN7zV2LeS3TnJLPKDIA=
X-Received: by 2002:a9f:2843:: with SMTP id c61mr952901uac.129.1616581295909; 
 Wed, 24 Mar 2021 03:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210324155013.1e5faa3c@xhacker.debian>
In-Reply-To: <20210324155013.1e5faa3c@xhacker.debian>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 24 Mar 2021 11:20:59 +0100
Message-ID: <CAPDyKFpau=FRCupREsgZiwFv-XRhH04si1wKiEPwM4K2+fct1w@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci: replace mmc->parent with mmc_dev() for
 consistency
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Angelo Dureghello <angelo.dureghello@timesys.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 24 Mar 2021 at 08:50, Jisheng Zhang <Jisheng.Zhang@synaptics.com> wrote:
>
> As pointed out by Ulf, "both "mmc->parent" and mmc_dev(mmc) are being
> used in the entire c-file". Convert all the mmc->parent usage in all
> sdhci host driver to mmc_dev() for consistency.
>
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-esdhc-mcf.c |  8 +++----
>  drivers/mmc/host/sdhci-of-aspeed.c |  2 +-
>  drivers/mmc/host/sdhci-tegra.c     | 34 +++++++++++++++---------------
>  drivers/mmc/host/sdhci.c           | 24 ++++++++++-----------
>  drivers/mmc/host/sdhci_am654.c     |  2 +-
>  5 files changed, 35 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-mcf.c b/drivers/mmc/host/sdhci-esdhc-mcf.c
> index ca7a1690b2a8..05926bf5ecf9 100644
> --- a/drivers/mmc/host/sdhci-esdhc-mcf.c
> +++ b/drivers/mmc/host/sdhci-esdhc-mcf.c
> @@ -367,14 +367,14 @@ static int esdhc_mcf_plat_init(struct sdhci_host *host,
>                                struct pltfm_mcf_data *mcf_data)
>  {
>         struct mcf_esdhc_platform_data *plat_data;
> +       struct device *dev = mmc_dev(host->mmc);
>
> -       if (!host->mmc->parent->platform_data) {
> -               dev_err(mmc_dev(host->mmc), "no platform data!\n");
> +       if (!dev->platform_data) {
> +               dev_err(dev, "no platform data!\n");
>                 return -EINVAL;
>         }
>
> -       plat_data = (struct mcf_esdhc_platform_data *)
> -                       host->mmc->parent->platform_data;
> +       plat_data = (struct mcf_esdhc_platform_data *)dev->platform_data;
>
>         /* Card_detect */
>         switch (plat_data->cd_type) {
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index 7d8692e90996..d001c51074a0 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -181,7 +181,7 @@ aspeed_sdhci_configure_phase(struct sdhci_host *host, unsigned long rate)
>         struct aspeed_sdhci *sdhci;
>         struct device *dev;
>
> -       dev = host->mmc->parent;
> +       dev = mmc_dev(host->mmc);
>         sdhci = sdhci_pltfm_priv(sdhci_priv(host));
>
>         if (!sdhci->phase_desc)
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index 41d193fa77bb..c61f797a853f 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -596,49 +596,49 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct sdhci_host *host)
>                         &tegra_host->autocal_offsets;
>         int err;
>
> -       err = device_property_read_u32(host->mmc->parent,
> +       err = device_property_read_u32(mmc_dev(host->mmc),
>                         "nvidia,pad-autocal-pull-up-offset-3v3",
>                         &autocal->pull_up_3v3);
>         if (err)
>                 autocal->pull_up_3v3 = 0;
>
> -       err = device_property_read_u32(host->mmc->parent,
> +       err = device_property_read_u32(mmc_dev(host->mmc),
>                         "nvidia,pad-autocal-pull-down-offset-3v3",
>                         &autocal->pull_down_3v3);
>         if (err)
>                 autocal->pull_down_3v3 = 0;
>
> -       err = device_property_read_u32(host->mmc->parent,
> +       err = device_property_read_u32(mmc_dev(host->mmc),
>                         "nvidia,pad-autocal-pull-up-offset-1v8",
>                         &autocal->pull_up_1v8);
>         if (err)
>                 autocal->pull_up_1v8 = 0;
>
> -       err = device_property_read_u32(host->mmc->parent,
> +       err = device_property_read_u32(mmc_dev(host->mmc),
>                         "nvidia,pad-autocal-pull-down-offset-1v8",
>                         &autocal->pull_down_1v8);
>         if (err)
>                 autocal->pull_down_1v8 = 0;
>
> -       err = device_property_read_u32(host->mmc->parent,
> +       err = device_property_read_u32(mmc_dev(host->mmc),
>                         "nvidia,pad-autocal-pull-up-offset-sdr104",
>                         &autocal->pull_up_sdr104);
>         if (err)
>                 autocal->pull_up_sdr104 = autocal->pull_up_1v8;
>
> -       err = device_property_read_u32(host->mmc->parent,
> +       err = device_property_read_u32(mmc_dev(host->mmc),
>                         "nvidia,pad-autocal-pull-down-offset-sdr104",
>                         &autocal->pull_down_sdr104);
>         if (err)
>                 autocal->pull_down_sdr104 = autocal->pull_down_1v8;
>
> -       err = device_property_read_u32(host->mmc->parent,
> +       err = device_property_read_u32(mmc_dev(host->mmc),
>                         "nvidia,pad-autocal-pull-up-offset-hs400",
>                         &autocal->pull_up_hs400);
>         if (err)
>                 autocal->pull_up_hs400 = autocal->pull_up_1v8;
>
> -       err = device_property_read_u32(host->mmc->parent,
> +       err = device_property_read_u32(mmc_dev(host->mmc),
>                         "nvidia,pad-autocal-pull-down-offset-hs400",
>                         &autocal->pull_down_hs400);
>         if (err)
> @@ -653,7 +653,7 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct sdhci_host *host)
>         if (!(tegra_host->soc_data->nvquirks & NVQUIRK_NEEDS_PAD_CONTROL))
>                 return;
>
> -       err = device_property_read_u32(host->mmc->parent,
> +       err = device_property_read_u32(mmc_dev(host->mmc),
>                         "nvidia,pad-autocal-pull-up-offset-3v3-timeout",
>                         &autocal->pull_up_3v3_timeout);
>         if (err) {
> @@ -664,7 +664,7 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct sdhci_host *host)
>                 autocal->pull_up_3v3_timeout = 0;
>         }
>
> -       err = device_property_read_u32(host->mmc->parent,
> +       err = device_property_read_u32(mmc_dev(host->mmc),
>                         "nvidia,pad-autocal-pull-down-offset-3v3-timeout",
>                         &autocal->pull_down_3v3_timeout);
>         if (err) {
> @@ -675,7 +675,7 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct sdhci_host *host)
>                 autocal->pull_down_3v3_timeout = 0;
>         }
>
> -       err = device_property_read_u32(host->mmc->parent,
> +       err = device_property_read_u32(mmc_dev(host->mmc),
>                         "nvidia,pad-autocal-pull-up-offset-1v8-timeout",
>                         &autocal->pull_up_1v8_timeout);
>         if (err) {
> @@ -686,7 +686,7 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct sdhci_host *host)
>                 autocal->pull_up_1v8_timeout = 0;
>         }
>
> -       err = device_property_read_u32(host->mmc->parent,
> +       err = device_property_read_u32(mmc_dev(host->mmc),
>                         "nvidia,pad-autocal-pull-down-offset-1v8-timeout",
>                         &autocal->pull_down_1v8_timeout);
>         if (err) {
> @@ -720,17 +720,17 @@ static void tegra_sdhci_parse_tap_and_trim(struct sdhci_host *host)
>         struct sdhci_tegra *tegra_host = sdhci_pltfm_priv(pltfm_host);
>         int err;
>
> -       err = device_property_read_u32(host->mmc->parent, "nvidia,default-tap",
> +       err = device_property_read_u32(mmc_dev(host->mmc), "nvidia,default-tap",
>                                        &tegra_host->default_tap);
>         if (err)
>                 tegra_host->default_tap = 0;
>
> -       err = device_property_read_u32(host->mmc->parent, "nvidia,default-trim",
> +       err = device_property_read_u32(mmc_dev(host->mmc), "nvidia,default-trim",
>                                        &tegra_host->default_trim);
>         if (err)
>                 tegra_host->default_trim = 0;
>
> -       err = device_property_read_u32(host->mmc->parent, "nvidia,dqs-trim",
> +       err = device_property_read_u32(mmc_dev(host->mmc), "nvidia,dqs-trim",
>                                        &tegra_host->dqs_trim);
>         if (err)
>                 tegra_host->dqs_trim = 0x11;
> @@ -741,7 +741,7 @@ static void tegra_sdhci_parse_dt(struct sdhci_host *host)
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>         struct sdhci_tegra *tegra_host = sdhci_pltfm_priv(pltfm_host);
>
> -       if (device_property_read_bool(host->mmc->parent, "supports-cqe"))
> +       if (device_property_read_bool(mmc_dev(host->mmc), "supports-cqe"))
>                 tegra_host->enable_hwcq = true;
>         else
>                 tegra_host->enable_hwcq = false;
> @@ -1529,7 +1529,7 @@ static int sdhci_tegra_add_host(struct sdhci_host *host)
>
>         host->mmc->caps2 |= MMC_CAP2_CQE | MMC_CAP2_CQE_DCMD;
>
> -       cq_host = devm_kzalloc(host->mmc->parent,
> +       cq_host = devm_kzalloc(mmc_dev(host->mmc),
>                                 sizeof(*cq_host), GFP_KERNEL);
>         if (!cq_host) {
>                 ret = -ENOMEM;
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index aefd0441658c..bf238ade1602 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -188,7 +188,7 @@ static void sdhci_runtime_pm_bus_on(struct sdhci_host *host)
>         if (host->bus_on)
>                 return;
>         host->bus_on = true;
> -       pm_runtime_get_noresume(host->mmc->parent);
> +       pm_runtime_get_noresume(mmc_dev(host->mmc));
>  }
>
>  static void sdhci_runtime_pm_bus_off(struct sdhci_host *host)
> @@ -196,7 +196,7 @@ static void sdhci_runtime_pm_bus_off(struct sdhci_host *host)
>         if (!host->bus_on)
>                 return;
>         host->bus_on = false;
> -       pm_runtime_put_noidle(host->mmc->parent);
> +       pm_runtime_put_noidle(mmc_dev(host->mmc));
>  }
>
>  void sdhci_reset(struct sdhci_host *host, u8 mask)
> @@ -648,7 +648,7 @@ static int sdhci_pre_dma_transfer(struct sdhci_host *host,
>                         }
>                 }
>                 /* Switch ownership to the DMA */
> -               dma_sync_single_for_device(host->mmc->parent,
> +               dma_sync_single_for_device(mmc_dev(host->mmc),
>                                            host->bounce_addr,
>                                            host->bounce_buffer_size,
>                                            mmc_get_dma_dir(data));
> @@ -1176,7 +1176,7 @@ static int sdhci_external_dma_init(struct sdhci_host *host)
>         int ret = 0;
>         struct mmc_host *mmc = host->mmc;
>
> -       host->tx_chan = dma_request_chan(mmc->parent, "tx");
> +       host->tx_chan = dma_request_chan(mmc_dev(mmc), "tx");
>         if (IS_ERR(host->tx_chan)) {
>                 ret = PTR_ERR(host->tx_chan);
>                 if (ret != -EPROBE_DEFER)
> @@ -1185,7 +1185,7 @@ static int sdhci_external_dma_init(struct sdhci_host *host)
>                 return ret;
>         }
>
> -       host->rx_chan = dma_request_chan(mmc->parent, "rx");
> +       host->rx_chan = dma_request_chan(mmc_dev(mmc), "rx");
>         if (IS_ERR(host->rx_chan)) {
>                 if (host->tx_chan) {
>                         dma_release_channel(host->tx_chan);
> @@ -2489,14 +2489,14 @@ void sdhci_enable_sdio_irq(struct mmc_host *mmc, int enable)
>         unsigned long flags;
>
>         if (enable)
> -               pm_runtime_get_noresume(mmc->parent);
> +               pm_runtime_get_noresume(mmc_dev(mmc));
>
>         spin_lock_irqsave(&host->lock, flags);
>         sdhci_enable_sdio_irq_nolock(host, enable);
>         spin_unlock_irqrestore(&host->lock, flags);
>
>         if (!enable)
> -               pm_runtime_put_noidle(mmc->parent);
> +               pm_runtime_put_noidle(mmc_dev(mmc));
>  }
>  EXPORT_SYMBOL_GPL(sdhci_enable_sdio_irq);
>
> @@ -3063,7 +3063,7 @@ static bool sdhci_request_done(struct sdhci_host *host)
>                                                 length = host->bounce_buffer_size;
>                                         }
>                                         dma_sync_single_for_cpu(
> -                                               host->mmc->parent,
> +                                               mmc_dev(host->mmc),
>                                                 host->bounce_addr,
>                                                 host->bounce_buffer_size,
>                                                 DMA_FROM_DEVICE);
> @@ -3074,7 +3074,7 @@ static bool sdhci_request_done(struct sdhci_host *host)
>                                 } else {
>                                         /* No copying, just switch ownership */
>                                         dma_sync_single_for_cpu(
> -                                               host->mmc->parent,
> +                                               mmc_dev(host->mmc),
>                                                 host->bounce_addr,
>                                                 host->bounce_buffer_size,
>                                                 mmc_get_dma_dir(data));
> @@ -4053,7 +4053,7 @@ static void sdhci_allocate_bounce_buffer(struct sdhci_host *host)
>          * speedups by the help of a bounce buffer to group scattered
>          * reads/writes together.
>          */
> -       host->bounce_buffer = devm_kmalloc(mmc->parent,
> +       host->bounce_buffer = devm_kmalloc(mmc_dev(mmc),
>                                            bounce_size,
>                                            GFP_KERNEL);
>         if (!host->bounce_buffer) {
> @@ -4067,11 +4067,11 @@ static void sdhci_allocate_bounce_buffer(struct sdhci_host *host)
>                 return;
>         }
>
> -       host->bounce_addr = dma_map_single(mmc->parent,
> +       host->bounce_addr = dma_map_single(mmc_dev(mmc),
>                                            host->bounce_buffer,
>                                            bounce_size,
>                                            DMA_BIDIRECTIONAL);
> -       ret = dma_mapping_error(mmc->parent, host->bounce_addr);
> +       ret = dma_mapping_error(mmc_dev(mmc), host->bounce_addr);
>         if (ret)
>                 /* Again fall back to max_segs == 1 */
>                 return;
> diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am654.c
> index 7a34649b0754..1fad6e442688 100644
> --- a/drivers/mmc/host/sdhci_am654.c
> +++ b/drivers/mmc/host/sdhci_am654.c
> @@ -558,7 +558,7 @@ static int sdhci_am654_cqe_add_host(struct sdhci_host *host)
>         struct cqhci_host *cq_host;
>         int ret;
>
> -       cq_host = devm_kzalloc(host->mmc->parent, sizeof(struct cqhci_host),
> +       cq_host = devm_kzalloc(mmc_dev(host->mmc), sizeof(struct cqhci_host),
>                                GFP_KERNEL);
>         if (!cq_host)
>                 return -ENOMEM;
> --
> 2.31.0
>
