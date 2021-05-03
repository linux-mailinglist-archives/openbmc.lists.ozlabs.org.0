Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCA3371425
	for <lists+openbmc@lfdr.de>; Mon,  3 May 2021 13:18:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYgSR5mNMz30Dd
	for <lists+openbmc@lfdr.de>; Mon,  3 May 2021 21:17:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=MSBKxfbE;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=dkUm4OfV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=MSBKxfbE; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=dkUm4OfV; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYgRy5VFvz2yxk;
 Mon,  3 May 2021 21:17:34 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 72EA3580C48;
 Mon,  3 May 2021 07:17:32 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 03 May 2021 07:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=tyvZJqgwOmKKS6RCyLrG9AQr4hux4r7
 BW6FnLw6sbKg=; b=MSBKxfbEDhADouxzrFv5ZkdbhKumGjEN1XiEW7EPQ9XvRev
 GjcNvQOPsNEfJT0PGwGxeDw/CC806+tE640R7YcyJ1MG7T4R4JyRyyOxSwZd9KU0
 GnTqKvkYnfIKZT8jMMLWayOwhUEt6VqW5dgoeKh08aTHcNQmvDmaCbi030ZDuoDu
 mN1OKOt5h1fb1GyW1fSYIf0rYMo7PHW/6bjXa+kHXP3KrlECYZk+m8rXdtGbVZIk
 Kz9PyFBV0sbUG1oR87KQnpq4x5xy4pxAE8SVLGU+8b6DZ7SA7qQaLYfoqvwaM74o
 YIc7UO60Hhfz3CvQz24hjT2JN1yWv5y3AXo1JYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tyvZJq
 gwOmKKS6RCyLrG9AQr4hux4r7BW6FnLw6sbKg=; b=dkUm4OfV3LwIUWRZrL5QY/
 kvTDfQN8S+2nYqAACrlKfviWlnOaqzXF/w7Y5wvIrZBqlrhLn3Qn0yDpX+rvNeI8
 7chY82+Ckfh8a2LC9fPWBnsNKy9Zitx5kpL+MHmFjn0rAionMPh5VBgZ5RlTCiMb
 BxJMsavpxMM349g2E72/KTAWX6qHY2yvjfEQdBmZgSvkKtO1Ldaw+Jyn4TQUbv+x
 IuE4TJfPkeoC93/XhjE8lPjiTMnKjen2PMyOqVdBNUKW1MwQSqkirdlGhL+sePp8
 aB99qoRFeDp9ff20nX5oHCmliMKHW+Bzy1spuotvZQAobavqdFP2gtb4V3axd/9Q
 ==
X-ME-Sender: <xms:ytuPYC0-SxD3bZLc2smtx3h2Hxr4rfmpKafYu7XZ9p-6R8Qx8GGUGQ>
 <xme:ytuPYFEDWCmIe0fRuHmZ9LKRjwVA21_SRaYQhXjCdE_UQZ6Jf04GEOvV5Aikcqpal
 RGD4G2mUg_lI98rGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgedgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepudehtddtleektedvfeeitdeljeekveelkeegvdfhtdejhefgfedtfedv
 jeejledtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:ytuPYK6HgPEp9F6XbN5aVYcnpf3BIXlTxLVXc4du2UvhEXTEMgJKmg>
 <xmx:ytuPYD2F64pBy6f4vYODZT8oH-WImBpPr5L1jrKyGbjdJndVMBFgxA>
 <xmx:ytuPYFFNfLabb_9zrZuOnZ_yAlbL0_RVRxE4bRNGJY2USZcvErCvgg>
 <xmx:zNuPYEBvkHkLIn87pNwj8YDzihqPIC90b81iUgdWTxeb_GjPLcx9sg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1D7C8A00079; Mon,  3 May 2021 07:17:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <fd19622c-ef24-4274-b56d-e929e95edcf2@www.fastmail.com>
In-Reply-To: <20210503105242.GB12520@aspeedtech.com>
References: <20210503014336.20256-1-steven_lee@aspeedtech.com>
 <20210503014336.20256-4-steven_lee@aspeedtech.com>
 <f1e86e81-d385-429a-ab8a-475240925f21@www.fastmail.com>
 <20210503105242.GB12520@aspeedtech.com>
Date: Mon, 03 May 2021 20:45:42 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hongwei Zhang <Hongweiz@ami.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 3 May 2021, at 20:22, Steven Lee wrote:
> The 05/03/2021 13:04, Andrew Jeffery wrote:
> > Hi Steven,
> > 
> > On Mon, 3 May 2021, at 11:13, Steven Lee wrote:
> > > Sync Capbility Registers(SDIO140, SDIO144, SDIO240, SDIO244) of ast2600
> > > SoC from the device tree.
> > > The bit 26(Voltage Support 1.8v) of SDIO140/SDIO240 is set to 1 if
> > > "mmc-hs200-1_8v" or "sd-uhs-sdr104" is added in the device tree.
> > > The bit 1(SDR104 Supported) of SDR144/SDR244 is set to 1 if "sd-uhs-sdr104"
> > > is added in the device tree.
> > > "timing-phase" is synced to SDIO0F4(Colock Phase Control)
> > > 
> > > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > > ---
> > >  drivers/mmc/host/sdhci-of-aspeed.c | 107 ++++++++++++++++++++++++++---
> > >  1 file changed, 98 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/mmc/host/sdhci-of-aspeed.c 
> > > b/drivers/mmc/host/sdhci-of-aspeed.c
> > > index 7d8692e90996..2d755bac777a 100644
> > > --- a/drivers/mmc/host/sdhci-of-aspeed.c
> > > +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> > > @@ -13,6 +13,7 @@
> > >  #include <linux/of.h>
> > >  #include <linux/of_platform.h>
> > >  #include <linux/platform_device.h>
> > > +#include <linux/reset.h>
> > >  #include <linux/spinlock.h>
> > >  
> > >  #include "sdhci-pltfm.h"
> > > @@ -30,10 +31,18 @@
> > >  #define   ASPEED_SDC_S0_PHASE_IN_EN	BIT(2)
> > >  #define   ASPEED_SDC_S0_PHASE_OUT_EN	GENMASK(1, 0)
> > >  #define   ASPEED_SDC_PHASE_MAX		31
> > > +#define ASPEED_SDC_CAP1_1_8V           BIT(26)
> > > +#define ASPEED_SDC_CAP2_SDR104         BIT(1)
> > > +#define PROBE_AFTER_ASSET_DEASSERT     0x1
> > > +
> > > +struct aspeed_sdc_info {
> > > +	u32 flag;
> > > +};
> > >  
> > >  struct aspeed_sdc {
> > >  	struct clk *clk;
> > >  	struct resource *res;
> > > +	struct reset_control *rst;
> > >  
> > >  	spinlock_t lock;
> > >  	void __iomem *regs;
> > > @@ -72,6 +81,44 @@ struct aspeed_sdhci {
> > >  	const struct aspeed_sdhci_phase_desc *phase_desc;
> > >  };
> > >  
> > > +struct aspeed_sdc_info ast2600_sdc_info = {
> > > +	.flag = PROBE_AFTER_ASSET_DEASSERT
> > > +};
> > > +
> > > +/*
> > > + * The function sets the mirror register for updating
> > > + * capbilities of the current slot.
> > > + *
> > > + *   slot | cap_idx | caps_reg | mirror_reg
> > > + *   -----|---------|----------|------------
> > > + *     0  |    0    | SDIO140  |   SDIO10
> > > + *     0  |    1    | SDIO144  |   SDIO14
> > > + *     1  |    0    | SDIO240  |   SDIO20
> > > + *     1  |    1    | SDIO244  |   SDIO24
> > > + */
> > > +static void aspeed_sdc_set_slot_capability(struct sdhci_host *host,
> > > +					   struct aspeed_sdc *sdc,
> > > +					   u32 reg_val,
> > > +					   u8 slot,
> > > +					   u8 cap_idx)
> > 
> > Having thought about this some more now we have code, I wonder if we can get
> > rid of `cap_idx` as a parameter. Something like:
> > 
> > static void aspeed_sdc_set_slot_capability(struct sdhci_host *host,
> >     struct aspeed_sdc *sdc, int capability, bool enable, u8 slot);
> > 
> > From there, instead of
> > 
> > #define ASPEED_SDC_CAP1_1_8V           BIT(26)
> > #define ASPEED_SDC_CAP2_SDR104         BIT(1)
> > 
> > We do
> > 
> > /* SDIO{10,20} */
> > #define ASPEED_SDC_CAP1_1_8V           (0 * 32 + 26)
> > /* SDIO{14,24} */
> > #define ASPEED_SDC_CAP2_SDR104         (1 * 32 + 1)
> > 
> > Then in the implementation of aspeed_sdc_set_slot_capability() we 
> > derive cap_idx and reg_val:
> > 
> > u8 reg_val = enable * BIT(capability % 32);
> > u8 cap_reg = capability / 32;
> > 
> > That way we get rid of the 0 and 1 magic values for cap_idx when 
> > invoking aspeed_sdc_set_slot_capability() and the caller can't
> > accidentally pass the wrong value.
> > 
> 
> Thanks for the detailed suggestion, I will modify the function as you
> suggested.

Great!

> 
> > > +{
> > > +	u8 caps_reg_offset;
> > > +	u32 caps_reg;
> > > +	u32 mirror_reg_offset;
> > > +	u32 caps_val;
> > > +
> > > +	if (cap_idx > 1 || slot > 1)
> > > +		return;
> > > +
> > > +	caps_reg_offset = (cap_idx == 0) ? 0 : 4;
> > > +	caps_reg = 0x40 + caps_reg_offset;
> > > +	caps_val = sdhci_readl(host, caps_reg);
> > 
> > Hmm, I think you used sdhci_readl() because I commented on that last 
> > time. If the global-area registers are truly mirrored we could read 
> > from them as well right? In which case we could just use 
> > readl(sdc->regs + mirror_reg_offset)? If so we can drop the host 
> > parameter and (incorporating my suggestion above) just have:
> > 
> > static void aspeed_sdc_set_slot_capability(struct aspeed_sdc *sdc,
> >     int capability, bool enable, u8 slot);
> > 
> > Sorry if I've sort of flip-flopped on that, but I think originally you 
> > were still reading from the SDHCI (read-only) address?
> > 
> 
> Yes, mirror registers are used to update the capability register, it returns
> zero if we read the mirror register.
> The test result is as follows:
> 
> # devmem 0x1e740010 32             // Read SDIO010(Mirror of SDIO140)
> 0x00000000
> 
> # devmem 0x1e740140 32             // Read capability
> 0x07FC0080
> 
> # devmem 0x1e740010 32 0x07fb0080  // Write mirror
> 
> # devmem 0x1e740010 32             // Read mirror
> 0x00000000
> 
> # devmem 0x1e740140 32             // Read capability
> 0x07FB0080

Ah well, I guess we continue to pass the struct sdhci_host pointer then.

> 
> > > +	caps_val |= reg_val;
> > > +	mirror_reg_offset = (slot == 0) ? 0x10 : 0x20;
> > > +	mirror_reg_offset += caps_reg_offset;
> > > +	writel(caps_val, sdc->regs + mirror_reg_offset);
> > > +}
> > > +
> > >  static void aspeed_sdc_configure_8bit_mode(struct aspeed_sdc *sdc,
> > >  					   struct aspeed_sdhci *sdhci,
> > >  					   bool bus8)
> > > @@ -329,9 +376,11 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
> > >  {
> > >  	const struct aspeed_sdhci_pdata *aspeed_pdata;
> > >  	struct sdhci_pltfm_host *pltfm_host;
> > > +	struct device_node *np = pdev->dev.of_node;
> > >  	struct aspeed_sdhci *dev;
> > >  	struct sdhci_host *host;
> > >  	struct resource *res;
> > > +	u32 reg_val;
> > >  	int slot;
> > >  	int ret;
> > >  
> > > @@ -372,6 +421,21 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
> > >  
> > >  	sdhci_get_of_property(pdev);
> > >  
> > > +	if (of_property_read_bool(np, "mmc-hs200-1_8v") ||
> > > +	    of_property_read_bool(np, "sd-uhs-sdr104"))
> > > +		aspeed_sdc_set_slot_capability(host,
> > > +					       dev->parent,
> > > +					       ASPEED_SDC_CAP1_1_8V,
> > > +					       slot,
> > > +					       0);
> > 
> > See the discussion above about reworking aspeed_sdc_set_slot_capability.
> > 
> 
> Will do it.
> 
> > > +
> > > +	if (of_property_read_bool(np, "sd-uhs-sdr104"))
> > > +		aspeed_sdc_set_slot_capability(host,
> > > +					       dev->parent,
> > > +					       ASPEED_SDC_CAP2_SDR104,
> > > +					       slot,
> > > +					       1);
> > 
> > Again here.
> > 
> 
> Will do it.
> 
> > > +
> > >  	pltfm_host->clk = devm_clk_get(&pdev->dev, NULL);
> > >  	if (IS_ERR(pltfm_host->clk))
> > >  		return PTR_ERR(pltfm_host->clk);
> > > @@ -476,12 +540,25 @@ static struct platform_driver aspeed_sdhci_driver = {
> > >  	.remove		= aspeed_sdhci_remove,
> > >  };
> > >  
> > > +static const struct of_device_id aspeed_sdc_of_match[] = {
> > > +	{ .compatible = "aspeed,ast2400-sd-controller", },
> > > +	{ .compatible = "aspeed,ast2500-sd-controller", },
> > > +	{ .compatible = "aspeed,ast2600-sd-controller", .data = &ast2600_sdc_info},
> > > +	{ }
> > > +};
> > > +
> > > +MODULE_DEVICE_TABLE(of, aspeed_sdc_of_match);
> > > +
> > >  static int aspeed_sdc_probe(struct platform_device *pdev)
> > >  
> > >  {
> > >  	struct device_node *parent, *child;
> > >  	struct aspeed_sdc *sdc;
> > > +	const struct of_device_id *match = NULL;
> > > +	const struct aspeed_sdc_info *info = NULL;
> > > +
> > >  	int ret;
> > > +	u32 timing_phase;
> > >  
> > >  	sdc = devm_kzalloc(&pdev->dev, sizeof(*sdc), GFP_KERNEL);
> > >  	if (!sdc)
> > > @@ -489,6 +566,23 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
> > >  
> > >  	spin_lock_init(&sdc->lock);
> > >  
> > > +	match = of_match_device(aspeed_sdc_of_match, &pdev->dev);
> > > +	if (!match)
> > > +		return -ENODEV;
> > > +
> > > +	if (match->data)
> > > +		info = match->data;
> > > +
> > > +	if (info) {
> > > +		if (info->flag & PROBE_AFTER_ASSET_DEASSERT) {
> > > +			sdc->rst = devm_reset_control_get(&pdev->dev, NULL);
> > > +			if (!IS_ERR(sdc->rst)) {
> > > +				reset_control_assert(sdc->rst);
> > > +				reset_control_deassert(sdc->rst);
> > > +			}
> > > +		}
> > > +	}
> > 
> > I think this should be a separate patch.
> > 
> > From the code it seems that this is necessary for just the 2600? Where 
> > is this documented?
> > 
> 
> Yes it is just for 2600. The patch is suggested by our chip designer and
> is used for cleaning up MMC controller.
> Currently, there is no document describes this changes.
> 
> And I have a question regarding the "separate patch", does it mean I should
> create another patch set or I can add a new patch in the current
> patch set?

Depends what you mean by this :)

It's kind-of awkward to send another patch as part of the existing v2 
of the series, as you'll wind up with what is effectively patch 4/3. 
It's less confusing to just send a v3 with all 4 patches.

However, in general if patches don't depend on each other it's good to 
send them as separate series, that way the series can be applied in any 
order.

> 
> > > +
> > >  	sdc->clk = devm_clk_get(&pdev->dev, NULL);
> > >  	if (IS_ERR(sdc->clk))
> > >  		return PTR_ERR(sdc->clk);
> > > @@ -506,6 +600,10 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
> > >  		goto err_clk;
> > >  	}
> > >  
> > > +	if (!of_property_read_u32(pdev->dev.of_node,
> > > +				  "timing-phase", &timing_phase))
> > > +		writel(timing_phase, sdc->regs + ASPEED_SDC_PHASE);
> > 
> > I asked on v1 that you use the phase support already in the bindings 
> > and in the driver. The example you added in the binding document[1] 
> > used the existing devicetree properties but it seems you haven't fixed 
> > the code.
> > 
> > Please drop your phase implementation from the patch.
> > 
> 
> Sorry, I misunderstand the comment in the v1 patch. I thought that I should use
> the exists ASPEED_SDC_PHASE for timing-phase.

Ah!

> 
> Now I think I understand what you mean in the previous review.
> I will remove the implementation you mentioned and add the following setting in
> the device tree to verify again.
> 
>  clk-phase-mmc-hs200 = <N>, <N>;

Right, that's what I was suggesting. We have support for most of the 
other speeds and as well (not just HS200, just that HS200 is what 
Rainier cares about), see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mmc/core/host.c?h=v5.12#n181

Cheers,

Andrew
