Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B51A25968A7
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 07:37:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6xcj4mn5z3bpW
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 15:37:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=tiTulcpq;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=v6HQ9TR+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=tiTulcpq;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=v6HQ9TR+;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6xcK2L4kz2xmk
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 15:37:37 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 4D6915C00D9;
	Wed, 17 Aug 2022 01:37:35 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Wed, 17 Aug 2022 01:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660714655; x=1660801055; bh=ZjKwN+UPCJ
	vb+MRogU5dftHZboLTs6/VZTO2GEJ+sww=; b=tiTulcpqJq3CRWPgh35Dm0pxwL
	yvIbrfxOBjsT/qE7tHJIuL14iTGaf+EIt5oRQ1vW0rbeyEYoaw7DJeLJQaNT48qZ
	irv5F0FFJyspMa3r8ESJ2RDL4+pyJbT0MVgvztugy6A80Eq/vogpObwDDKKu/wgG
	bVs+9/Y6ym888D3OWy/ktHM5CNelwAA2DeoylN0KwF8/VyOwxIpmbPFCHdxwhToP
	mMsdJOugvdd/uQy3nfLgcwsn4R2zdnCGTmeTkwTuN9+qwmPCJvMNKAhGVPi9/0ee
	RvILtkIJQ6Vimikj1Gd0lcf0fRLI+y3UrMzGawWhFecDIbiv51aK1E7QqnIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660714655; x=1660801055; bh=ZjKwN+UPCJvb+MRogU5dftHZboLT
	s6/VZTO2GEJ+sww=; b=v6HQ9TR+dU8C9XsSt4BEHNslUhWL/ExDhd3CHynGa6b+
	mgF183rZlNn7HpQ9BuBnFpw5NebGBkfdjekuRi53G/AQppBbH8wnWGxAz9/njbu2
	i1kMg+7vRBRDSNFcCaZ/PFw3wCUNn07AS94QWmN9ZdA3vHQMioidKYK8diyz1fsv
	Rrk7znFzFeWnr8VlU9sIGg8qzRJhPL0btIMecdAJjOVoHSKiX96I0ZI54MxYZWrB
	70CCTGFYpq3Pw8zEbJZnGIuLr3riHSKZoGbv0R5nd68f0AseWGEr6lVrgdiKNGvO
	eSv82GjfgMtX8eQ0y6MUUYgKbQeP1iegP8OlrQs9bA==
X-ME-Sender: <xms:n378YjQUT-6eqdY_dOTHZfI6RD7aDuHekxf0qD2XVKpb3UQKotGGzQ>
    <xme:n378YkxuuIMN8ZayThfcQM--J3emgm5h7g0h7ylywa6F92I7YDV42aMCG_YUi5EWg
    uyFpxpx93jZCgJieA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehhedgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:n378Yo2WD1aeWt10jnfvMVTp_UaCC9mreY6JOLajq1INQGXe4tcKug>
    <xmx:n378YjA0xfpHxq9FKGaoPeqEAjNFdgjKHEnuF2mzuMHjcPtAa0Ab7w>
    <xmx:n378YsgcXus89_PBGGGPSehZzq70aX43NnC2pxw8oY0e4QG0u5FXdA>
    <xmx:n378YkIYMkRtG5AlxXiwAj9bISkMYN7bzX63V4A-IEK-52aoCb5ZSw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 183741700082; Wed, 17 Aug 2022 01:37:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <6bcc0dec-aed9-4b11-81b7-cf7031bb76bf@www.fastmail.com>
In-Reply-To: <20220817015949.16946-2-joel@jms.id.au>
References: <20220817015949.16946-1-joel@jms.id.au>
 <20220817015949.16946-2-joel@jms.id.au>
Date: Wed, 17 Aug 2022 15:07:14 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Dylan Hung" <dylan_hung@aspeedtech.com>,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/2] aspeed/sdram: Use device tree
 to configure ECC
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 17 Aug 2022, at 11:29, Joel Stanley wrote:
> Instead of configuring ECC based on the build config, use a device tree
> property to selectively enable ECC at runtime.
>
> There are two properties:
>
>   aspeed,ecc-enabled;
>   aspeed,ecc-size = "512";
>
> The enabled property is a boolean that enables ECC if it is present.
>
> The size is the number of MB that should be covered by ECC. Setting it
> to zero, or omitting it, defaults the ECC size to "auto detect".
>
>   edac: sdram@1e6e0000 {
>     compatible = "aspeed,ast2600-sdram-edac";
>     reg = <0x1e6e0000 0x174>;
>     interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
>     aspeed,ecc-enabled;
>     aspeed,ecc-size = "512";
>   };
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Nice. Sure makes building generic SPL easier.

> ---
>  drivers/ram/aspeed/sdram_ast2500.c | 14 ++++++++++----
>  drivers/ram/aspeed/sdram_ast2600.c | 14 ++++++++++----
>  drivers/ram/aspeed/Kconfig         | 13 -------------
>  3 files changed, 20 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/ram/aspeed/sdram_ast2500.c 
> b/drivers/ram/aspeed/sdram_ast2500.c
> index 435e1a8cfc1d..ca3b54295bf0 100644
> --- a/drivers/ram/aspeed/sdram_ast2500.c
> +++ b/drivers/ram/aspeed/sdram_ast2500.c
> @@ -279,16 +279,16 @@ static void ast2500_sdrammc_calc_size(struct 
> dram_info *info)
>  }
> 
>  #ifdef CONFIG_ASPEED_ECC
> -static void ast2500_sdrammc_ecc_enable(struct dram_info *info)
> +static void ast2500_sdrammc_ecc_enable(struct dram_info *info, u32 
> conf_size_mb)
>  {
>  	struct ast2500_sdrammc_regs *regs = info->regs;
>  	size_t conf_size;
>  	u32 reg;
> 	
> -	conf_size = CONFIG_ASPEED_ECC_SIZE * SDRAM_SIZE_1MB;
> +	conf_size = conf_size_mb * SDRAM_SIZE_1MB;
>  	if (conf_size > info->info.size) {
>  		printf("warning: ECC configured %dMB but actual size is %dMB\n",
> -		       CONFIG_ASPEED_ECC_SIZE,
> +		       conf_size_mb,
>  		       info->info.size / SDRAM_SIZE_1MB);
>  		conf_size = info->info.size;
>  	} else if (conf_size == 0) {
> @@ -371,8 +371,14 @@ static int ast2500_sdrammc_init_ddr4(struct 
> dram_info *info)
>  	writel(SDRAM_MISC_DDR4_TREFRESH, &info->regs->misc_control);
> 
>  #ifdef CONFIG_ASPEED_ECC
> -	ast2500_sdrammc_ecc_enable(info);
> +	if (dev_read_bool(dev, "aspeed,ecc-enabled")) {
> +		u32 ecc_size;
> +
> +		ecc_size = dev_read_u32_default(dev, "aspeed,ecc-size", 0);

Bit of a nitpick, but given there's no binding documentation, can we 
encode the unit in the property name ("aspeed,ecc-size-mb"?)? Or 
perhaps switch to specifying it in bytes? Or amend the kernel binding 
documentation to add the property and get that merged (troll option)?

> +		ast2500_sdrammc_ecc_enable(priv, ecc_size);
> +	}
>  #endif
> +
>  	/* Enable all requests except video & display */
>  	writel(SDRAM_REQ_USB20_EHCI1
>  	       | SDRAM_REQ_USB20_EHCI2
> diff --git a/drivers/ram/aspeed/sdram_ast2600.c 
> b/drivers/ram/aspeed/sdram_ast2600.c
> index 5118b14f8708..6287c45365dd 100644
> --- a/drivers/ram/aspeed/sdram_ast2600.c
> +++ b/drivers/ram/aspeed/sdram_ast2600.c
> @@ -860,16 +860,16 @@ static void ast2600_sdrammc_update_size(struct 
> dram_info *info)
>  	info->info.size = hw_size;
>  }
>  #ifdef CONFIG_ASPEED_ECC
> -static void ast2600_sdrammc_ecc_enable(struct dram_info *info)
> +static void ast2600_sdrammc_ecc_enable(struct dram_info *info, u32 
> conf_size_mb)
>  {
>  	struct ast2600_sdrammc_regs *regs = info->regs;
>  	size_t conf_size;
>  	u32 reg;
> 
> -	conf_size = CONFIG_ASPEED_ECC_SIZE * SDRAM_SIZE_1MB;
> +	conf_size = conf_size_mb * SDRAM_SIZE_1MB;
>  	if (conf_size > info->info.size) {
>  		printf("warning: ECC configured %dMB but actual size is %dMB\n",
> -		       CONFIG_ASPEED_ECC_SIZE,
> +		       conf_size,
>  		       info->info.size / SDRAM_SIZE_1MB);
>  		conf_size = info->info.size;
>  	} else if (conf_size == 0) {
> @@ -989,8 +989,14 @@ L_ast2600_sdramphy_train:
>  #endif
> 
>  #ifdef CONFIG_ASPEED_ECC
> -	ast2600_sdrammc_ecc_enable(priv);
> +	if (dev_read_bool(dev, "aspeed,ecc-enabled")) {
> +		u32 ecc_size;
> +
> +		ecc_size = dev_read_u32_default(dev, "aspeed,ecc-size", 0);
> +		ast2600_sdrammc_ecc_enable(priv, ecc_size);
> +	}
>  #endif
> +
>  	setbits_le32(priv->scu + AST_SCU_HANDSHAKE, SCU_HANDSHAKE_MASK);
>  	clrbits_le32(&regs->intr_ctrl, MCR50_RESET_ALL_INTR);
>  	ast2600_sdrammc_lock(priv);
> diff --git a/drivers/ram/aspeed/Kconfig b/drivers/ram/aspeed/Kconfig
> index 924e82b19430..54c7769b5bbe 100644
> --- a/drivers/ram/aspeed/Kconfig
> +++ b/drivers/ram/aspeed/Kconfig
> @@ -51,19 +51,6 @@ config ASPEED_ECC
>  	help
>  	  enable SDRAM ECC function
> 
> -if ASPEED_ECC
> -config ASPEED_ECC_SIZE
> -	int "ECC size: 0=driver auto-caluated"
> -	depends on ASPEED_ECC
> -	default 0
> -	help
> -	  SDRAM size with the error correcting code enabled. The unit is 
> -	  in Megabytes.  Noted that only the 8/9 of the configured size 
> -	  can be used by the system.  The remaining 1/9 will be used by 
> -	  the ECC engine.  If the size is set to 0, the sdram driver will 
> -	  calculate the SDRAM size and set the whole range be ECC enabled.
> -endif
> -

Are there any defconfigs and devictrees that need updating?

Otherwise, LGTM.

Andrew
