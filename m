Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A8F375EC4
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 04:14:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbvCX1jZWz2ykJ
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 12:14:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=ABCX2VIl;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=jigSVRzE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=ABCX2VIl; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=jigSVRzE; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbvCC38nKz2xtm;
 Fri,  7 May 2021 12:14:15 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id DE7BB581013;
 Thu,  6 May 2021 22:14:12 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 06 May 2021 22:14:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=8US/FJXWvzXli0qVPTXQtzYtNN8GfR+
 Rd/DBBdsQDOU=; b=ABCX2VIlaxgv6fmVYZqhYciuL0pnba2JJR4jyn9sC1tqCoY
 uY9odhr4vFeNh7apkKAZSrnvtnvwNMpP9Rh/5ILnCf6evnsWvLQtVFepEnc9MDjz
 NcrLsEgFTkIZdMFOR9qBYRIgMN4YXsSikdICedlMEpZH0i/HVgIlAMYRCq2Imlj5
 yTLaYGudFProF0KNZcDLoD2o43A0gNul9hijJyh+oPO/edY7Rs5WefNGzHRygWQc
 7FKdPUa4qXxi6QEloh9mmvwBURJy34HX7abTCJvo8vyF6Jxbx4Mz9nakdaUqSUGf
 mseNKEcXYnYDwQ7hRIHrUJvNjsyKSoF/6C6YM7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=8US/FJ
 XWvzXli0qVPTXQtzYtNN8GfR+Rd/DBBdsQDOU=; b=jigSVRzEaV+GHWRtNmkZNB
 XHgBICfB7AVc2fNowNYCMpFeeUTfJphXVku0gDJgIRFmAN0otoFekDDmGTmWfYCz
 vUjCVKT+Q6XH4r5k3kX1vPJpUb1Nl3OinfKS5twXRgczWZox70T3uQSv3WB7m+mr
 pWgCkyFXm5Y3TRdPbM3ztM5Fge/waSbM8w7ySh7P9Cji5dEIKbMtAOPmm7MeO+CV
 E2JqT49ho5pooNNthF7X96uS6NCov+QeSGRYOIWpPJKPj8trCJBN7cB/QwLsSnr/
 j8wv6VJInN4pjrwulNRSAxM7Svbioe0GRgEfr/8deWhfnRx18Hk+Zzf6qIph2riQ
 ==
X-ME-Sender: <xms:cqKUYKfwNnA-nK8XG7gvlQKJHAK_r1ZKeO8juJ3GKkK1AzUkAQxQwA>
 <xme:cqKUYEOdhBdmoc1kAfSkgVimZ0_geYg2FBzt1vn5GYc8avQqbKxYgjVA0_3ieg3OI
 gulNu7HSdwYlVnn2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeguddgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:cqKUYLh_5TPtFEMPLP2QEjFWwCNvkPn2Wxd0RENrHQ8nhejy6KDcjg>
 <xmx:cqKUYH8d-ttfrB0I4BUVFTbgA8VFjlTfUpVDSjUCPktym4bJ8h7ebA>
 <xmx:cqKUYGttVu9CDhjP0V0L_Im3zp15es4rKycxphqlcwD9CosTC_Irtg>
 <xmx:dKKUYLPPSdkMUApAbllqTyL7xZXf7HOEyPQeSKOyy9boN4VzVyTsQg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 93D0CA00079; Thu,  6 May 2021 22:14:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <fecc9021-ab4b-4047-a664-47b1bd867cb3@www.fastmail.com>
In-Reply-To: <20210506100312.1638-5-steven_lee@aspeedtech.com>
References: <20210506100312.1638-1-steven_lee@aspeedtech.com>
 <20210506100312.1638-5-steven_lee@aspeedtech.com>
Date: Fri, 07 May 2021 11:43:49 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>,
 "Ulf Hansson" <ulf.hansson@linaro.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Joel Stanley" <joel@jms.id.au>, "Adrian Hunter" <adrian.hunter@intel.com>,
 "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Ryan Chen" <ryanchen.aspeed@gmail.com>,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, 
 "open list" <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_4/5]_mmc:_sdhci-of-aspeed:_Add_a_helper_for_upda?=
 =?UTF-8?Q?ting_capability_register.?=
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

I have some minor comments. I expect you're going to do a v4 of the 
series, so if you'd like to clean them up in the process I'd appreciate 
it.

However, from a pragmatic standpoint I think the patch is in good shape.

On Thu, 6 May 2021, at 19:33, Steven Lee wrote:
> The patch add a new function aspeed_sdc_set_slot_capability() for
> updating sdhci capability register.

The commit message should explain why the patch is necessary and not 
what it does, as what it does is contained in the diff.

It's okay to explain *how* the patch acheives its goals if the 
implementation is subtle or complex.

Maybe the commit message could be something like:


```
Configure the SDHCIs as specified by the devicetree.

The hardware provides capability configuration registers for each SDHCI 
in the global configuration space for the SD controller. Writes to the 
global capability registers are mirrored to the capability registers in 
the associated SDHCI. Configuration of the capabilities must be written 
through the mirror registers prior to initialisation of the SDHCI.
```

> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 57 ++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c 
> b/drivers/mmc/host/sdhci-of-aspeed.c
> index d001c51074a0..4979f98ffb52 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -31,6 +31,11 @@
>  #define   ASPEED_SDC_S0_PHASE_OUT_EN	GENMASK(1, 0)
>  #define   ASPEED_SDC_PHASE_MAX		31
>  
> +/* SDIO{10,20} */
> +#define ASPEED_SDC_CAP1_1_8V           (0 * 32 + 26)
> +/* SDIO{14,24} */
> +#define ASPEED_SDC_CAP2_SDR104         (1 * 32 + 1)
> +
>  struct aspeed_sdc {
>  	struct clk *clk;
>  	struct resource *res;
> @@ -70,8 +75,42 @@ struct aspeed_sdhci {
>  	u32 width_mask;
>  	struct mmc_clk_phase_map phase_map;
>  	const struct aspeed_sdhci_phase_desc *phase_desc;
> +
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

It would be nice to align the columns to improve readability.

> + */
> +static void aspeed_sdc_set_slot_capability(struct sdhci_host *host,
> +					   struct aspeed_sdc *sdc,
> +					   int capability,
> +					   bool enable,
> +					   u8 slot)

I prefer we don't take up so much vertical space here. I think this 
could be just a couple of lines with multiple variables per line. We 
can go to 100 chars per line.

> +{
> +	u8 cap_reg;
> +	u32 mirror_reg_offset, cap_val;

The rest of the driver follows "reverse christmas tree" (longest to 
shortest declaration) style, so I prefer we try to maintain consistency 
where we can. Essentially, declare them in this order:

u32 mirror_reg_offset;
u32 cap_val;
u8 cap_reg;

> +
> +	if (slot > 1)
> +		return;
> +
> +	cap_reg = capability / 32;
> +	cap_val = sdhci_readl(host, 0x40 + (cap_reg * 4));
> +	if (enable)
> +		cap_val |= BIT(capability % 32);
> +	else
> +		cap_val &= ~BIT(capability % 32);
> +	mirror_reg_offset = ((slot + 1) * 0x10) + (cap_reg * 4);
> +	writel(cap_val, sdc->regs + mirror_reg_offset);
> +}
> +
>  static void aspeed_sdc_configure_8bit_mode(struct aspeed_sdc *sdc,
>  					   struct aspeed_sdhci *sdhci,
>  					   bool bus8)
> @@ -329,6 +368,7 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
>  {
>  	const struct aspeed_sdhci_pdata *aspeed_pdata;
>  	struct sdhci_pltfm_host *pltfm_host;
> +	struct device_node *np = pdev->dev.of_node;

Again here with the reverse-christmas-tree style, so:

const struct aspeed_sdhci_pdata *aspeed_pdata;
struct device_node *np = pdev->dev.of_node;
struct sdhci_pltfm_host *pltfm_host;
...

>  	struct aspeed_sdhci *dev;
>  	struct sdhci_host *host;
>  	struct resource *res;
> @@ -372,6 +412,23 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
>  
>  	sdhci_get_of_property(pdev);
>  
> +	if (of_property_read_bool(np, "mmc-hs200-1_8v") ||
> +	    of_property_read_bool(np, "sd-uhs-sdr104")) {
> +		aspeed_sdc_set_slot_capability(host,
> +					       dev->parent,
> +					       ASPEED_SDC_CAP1_1_8V,
> +					       true,
> +					       slot);

Again, this would be nicer if we compress it to as few lines as possible.

> +	}
> +
> +	if (of_property_read_bool(np, "sd-uhs-sdr104")) {
> +		aspeed_sdc_set_slot_capability(host,
> +					       dev->parent,
> +					       ASPEED_SDC_CAP2_SDR104,
> +					       true,
> +					       slot);

As above.

Cheers,

Andrew
