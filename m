Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEACD37111E
	for <lists+openbmc@lfdr.de>; Mon,  3 May 2021 07:05:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYWBf63Rmz3026
	for <lists+openbmc@lfdr.de>; Mon,  3 May 2021 15:05:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=an2TWdeM;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=YkbzeqPr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=an2TWdeM; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=YkbzeqPr; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYWBK2nDtz2xZN;
 Mon,  3 May 2021 15:05:13 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id C8347580965;
 Mon,  3 May 2021 01:05:10 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 03 May 2021 01:05:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=wZbGrNNB8IKzZFmeNM9BGTHd9BMaGLO
 Y6F6xSuyaF18=; b=an2TWdeMwdv8G1iuCS7DLTs+lkXvq+3tfPdMyDwI8dKWrwb
 nqewtPcOrnJcnUQVKnwvR25JJSISoytO/AM9I10ERmpOFh3YFchv8o/zgb2pUhkN
 3rFGTOPy0wf9w1b92SHb/feEig5yygfJ8YHJ0H+A3zucZYwZ7q/fyRGPPKnpIsHH
 Q1/Oko9+7NSc/136v6C1+UD/KWP3m4HTymdJ/tug0hZVVH86PpjUbleRUIqX4Bmw
 uotf4YaCUQVHfh0pQIbCihGEIVvAVeTrdcgs34TcDN49yj48dBP0/3Yu86neanW5
 IX18wDddBFZTiQuHMcQvRmfo+1IHUKQNvRG+CbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wZbGrN
 NB8IKzZFmeNM9BGTHd9BMaGLOY6F6xSuyaF18=; b=YkbzeqPr/dG3JUY06vDlmK
 VJk70rwWuEiFMHNiufwjudRM4UPee9bLpphSHInHvz48X/pr8wm1QIIDdyEMeAH9
 9L8K26/XQ4A3U/oJmErTK2TabpGw9ixtKXIAigvT2xLOZT57b7tenZsZT804NOZ7
 YmZPaxphcpPvwvIxeErT0E4ZQDHx8ybIN3se1m8+D9z2ofm+wcLvDUK53lbKwFiM
 iUk2vKKAju/JwGtrKrHBHe6zWzLKA2qs1MfK8RcxmJHLFU+lAA9xEDXl52XqnJOp
 /DgiEGxQTL0fU5IBhwdtl28uM7WDSiBrA+ACnzPfgITw5EsI+lGAx8/yjaDIGvRQ
 ==
X-ME-Sender: <xms:hYSPYOQ9i-YmIaf2oz8_l3gnTSGkDhB40MtrBw3M1iAe_WQDEsfVug>
 <xme:hYSPYDxOClEVmVpc9F2c4u8tWvqBBRNnk01eWhXmcO27r8jREP03Q9SGpDiWzkaie
 4maE1qL2S95aaSzYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeffedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepudehtddtleektedvfeeitdeljeekveelkeegvdfhtdejhefgfedtfedv
 jeejledtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:hYSPYL2PXeI_2hOapbM_66Bgz4GwPLsvlkAlB1ibk3HDt-DKSxX1lQ>
 <xmx:hYSPYKBtGR7LzIS7XveVVluZoP05OGw7jB7K_EXTWWoJkpKOku-UIA>
 <xmx:hYSPYHgxFbWVSRXaZn1HR5SGxmcMaXv_TKAmT426JpXIfwZNWLEq2A>
 <xmx:hoSPYGM25aBK1ISbcPP1Igz7dR0rp18Gu8wf0_CrLi_j7WllcTxiXg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4BBB0A00079; Mon,  3 May 2021 01:05:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <f1e86e81-d385-429a-ab8a-475240925f21@www.fastmail.com>
In-Reply-To: <20210503014336.20256-4-steven_lee@aspeedtech.com>
References: <20210503014336.20256-1-steven_lee@aspeedtech.com>
 <20210503014336.20256-4-steven_lee@aspeedtech.com>
Date: Mon, 03 May 2021 14:34:06 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>,
 "Adrian Hunter" <adrian.hunter@intel.com>,
 "Ulf Hansson" <ulf.hansson@linaro.org>, "Joel Stanley" <joel@jms.id.au>,
 "Philipp Zabel" <p.zabel@pengutronix.de>,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, 
 "open list" <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_3/3]_mmc:_sdhci-of-aspeed:_Sync_capabilities_fro?=
 =?UTF-8?Q?m_device_tree_to_ast2600_SoC_registers?=
Content-Type: text/plain
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
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Hongwei Zhang <Hongweiz@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Steven,

On Mon, 3 May 2021, at 11:13, Steven Lee wrote:
> Sync Capbility Registers(SDIO140, SDIO144, SDIO240, SDIO244) of ast2600
> SoC from the device tree.
> The bit 26(Voltage Support 1.8v) of SDIO140/SDIO240 is set to 1 if
> "mmc-hs200-1_8v" or "sd-uhs-sdr104" is added in the device tree.
> The bit 1(SDR104 Supported) of SDR144/SDR244 is set to 1 if "sd-uhs-sdr104"
> is added in the device tree.
> "timing-phase" is synced to SDIO0F4(Colock Phase Control)
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 107 ++++++++++++++++++++++++++---
>  1 file changed, 98 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c 
> b/drivers/mmc/host/sdhci-of-aspeed.c
> index 7d8692e90996..2d755bac777a 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -13,6 +13,7 @@
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>  #include <linux/spinlock.h>
>  
>  #include "sdhci-pltfm.h"
> @@ -30,10 +31,18 @@
>  #define   ASPEED_SDC_S0_PHASE_IN_EN	BIT(2)
>  #define   ASPEED_SDC_S0_PHASE_OUT_EN	GENMASK(1, 0)
>  #define   ASPEED_SDC_PHASE_MAX		31
> +#define ASPEED_SDC_CAP1_1_8V           BIT(26)
> +#define ASPEED_SDC_CAP2_SDR104         BIT(1)
> +#define PROBE_AFTER_ASSET_DEASSERT     0x1
> +
> +struct aspeed_sdc_info {
> +	u32 flag;
> +};
>  
>  struct aspeed_sdc {
>  	struct clk *clk;
>  	struct resource *res;
> +	struct reset_control *rst;
>  
>  	spinlock_t lock;
>  	void __iomem *regs;
> @@ -72,6 +81,44 @@ struct aspeed_sdhci {
>  	const struct aspeed_sdhci_phase_desc *phase_desc;
>  };
>  
> +struct aspeed_sdc_info ast2600_sdc_info = {
> +	.flag = PROBE_AFTER_ASSET_DEASSERT
> +};
> +
> +/*
> + * The function sets the mirror register for updating
> + * capbilities of the current slot.
> + *
> + *   slot | cap_idx | caps_reg | mirror_reg
> + *   -----|---------|----------|------------
> + *     0  |    0    | SDIO140  |   SDIO10
> + *     0  |    1    | SDIO144  |   SDIO14
> + *     1  |    0    | SDIO240  |   SDIO20
> + *     1  |    1    | SDIO244  |   SDIO24
> + */
> +static void aspeed_sdc_set_slot_capability(struct sdhci_host *host,
> +					   struct aspeed_sdc *sdc,
> +					   u32 reg_val,
> +					   u8 slot,
> +					   u8 cap_idx)

Having thought about this some more now we have code, I wonder if we can get
rid of `cap_idx` as a parameter. Something like:

static void aspeed_sdc_set_slot_capability(struct sdhci_host *host,
    struct aspeed_sdc *sdc, int capability, bool enable, u8 slot);

From there, instead of

#define ASPEED_SDC_CAP1_1_8V           BIT(26)
#define ASPEED_SDC_CAP2_SDR104         BIT(1)

We do

/* SDIO{10,20} */
#define ASPEED_SDC_CAP1_1_8V           (0 * 32 + 26)
/* SDIO{14,24} */
#define ASPEED_SDC_CAP2_SDR104         (1 * 32 + 1)

Then in the implementation of aspeed_sdc_set_slot_capability() we 
derive cap_idx and reg_val:

u8 reg_val = enable * BIT(capability % 32);
u8 cap_reg = capability / 32;

That way we get rid of the 0 and 1 magic values for cap_idx when 
invoking aspeed_sdc_set_slot_capability() and the caller can't
accidentally pass the wrong value.

> +{
> +	u8 caps_reg_offset;
> +	u32 caps_reg;
> +	u32 mirror_reg_offset;
> +	u32 caps_val;
> +
> +	if (cap_idx > 1 || slot > 1)
> +		return;
> +
> +	caps_reg_offset = (cap_idx == 0) ? 0 : 4;
> +	caps_reg = 0x40 + caps_reg_offset;
> +	caps_val = sdhci_readl(host, caps_reg);

Hmm, I think you used sdhci_readl() because I commented on that last 
time. If the global-area registers are truly mirrored we could read 
from them as well right? In which case we could just use 
readl(sdc->regs + mirror_reg_offset)? If so we can drop the host 
parameter and (incorporating my suggestion above) just have:

static void aspeed_sdc_set_slot_capability(struct aspeed_sdc *sdc,
    int capability, bool enable, u8 slot);

Sorry if I've sort of flip-flopped on that, but I think originally you 
were still reading from the SDHCI (read-only) address?

> +	caps_val |= reg_val;
> +	mirror_reg_offset = (slot == 0) ? 0x10 : 0x20;
> +	mirror_reg_offset += caps_reg_offset;
> +	writel(caps_val, sdc->regs + mirror_reg_offset);
> +}
> +
>  static void aspeed_sdc_configure_8bit_mode(struct aspeed_sdc *sdc,
>  					   struct aspeed_sdhci *sdhci,
>  					   bool bus8)
> @@ -329,9 +376,11 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
>  {
>  	const struct aspeed_sdhci_pdata *aspeed_pdata;
>  	struct sdhci_pltfm_host *pltfm_host;
> +	struct device_node *np = pdev->dev.of_node;
>  	struct aspeed_sdhci *dev;
>  	struct sdhci_host *host;
>  	struct resource *res;
> +	u32 reg_val;
>  	int slot;
>  	int ret;
>  
> @@ -372,6 +421,21 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
>  
>  	sdhci_get_of_property(pdev);
>  
> +	if (of_property_read_bool(np, "mmc-hs200-1_8v") ||
> +	    of_property_read_bool(np, "sd-uhs-sdr104"))
> +		aspeed_sdc_set_slot_capability(host,
> +					       dev->parent,
> +					       ASPEED_SDC_CAP1_1_8V,
> +					       slot,
> +					       0);

See the discussion above about reworking aspeed_sdc_set_slot_capability.

> +
> +	if (of_property_read_bool(np, "sd-uhs-sdr104"))
> +		aspeed_sdc_set_slot_capability(host,
> +					       dev->parent,
> +					       ASPEED_SDC_CAP2_SDR104,
> +					       slot,
> +					       1);

Again here.

> +
>  	pltfm_host->clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(pltfm_host->clk))
>  		return PTR_ERR(pltfm_host->clk);
> @@ -476,12 +540,25 @@ static struct platform_driver aspeed_sdhci_driver = {
>  	.remove		= aspeed_sdhci_remove,
>  };
>  
> +static const struct of_device_id aspeed_sdc_of_match[] = {
> +	{ .compatible = "aspeed,ast2400-sd-controller", },
> +	{ .compatible = "aspeed,ast2500-sd-controller", },
> +	{ .compatible = "aspeed,ast2600-sd-controller", .data = &ast2600_sdc_info},
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, aspeed_sdc_of_match);
> +
>  static int aspeed_sdc_probe(struct platform_device *pdev)
>  
>  {
>  	struct device_node *parent, *child;
>  	struct aspeed_sdc *sdc;
> +	const struct of_device_id *match = NULL;
> +	const struct aspeed_sdc_info *info = NULL;
> +
>  	int ret;
> +	u32 timing_phase;
>  
>  	sdc = devm_kzalloc(&pdev->dev, sizeof(*sdc), GFP_KERNEL);
>  	if (!sdc)
> @@ -489,6 +566,23 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
>  
>  	spin_lock_init(&sdc->lock);
>  
> +	match = of_match_device(aspeed_sdc_of_match, &pdev->dev);
> +	if (!match)
> +		return -ENODEV;
> +
> +	if (match->data)
> +		info = match->data;
> +
> +	if (info) {
> +		if (info->flag & PROBE_AFTER_ASSET_DEASSERT) {
> +			sdc->rst = devm_reset_control_get(&pdev->dev, NULL);
> +			if (!IS_ERR(sdc->rst)) {
> +				reset_control_assert(sdc->rst);
> +				reset_control_deassert(sdc->rst);
> +			}
> +		}
> +	}

I think this should be a separate patch.

From the code it seems that this is necessary for just the 2600? Where 
is this documented?

> +
>  	sdc->clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(sdc->clk))
>  		return PTR_ERR(sdc->clk);
> @@ -506,6 +600,10 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
>  		goto err_clk;
>  	}
>  
> +	if (!of_property_read_u32(pdev->dev.of_node,
> +				  "timing-phase", &timing_phase))
> +		writel(timing_phase, sdc->regs + ASPEED_SDC_PHASE);

I asked on v1 that you use the phase support already in the bindings 
and in the driver. The example you added in the binding document[1] 
used the existing devicetree properties but it seems you haven't fixed 
the code.

Please drop your phase implementation from the patch.

[1] https://lore.kernel.org/lkml/20210503014336.20256-2-steven_lee@aspeedtech.com/

Cheers,

Andrew
