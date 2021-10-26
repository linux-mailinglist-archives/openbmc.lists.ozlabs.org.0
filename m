Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F6E43AA9E
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 05:10:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdcKD2NLFz2yMN
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 14:10:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=j2Kv7xWR;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=eRNKixxP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=j2Kv7xWR; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=eRNKixxP; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdcJh6yqCz2xDM;
 Tue, 26 Oct 2021 14:10:28 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4270858075B;
 Mon, 25 Oct 2021 23:10:25 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Mon, 25 Oct 2021 23:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=8zoZ7PiK4dC5PQTpKqhe5iwBh4kOsIB
 /MaKEN4pRp1E=; b=j2Kv7xWRIH80egJksQIylqmLoTFnSROf09yekN7s+jwWBma
 T0cOg3r1a/kqzmLFHNiGiuKKfnvbUfsbZGnfFySQ6pby/Zp3LI5DRrC1qIhPFKMp
 47wuz2XIvxXjRDhMwtifY/sKLgrG9/lGTjZotODcI7+iCyrXJXIed/+rHPS3EQAc
 1vk7QzPsLMCsQiYbXHzsPPpu2vkSRd2GMfSsTneOJnKBbh2XWc9NxeJvTCWje3op
 grbkhJh4Gj6SIEtZtqtbtRsbR5CE5lQNFkarwdA+qj7s+EdyYuCYkz8FZ55fAc/y
 O+ZHCsRejFp9ejWczeHYkDqBmpuixiUlabD1MWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=8zoZ7P
 iK4dC5PQTpKqhe5iwBh4kOsIB/MaKEN4pRp1E=; b=eRNKixxP/orY7kkJu/V3Wc
 vVLBdjVV/qyIZKmS4Ui7ISvZjHvg8Kwv6E2+4CF9tlzcrz2a0DZ2sRlA2nASSaFj
 8di54kuMEVxYh3hX6ySZtnkt0+kDUeWBZdQnNIlq9bjlNb73J2cOCLsyYelJvUbs
 g7I6lphxoF539P5fXJb3vl01wj0zdmTUd4IEoNYllVCtE4KCmpAHkrSUCs2lYAgA
 RoCycqoPLkLNZzh1llutwhtJbDs5w7ebcA/EQUwzjqv/E7+8OqaJJRZDtdy3Ayue
 fpWOJUZAnIeok/9Agyb7vufz9mYVAfN5b4eW6yydcsZhAbkloiqAhq6DINqAuu6w
 ==
X-ME-Sender: <xms:oHF3YY09ZjDfsKoD3wt5Z-5dvDP3J1oiOGIBtLYR85qBUoFa8ct64w>
 <xme:oHF3YTH_xsIvUL2-_FyNp-oS4rO7h5EyRAnHnPESlnpn3Gdtx8IQcWJkw8pW96wXb
 Rb9cW_9pco-rV0mMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefiedgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:oHF3YQ4GjW5XsQsrFYnw2pHbnq43QjJ7GfrGpUkn8JM1-Nn6lKa1Mg>
 <xmx:oHF3YR2UR8Ng24x5sEgMBnAkqODiXxzhhWcKaeSVzX5R9Ohmo2SzwQ>
 <xmx:oHF3YbHii2GQRdDpA7wmwFB2KxkPuKAjz7tBrC142I8W-BIJwuP-Tw>
 <xmx:oXF3YacFQe3ACCNt5ZKpLoR01YR8ctFFE7ZmUiQebEhqCqtxHem4WQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E6257AC03DB; Mon, 25 Oct 2021 23:10:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <95669b37-d512-4439-86cb-418ab085118f@www.fastmail.com>
In-Reply-To: <20210922103116.30652-6-chin-ting_kuo@aspeedtech.com>
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
 <20210922103116.30652-6-chin-ting_kuo@aspeedtech.com>
Date: Tue, 26 Oct 2021 13:40:03 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Chin-Ting Kuo" <chin-ting_kuo@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Adrian Hunter" <adrian.hunter@intel.com>, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-mmc <linux-mmc@vger.kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 05/10] mmc: aspeed: Adjust delay taps calculation method
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
Cc: BMC-SW@aspeedtech.com, Steven Lee <steven_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Chin-Ting,

I think we can split this up a bit:

On Wed, 22 Sep 2021, at 20:01, Chin-Ting Kuo wrote:
> - The maximum tap delay may be slightly different on
>   different platforms. It may also be different due to
>   different SoC processes or different manufacturers.
>   Thus, the maximum tap delay should be gotten from the
>   device tree through max-tap-delay property.

I think this could be a patch on its own

> - The delay time for each tap is an absolute value which
>   is independent of clock frequency. But, in order to combine
>   this principle with "phase" concept, clock frequency is took
>   into consideration during calculating delay taps.
> - The delay cell of eMMC device is non-uniform.
>   The time period of the first tap is two times of others.

Again, this could be a patch of its own

> - The clock phase degree range is from -360 to 360.
>   But, if the clock phase signedness is negative, clock signal
>   is output from the falling edge first by default and thus, clock
>   signal is leading to data signal by 90 degrees at least.

This line of development is impacted by my comment on an earlier patch 
in the series, so should be its own patch.

>
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 115 ++++++++++++++++++++++-------
>  1 file changed, 89 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c 
> b/drivers/mmc/host/sdhci-of-aspeed.c
> index c6eaeb02e3f9..739c9503a5ed 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -44,6 +44,7 @@ struct aspeed_sdc {
> 
>  	spinlock_t lock;
>  	void __iomem *regs;
> +	u32 max_tap_delay_ps;
>  };
> 
>  struct aspeed_sdhci_tap_param {
> @@ -63,6 +64,7 @@ struct aspeed_sdhci_tap_desc {
>  struct aspeed_sdhci_phase_desc {
>  	struct aspeed_sdhci_tap_desc in;
>  	struct aspeed_sdhci_tap_desc out;
> +	u32 nr_taps;
>  };
> 
>  struct aspeed_sdhci_pdata {
> @@ -158,43 +160,60 @@ aspeed_sdc_set_phase_taps(struct aspeed_sdc *sdc,
>  }
> 
>  #define PICOSECONDS_PER_SECOND		1000000000000ULL
> -#define ASPEED_SDHCI_NR_TAPS		15
> -/* Measured value with *handwave* environmentals and static loading */
> -#define ASPEED_SDHCI_MAX_TAP_DELAY_PS	1253
> +#define ASPEED_SDHCI_MAX_TAPS		15

Why are we renaming this? It looks to cause a bit of noise in the diff.

> +
>  static int aspeed_sdhci_phase_to_tap(struct device *dev, unsigned long rate_hz,
> -				     int phase_deg)
> +				     bool invert, int phase_deg, u32 nr_taps)

Hmm.

>  {
>  	u64 phase_period_ps;
>  	u64 prop_delay_ps;
>  	u64 clk_period_ps;
> -	unsigned int tap;
> -	u8 inverted;
> +	u32 tap = 0;
> +	struct aspeed_sdc *sdc = dev_get_drvdata(dev->parent);
> 
> -	phase_deg %= 360;
> +	if (sdc->max_tap_delay_ps == 0)
> +		return 0;

I don't think just silently returning 0 here is the right thing to do.

What about -EINVAL, or printing a warning and using the old hard-coded 
value?

> 
> -	if (phase_deg >= 180) {
> -		inverted = ASPEED_SDHCI_TAP_PARAM_INVERT_CLK;
> -		phase_deg -= 180;
> -		dev_dbg(dev,
> -			"Inverting clock to reduce phase correction from %d to %d degrees\n",
> -			phase_deg + 180, phase_deg);
> -	} else {
> -		inverted = 0;
> +	prop_delay_ps = sdc->max_tap_delay_ps / nr_taps;
> +	clk_period_ps = div_u64(PICOSECONDS_PER_SECOND, (u64)rate_hz);
> +
> +	/*
> +	 * For ast2600, if clock phase degree is negative, clock signal is
> +	 * output from falling edge first by default. Namely, clock signal
> +	 * is leading to data signal by 90 degrees at least.
> +	 */

Have I missed something about a asymmetric clock timings? Otherwise the 
falling edge is 180 degrees away from the rising edge? I'm still not 
clear on why 90 degrees is used here.

> +	if (invert) {
> +		if (phase_deg >= 90)
> +			phase_deg -= 90;
> +		else
> +			phase_deg = 0;

Why are we throwing away information?

>  	}
> 
> -	prop_delay_ps = ASPEED_SDHCI_MAX_TAP_DELAY_PS / ASPEED_SDHCI_NR_TAPS;
> -	clk_period_ps = div_u64(PICOSECONDS_PER_SECOND, (u64)rate_hz);
>  	phase_period_ps = div_u64((u64)phase_deg * clk_period_ps, 360ULL);
> 
> -	tap = div_u64(phase_period_ps, prop_delay_ps);
> -	if (tap > ASPEED_SDHCI_NR_TAPS) {
> +	/*
> +	 * The delay cell is non-uniform for eMMC controller.
> +	 * The time period of the first tap is two times of others.
> +	 */
> +	if (nr_taps == 16 && phase_period_ps > prop_delay_ps * 2) {
> +		phase_period_ps -= prop_delay_ps * 2;
> +		tap++;
> +	}
> +
> +	tap += div_u64(phase_period_ps, prop_delay_ps);
> +	if (tap > ASPEED_SDHCI_MAX_TAPS) {
>  		dev_dbg(dev,
>  			 "Requested out of range phase tap %d for %d degrees of phase 
> compensation at %luHz, clamping to tap %d\n",
> -			 tap, phase_deg, rate_hz, ASPEED_SDHCI_NR_TAPS);
> -		tap = ASPEED_SDHCI_NR_TAPS;
> +			 tap, phase_deg, rate_hz, ASPEED_SDHCI_MAX_TAPS);
> +		tap = ASPEED_SDHCI_MAX_TAPS;
>  	}
> 
> -	return inverted | tap;
> +	if (invert) {
> +		dev_info(dev, "invert the clock\n");

I prefer we drop this message

> +		tap |= ASPEED_SDHCI_TAP_PARAM_INVERT_CLK;
> +	}
> +
> +	return tap;
>  }
> 
>  static void
> @@ -202,13 +221,19 @@ aspeed_sdhci_phases_to_taps(struct device *dev, 
> unsigned long rate,
>  			    const struct mmc_clk_phase *phases,
>  			    struct aspeed_sdhci_tap_param *taps)
>  {
> +	struct sdhci_host *host = dev->driver_data;
> +	struct aspeed_sdhci *sdhci;
> +
> +	sdhci = sdhci_pltfm_priv(sdhci_priv(host));
>  	taps->valid = phases->valid;
> 
>  	if (!phases->valid)
>  		return;
> 
> -	taps->in = aspeed_sdhci_phase_to_tap(dev, rate, phases->in_deg);
> -	taps->out = aspeed_sdhci_phase_to_tap(dev, rate, phases->out_deg);
> +	taps->in = aspeed_sdhci_phase_to_tap(dev, rate, phases->inv_in_deg,
> +				phases->in_deg, sdhci->phase_desc->nr_taps);
> +	taps->out = aspeed_sdhci_phase_to_tap(dev, rate, phases->inv_out_deg,
> +				phases->out_deg, sdhci->phase_desc->nr_taps);
>  }
> 
>  static void
> @@ -230,8 +255,8 @@ aspeed_sdhci_configure_phase(struct sdhci_host 
> *host, unsigned long rate)
>  	aspeed_sdc_set_phase_taps(sdhci->parent, sdhci->phase_desc, taps);
>  	dev_dbg(dev,
>  		"Using taps [%d, %d] for [%d, %d] degrees of phase correction at 
> %luHz (%d)\n",
> -		taps->in & ASPEED_SDHCI_NR_TAPS,
> -		taps->out & ASPEED_SDHCI_NR_TAPS,
> +		taps->in & ASPEED_SDHCI_MAX_TAPS,
> +		taps->out & ASPEED_SDHCI_MAX_TAPS,
>  		params->in_deg, params->out_deg, rate, host->timing);
>  }
> 
> @@ -493,6 +518,7 @@ static const struct aspeed_sdhci_phase_desc 
> ast2600_sdhci_phase[] = {
>  			.enable_mask = ASPEED_SDC_S0_PHASE_OUT_EN,
>  			.enable_value = 3,
>  		},
> +		.nr_taps = 15,
>  	},
>  	/* SDHCI/Slot 1 */
>  	[1] = {
> @@ -506,6 +532,31 @@ static const struct aspeed_sdhci_phase_desc 
> ast2600_sdhci_phase[] = {
>  			.enable_mask = ASPEED_SDC_S1_PHASE_OUT_EN,
>  			.enable_value = 3,
>  		},
> +		.nr_taps = 15,
> +	},
> +};
> +
> +static const struct aspeed_sdhci_phase_desc ast2600_emmc_phase[] = {
> +	/* eMMC slot 0 */
> +	[0] = {
> +		.in = {
> +			.tap_mask = ASPEED_SDC_S0_PHASE_IN,
> +			.enable_mask = ASPEED_SDC_S0_PHASE_IN_EN,
> +			.enable_value = 1,
> +		},
> +		.out = {
> +			.tap_mask = ASPEED_SDC_S0_PHASE_OUT,
> +			.enable_mask = ASPEED_SDC_S0_PHASE_OUT_EN,
> +			.enable_value = 3,
> +		},
> +
> +		/*
> +		 * There are 15 taps recorded in AST2600 datasheet.
> +		 * But, actually, the time period of the first tap
> +		 * is two times of others. Thus, 16 tap is used to
> +		 * emulate this situation.
> +		 */
> +		.nr_taps = 16,

I think this is a very indirect way to communicate the problem. The 
only time we look at nr_taps is in a test that explicitly compensates 
for the non-uniform delay. I think we should just have a boolean struct 
member called 'non_uniform_delay' rather than 'nr_taps', as the number 
of taps isn't what's changing. But also see the discussion below about 
a potential aspeed,tap-delays property.

>  	},
>  };
> 
> @@ -515,10 +566,17 @@ static const struct aspeed_sdhci_pdata 
> ast2600_sdhci_pdata = {
>  	.nr_phase_descs = ARRAY_SIZE(ast2600_sdhci_phase),
>  };
> 
> +static const struct aspeed_sdhci_pdata ast2600_emmc_pdata = {
> +	.clk_div_start = 1,
> +	.phase_desc = ast2600_emmc_phase,
> +	.nr_phase_descs = ARRAY_SIZE(ast2600_emmc_phase),
> +};
> +
>  static const struct of_device_id aspeed_sdhci_of_match[] = {
>  	{ .compatible = "aspeed,ast2400-sdhci", .data = &ast2400_sdhci_pdata, },
>  	{ .compatible = "aspeed,ast2500-sdhci", .data = &ast2400_sdhci_pdata, },
>  	{ .compatible = "aspeed,ast2600-sdhci", .data = &ast2600_sdhci_pdata, },
> +	{ .compatible = "aspeed,ast2600-emmc", .data = &ast2600_emmc_pdata, },

This needs to be documented (and binding documentation patches need to 
be the first patches in the series). Something further to consider is 
whether we separate the compatibles or add e.g. an aspeed,tap-delays 
property that specifies the specific delay of each logic element. This 
might take the place of e.g. the max-tap-delay property?

Andrew

>  	{ }
>  };
> 
> @@ -562,6 +620,11 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
>  		goto err_clk;
>  	}
> 
> +	ret = of_property_read_u32(pdev->dev.of_node, "max-tap-delay",
> +			&sdc->max_tap_delay_ps);
> +	if (ret)
> +		sdc->max_tap_delay_ps = 0;
> +
>  	dev_set_drvdata(&pdev->dev, sdc);
> 
>  	parent = pdev->dev.of_node;
> -- 
> 2.17.1
