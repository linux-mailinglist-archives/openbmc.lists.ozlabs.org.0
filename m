Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D5635D3D0
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 01:19:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FK4Sh047hz3bVJ
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 09:19:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=OckiTd8l;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=nO/2wlY1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=OckiTd8l; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=nO/2wlY1; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FK4SL4R2xz30D9;
 Tue, 13 Apr 2021 09:19:13 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8CA7858048D;
 Mon, 12 Apr 2021 19:19:07 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 12 Apr 2021 19:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=qQBlqSHrbP74nwK5ZoPyDEpe8rdqcKv
 hgstn0BCo0rU=; b=OckiTd8llIgbnwXD17TPAC++YyuUKw+uHMRMGnbFEpgOlDP
 d/MOtZ1gmKronwW1OyK6jubD2kb0eet6zk9H7St+rUkMJtuRdB4EZsyr/5Q4DPXj
 F8F4oyPcx1UOyXGLKN09keDgfeIw7c7GsjdlS9x4IVbWv0WLbEM4+p9k7ZB4dmJ7
 MYmHFy4JAyuuUNH0HSwD/EbFplNtdtvWg2ynoxqHaRvPUGc75Gxfqb+mpzqCifW3
 USB6kLr21FdDTYd8EnxLjjbxxEbIhBQaSXJDxY65NYSFUwvh1fev84+OX6kIiH8E
 nr+lN4I8y/9O1vs3zwMZEN012al+cVrhYr3WGbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qQBlqS
 HrbP74nwK5ZoPyDEpe8rdqcKvhgstn0BCo0rU=; b=nO/2wlY1YfeoZS5M3XfSJi
 Nhq/DRejLxzD9DJA5v4bbuMwII2/AjKL/r0/BX26MsrmTsJtofo425iMA/V3paR8
 qDEJP7uxXVIzAzpwO0nbgyy399XrNnHoKlv0PZP4FyCsSl+hYQKMdcpUdAUDK+Ou
 TtEQZqVN7rXp6/hCLi8CSXrg6ggM0YrEvxTCBf9CHYqM/Kds83gL+mw/Yd0mD6uy
 b/uRsSfDHjtRVhZsadD0ZcIWzs8O9nb4h0gE3gTNomDtgQaS4BhWlnfkrwUknWil
 WVgga0aTHxC+2aUgz2O8QSga+Zx/xgVjCD3H8eM8B4nw2FV2SJRkO0BbXh510xzA
 ==
X-ME-Sender: <xms:adV0YJ0UVhU33ApUjSU8s4kkD4HJw9AAcKa1e1V0yENH02EqIxp2zA>
 <xme:adV0YAHx3dqRcaem2tCaTaE_I1Sz6jVLQkf21w_0dPMKy-z1OdQHFnEj_yNxUVxEH
 9y4xGiuEM8-7WcHNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekkedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:adV0YJ7bUpmzu-c5IosFt0K3bSzYXXTmaUyn7v4crW9c1mNmmp_Igg>
 <xmx:adV0YG3iInhNQZwO4WnU_7vHCGegJ32zwffX7wTXMsqRvdIplDasrQ>
 <xmx:adV0YMEaCP2CeEPx_AqoxI3gmeEJBCCzfRO6ZPna-dp5o0RomnT88Q>
 <xmx:a9V0YP8WGNBrxYW9yMbm5lOC_pLK9wdS0GWGlVSxu6xwvpNQrd6U5w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F38CDA00492; Mon, 12 Apr 2021 19:19:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <11b63819-d37c-406d-9ebf-424d226a6839@www.fastmail.com>
In-Reply-To: <20210412065032.GC23408@aspeedtech.com>
References: <20210408015218.20560-1-steven_lee@aspeedtech.com>
 <20210408015218.20560-3-steven_lee@aspeedtech.com>
 <acaa2cc2-9b12-442e-a767-3c4b41affa21@www.fastmail.com>
 <20210412065032.GC23408@aspeedtech.com>
Date: Tue, 13 Apr 2021 08:48:16 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v1_2/2]_mmc:_sdhci-of-aspeed:_Support_toggling_SD_b?=
 =?UTF-8?Q?us_signal_voltage_by_GPIO?=
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryanchen.aspeed@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 12 Apr 2021, at 16:20, Steven Lee wrote:
> The 04/09/2021 12:14, Andrew Jeffery wrote:
> > Hi Steven,
> > 
> > On Thu, 8 Apr 2021, at 11:22, Steven Lee wrote:
> > > AST2600-A2 EVB provides reference design to support toggling signal
> > > voltage between 3.3v and 1.8v by power-switch-gpio pin that defined in
> > > the device tree.
> > 
> > Is this something you think we need support for beyond the EVB? It 
> > sounds a lot like a knob to enable testing of different SD/MMC power 
> > configurations and not something that you'd otherwise see in a system 
> > design.
> >
> 
> It can be used for testing different SD power configuration.
> The main purpose of the patch is letting the driver has the ability to 
> change the bus voltage for switching SD bus speed between UHS-I mode and
> normal/high speed mode in AST2600-A2 EVB according to the value of
> power-switch-gpio that defined in the device tree. 

Ah okay. I'm not strong on all the power requirements for each of the 
bus modes :)

> But I am not sure whether it needs to be support in mainline kernel.
> Since it requires a particular hardware circuit design outside of ASPEED
> AST2600 SoC, and AST2600-A2 EVB does have that design.

This shouldn't be a problem with Uffe's suggestion on the binding patch.

Better to have support in mainline than maintain out-of-tree patches!

> 
> > > It also supporting enabling/disabling SD bus power by
> > > power-gpio.
> > 
> > This sounds like it could be useful but I'll defer to Ulf with regards 
> > to the binding.
> > 
> > > 
> > > In the reference design, GPIOV0 of AST2600-A2 EVB is connected to power
> > > load switch that providing 3.3v to SD1 bus vdd. GPIOV1 is connected to
> > > a 1.8v and a 3.3v power load switch that providing signal voltage to
> > > SD1 bus.
> > > If GPIOV0 is active high, SD1 bus is enabled. Otherwise, SD1 bus is
> > > disabled.
> > > If GPIOV1 is active high, 3.3v power load switch is enabled, SD1 signal
> > > voltage is 3.3v, otherwise, 1.8v power load switch will be enabled, SD1
> > > signal voltage becomes 1.8v.
> > > 
> > > AST2600-A2 EVB also support toggling signal voltage for SD2 bus.
> > > The design is the same as SD1 bus. It uses GPIOV2 as power-gpio and
> > > GPIOV3 as power-switch-gpio.
> > > 
> > > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > > ---
> > >  drivers/mmc/host/sdhci-of-aspeed.c | 155 +++++++++++++++++++++++++----
> > >  1 file changed, 137 insertions(+), 18 deletions(-)
> > > 
> > > diff --git a/drivers/mmc/host/sdhci-of-aspeed.c 
> > > b/drivers/mmc/host/sdhci-of-aspeed.c
> > > index 7d8692e90996..a74a03d37915 100644
> > > --- a/drivers/mmc/host/sdhci-of-aspeed.c
> > > +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> > > @@ -5,6 +5,7 @@
> > >  #include <linux/clk.h>
> > >  #include <linux/delay.h>
> > >  #include <linux/device.h>
> > > +#include <linux/gpio/consumer.h>
> > >  #include <linux/io.h>
> > >  #include <linux/math64.h>
> > >  #include <linux/mmc/host.h>
> > > @@ -30,6 +31,7 @@
> > >  #define   ASPEED_SDC_S0_PHASE_IN_EN	BIT(2)
> > >  #define   ASPEED_SDC_S0_PHASE_OUT_EN	GENMASK(1, 0)
> > >  #define   ASPEED_SDC_PHASE_MAX		31
> > > +#define ASPEED_CLOCK_PHASE 0xf4
> > 
> > This isn't related to the power GPIOs, and we already have phase 
> > support as suggested by the macros immediately above the one you've 
> > added here.
> > 
> > Please remove it and make use of the existing mmc phase devicetree 
> > binding and driver support.
> > 
> 
> Will remove it.
> 
> > >  
> > >  struct aspeed_sdc {
> > >  	struct clk *clk;
> > > @@ -58,18 +60,21 @@ struct aspeed_sdhci_phase_desc {
> > >  	struct aspeed_sdhci_tap_desc out;
> > >  };
> > >  
> > > -struct aspeed_sdhci_pdata {
> > > +struct aspeed_sdhci_data {
> > 
> > Why are we renaming this? It looks like it creates a lot of noise in 
> > the patch. The data it captured was platform data, hence 'pdata' in the 
> > name. In my opinon it's fine if we also have a member called pdata.
> > 
> 
> Since I add a new member in aspeed_sdhci_pdata(In the patch, it is named
> aspeed_sdhci_data) for separating the platform data of aspeed-g5 and
> aspped-g6, the type of the member is sdhci_pltfm_data.
> Therefore, I use the pdata for my new created member and renamed the
> original pdata as data as follows.
> 
> static const struct of_device_id aspeed_sdhci_of_match[] = {
>   { .compatible = "aspeed,ast2400-sdhci", .data = &ast2400_sdhci_data, },
> };
> 
> static const struct aspeed_sdhci_data ast2400_sdhci_data = {
>   .clk_div_start = 2,
>   .pdata = &ast2400_sdhci_pdata,
> };
> 
> 
> Regardless, I will revert it to the original name and rename
> my new created variable.
> 
> > >  	unsigned int clk_div_start;
> > >  	const struct aspeed_sdhci_phase_desc *phase_desc;
> > >  	size_t nr_phase_descs;
> > > +	const struct sdhci_pltfm_data *pdata;
> > >  };
> > >  
> > >  struct aspeed_sdhci {
> > > -	const struct aspeed_sdhci_pdata *pdata;
> > > +	const struct aspeed_sdhci_data *data;
> > >  	struct aspeed_sdc *parent;
> > >  	u32 width_mask;
> > >  	struct mmc_clk_phase_map phase_map;
> > >  	const struct aspeed_sdhci_phase_desc *phase_desc;
> > > +	struct gpio_desc *pwr_pin;
> > > +	struct gpio_desc *pwr_sw_pin;
> > >  };
> > >  
> > >  static void aspeed_sdc_configure_8bit_mode(struct aspeed_sdc *sdc,
> > > @@ -209,7 +214,6 @@ static void aspeed_sdhci_set_clock(struct 
> > > sdhci_host *host, unsigned int clock)
> > >  	sdhci = sdhci_pltfm_priv(pltfm_host);
> > >  
> > >  	parent = clk_get_rate(pltfm_host->clk);
> > > -
> > 
> > Unrelated whitespace cleanup.
> > 
> > >  	sdhci_writew(host, 0, SDHCI_CLOCK_CONTROL);
> > >  
> > >  	if (clock == 0)
> > > @@ -234,14 +238,13 @@ static void aspeed_sdhci_set_clock(struct 
> > > sdhci_host *host, unsigned int clock)
> > >  	 * supporting the value 0 in (EMMC12C[7:6], EMMC12C[15:8]), and 
> > > capture
> > >  	 * the 0-value capability in clk_div_start.
> > >  	 */
> > > -	for (div = sdhci->pdata->clk_div_start; div < 256; div *= 2) {
> > > +	for (div = sdhci->data->clk_div_start; div < 256; div *= 2) {
> > >  		bus = parent / div;
> > >  		if (bus <= clock)
> > >  			break;
> > >  	}
> > >  
> > >  	div >>= 1;
> > > -
> > 
> > Unrelated whitespace cleanup.
> > 
> > >  	clk = div << SDHCI_DIVIDER_SHIFT;
> > >  
> > >  	aspeed_sdhci_configure_phase(host, bus);
> > > @@ -292,8 +295,78 @@ static u32 aspeed_sdhci_readl(struct sdhci_host 
> > > *host, int reg)
> > >  	return val;
> > >  }
> > >  
> > > +static void sdhci_aspeed_set_power(struct sdhci_host *host, unsigned char mode,
> > > +				   unsigned short vdd)
> > > +{
> > > +	struct sdhci_pltfm_host *pltfm_priv = sdhci_priv(host);
> > > +	struct aspeed_sdhci *dev = sdhci_pltfm_priv(pltfm_priv);
> > > +	u8 pwr = 0;
> > > +
> > > +	if (!dev->pwr_pin)
> > > +		return sdhci_set_power(host, mode, vdd);
> > > +
> > > +	if (mode != MMC_POWER_OFF) {
> > > +		switch (1 << vdd) {
> > > +		case MMC_VDD_165_195:
> > > +		/*
> > > +		 * Without a regulator, SDHCI does not support 2.0v
> > > +		 * so we only get here if the driver deliberately
> > > +		 * added the 2.0v range to ocr_avail. Map it to 1.8v
> > > +		 * for the purpose of turning on the power.
> > > +		 */
> > > +		case MMC_VDD_20_21:
> > > +				pwr = SDHCI_POWER_180;
> > > +				break;
> > > +		case MMC_VDD_29_30:
> > > +		case MMC_VDD_30_31:
> > > +				pwr = SDHCI_POWER_300;
> > > +				break;
> > > +		case MMC_VDD_32_33:
> > > +		case MMC_VDD_33_34:
> > > +				pwr = SDHCI_POWER_330;
> > > +				break;
> > > +		default:
> > > +				WARN(1, "%s: Invalid vdd %#x\n",
> > > +				     mmc_hostname(host->mmc), vdd);
> > > +				break;
> > > +		}
> > > +	}
> > > +
> > > +	if (host->pwr == pwr)
> > > +		return;
> > > +
> > > +	host->pwr = pwr;
> > > +
> > > +	if (pwr == 0) {
> > 
> > Shouldn't we be testing against an SDHCI_POWER_* macro?
> > 
> 
> It is copied from sdhci_set_power_noreg() of sdhci.c
> The difference is we need to change the bus voltage before writing
> SDHCI_POWER_CONTROL.
> Since There are only SDHCI_POWER_ON, SDHCI_POWER_180, SDHCI_POWER_300,
> and SDHCI_POWER_330 defined in sdhci.h.
> Do you mean pwr should be checked with SDHCI_POWER_ON, SDHCI_POWER_180,
> SDHCI_POWER_300, and SDHCI_POWER_330?

No, I was a bit lazy and didn't look at what macros were defined.

Cheers,

Andrew
