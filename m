Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9035968A9
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 07:39:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6xfC0kvXz3bl6
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 15:39:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=gwfzKU/x;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=5X+qvcLk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=gwfzKU/x;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=5X+qvcLk;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6xdn5jM2z2xmk
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 15:38:53 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id E12535C0154;
	Wed, 17 Aug 2022 01:38:51 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Wed, 17 Aug 2022 01:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660714731; x=1660801131; bh=AvGJLUhzvB
	WmGKSwP7aj8cvaaZYZfmCJhOaWFHFzLhY=; b=gwfzKU/xBIO9vO2CCZGRH2ce4Q
	+y3f0E/0dti7tkU/75QpQA6Pehe5SmDXkfPuqp2DneZxo+NyyvH7O3pjVMQafe8c
	M1jg4zKszS68TPFQigit2lALQTs0TXO+22HdXp2mtVUtOE2xUCsipu3R3NOQ9+2w
	yAA+cbCAWGhUYo5Gma9nSjHxXx5/6kt2zV78Jbzq2HIl+671un5k1v3oxpJWsMhF
	g5WhOM2kXZoS99DsjxAUC2PIeSBGy6d0rCuPgfwza+KYdD6PvFdMRjhSW7L/Vqrr
	71JJ/GpT9+QOle0LpkuDnS1ZOdqkZq8X8gaD9K80etrlhY1pYUbMX0ULOqLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660714731; x=1660801131; bh=AvGJLUhzvBWmGKSwP7aj8cvaaZYZ
	fmCJhOaWFHFzLhY=; b=5X+qvcLkd/MBvEpdCcDC6a74P8ho7UzcvIW6pZSU9RBG
	ZBGltc6PPj+tGEgUpjgSfx4VBSThzoCBW0ULBGLimvtRASuCLhz6fGLLvJDOAHM1
	qskiGNCU6DifHaCJY/zsJZWjFtxJw6LQzDtEe+Mss/ZiNX01yC2NQf+fTG9HBzlr
	TEM2mYe8o64nKx91FKHjOrI56Jiue792umRH1Y+H6wdkWv/e8miCMX/ni6BF2hpP
	/fMWLQzw9Y8FF9NcCzpOxuOo6sad3SyA358K1/pQQTitNwwtkBqP0dcmDLn5dTO0
	l3mi8Lj9nMhWb8eJMT1Rmmt6geqCxK8rC8ux2A6CrA==
X-ME-Sender: <xms:6378Yn07ysaYQ7OTIMKnNijz5sdkKxV6ptCbtuffsy7LIIAEEUsAng>
    <xme:6378YmG-v9pU229FcdqR5NsXmxj5WLqWDPsG8uzVzBhxM_BFqUPLDzHRUHogCaAZ9
    nA0ItItdQwyfAuitw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehhedgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:6378Yn6Ne_-Yb53hpkInGnTKhe0y_T3lIp7RRQLmTrFblwBsq5gDoQ>
    <xmx:6378Ys3excEZN9xl8kxJz7vtClUJaivncXA8ZZ3fqQPfv6DeX_wwzQ>
    <xmx:6378YqHPq67mvEG_Q5zqsDRnbi2hBUqFtE8_Asczma-sk08EJGj4LA>
    <xmx:6378YlOcUYlTJVt1reAeSK3pOkkXx1LErvYHRbYAVcYrAO-8V13gAw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B50631700082; Wed, 17 Aug 2022 01:38:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <b92f8f95-0adb-4c30-92f5-4d39009fbd96@www.fastmail.com>
In-Reply-To: <20220817015949.16946-3-joel@jms.id.au>
References: <20220817015949.16946-1-joel@jms.id.au>
 <20220817015949.16946-3-joel@jms.id.au>
Date: Wed, 17 Aug 2022 15:08:30 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Dylan Hung" <dylan_hung@aspeedtech.com>,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 2/2] ram/aspeed: Remove ECC config
 option
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
> Always build the code now that it is enabled by device tree.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/ram/aspeed/sdram_ast2500.c | 4 ----
>  drivers/ram/aspeed/sdram_ast2600.c | 5 +----
>  drivers/ram/aspeed/Kconfig         | 7 -------
>  3 files changed, 1 insertion(+), 15 deletions(-)
>
> diff --git a/drivers/ram/aspeed/sdram_ast2500.c 
> b/drivers/ram/aspeed/sdram_ast2500.c
> index ca3b54295bf0..f76054d80b68 100644
> --- a/drivers/ram/aspeed/sdram_ast2500.c
> +++ b/drivers/ram/aspeed/sdram_ast2500.c
> @@ -278,7 +278,6 @@ static void ast2500_sdrammc_calc_size(struct 
> dram_info *info)
>  			 << SDRAM_CONF_CAP_SHIFT));
>  }
> 
> -#ifdef CONFIG_ASPEED_ECC
>  static void ast2500_sdrammc_ecc_enable(struct dram_info *info, u32 
> conf_size_mb)
>  {
>  	struct ast2500_sdrammc_regs *regs = info->regs;
> @@ -313,7 +312,6 @@ static void ast2500_sdrammc_ecc_enable(struct 
> dram_info *info, u32 conf_size_mb)
>  	writel(0x400, &regs->ecc_test_ctrl);
>  	printf("ECC enable, ");
>  }
> -#endif
> 
>  static int ast2500_sdrammc_init_ddr4(struct dram_info *info)
>  {
> @@ -370,14 +368,12 @@ static int ast2500_sdrammc_init_ddr4(struct 
> dram_info *info)
> 
>  	writel(SDRAM_MISC_DDR4_TREFRESH, &info->regs->misc_control);
> 
> -#ifdef CONFIG_ASPEED_ECC
>  	if (dev_read_bool(dev, "aspeed,ecc-enabled")) {
>  		u32 ecc_size;
> 
>  		ecc_size = dev_read_u32_default(dev, "aspeed,ecc-size", 0);
>  		ast2500_sdrammc_ecc_enable(priv, ecc_size);
>  	}
> -#endif
> 
>  	/* Enable all requests except video & display */
>  	writel(SDRAM_REQ_USB20_EHCI1
> diff --git a/drivers/ram/aspeed/sdram_ast2600.c 
> b/drivers/ram/aspeed/sdram_ast2600.c
> index 6287c45365dd..7f599ff24d69 100644
> --- a/drivers/ram/aspeed/sdram_ast2600.c
> +++ b/drivers/ram/aspeed/sdram_ast2600.c
> @@ -859,7 +859,7 @@ static void ast2600_sdrammc_update_size(struct 
> dram_info *info)
> 
>  	info->info.size = hw_size;
>  }
> -#ifdef CONFIG_ASPEED_ECC
> +
>  static void ast2600_sdrammc_ecc_enable(struct dram_info *info, u32 
> conf_size_mb)
>  {
>  	struct ast2600_sdrammc_regs *regs = info->regs;
> @@ -890,7 +890,6 @@ static void ast2600_sdrammc_ecc_enable(struct 
> dram_info *info, u32 conf_size_mb)
>  	writel(BIT(31), &regs->intr_ctrl);
>  	writel(0, &regs->intr_ctrl);
>  }
> -#endif
> 
>  static int ast2600_sdrammc_probe(struct udevice *dev)
>  {
> @@ -988,14 +987,12 @@ L_ast2600_sdramphy_train:
>  	}
>  #endif
> 
> -#ifdef CONFIG_ASPEED_ECC
>  	if (dev_read_bool(dev, "aspeed,ecc-enabled")) {
>  		u32 ecc_size;
> 
>  		ecc_size = dev_read_u32_default(dev, "aspeed,ecc-size", 0);
>  		ast2600_sdrammc_ecc_enable(priv, ecc_size);
>  	}
> -#endif
> 
>  	setbits_le32(priv->scu + AST_SCU_HANDSHAKE, SCU_HANDSHAKE_MASK);
>  	clrbits_le32(&regs->intr_ctrl, MCR50_RESET_ALL_INTR);
> diff --git a/drivers/ram/aspeed/Kconfig b/drivers/ram/aspeed/Kconfig
> index 54c7769b5bbe..25238bf28d32 100644
> --- a/drivers/ram/aspeed/Kconfig
> +++ b/drivers/ram/aspeed/Kconfig
> @@ -44,13 +44,6 @@ config ASPEED_BYPASS_SELFTEST
>  	  Say Y here to bypass DRAM self test to speed up the boot time
>  endif
> 
> -config ASPEED_ECC
> -	bool "aspeed SDRAM error correcting code"
> -	depends on DM && OF_CONTROL && ARCH_ASPEED
> -	default n
> -	help
> -	  enable SDRAM ECC function
> -

Do we need any config refreshes?

Andrew
