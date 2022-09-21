Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A165BF612
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 08:11:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXShz4nf5z3blT
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 16:11:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=YbQOjonP;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=pJ3oTMMW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=YbQOjonP;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=pJ3oTMMW;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXShT65Lzz2xgb
	for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 16:10:49 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id B6B2B5C0048;
	Wed, 21 Sep 2022 02:10:45 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Wed, 21 Sep 2022 02:10:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663740645; x=1663827045; bh=NnHo3CsNrm
	vFtcmnP4dzKvVBg/uJ8Py/3gZ1t10cb3I=; b=YbQOjonPCXu/rvI1QVhNgAr9RR
	ebmNkbM0U98RGawKFW4JAGnATD+SND8RcqhF2bHrKwYsCfyl2DEobjSZt/rtuClF
	PhkyTK3WF5gHp6Q0jg9hzsOQ9MNcIF+0qtTy1V8IIIscvs/xWY97T3IwzgtspZiY
	uvypvkzeLRlbMaYXncEtXiQvjeX5VSFEgWpLxo8OdkwYwDRlwmU+LEftrSnmPbf4
	m5YQlGMvgEV5vjNhZrwAoA3T+3zXRSdxs+AVhosHEJWYeFqzrlafV1PhUxG8qrHW
	T/tG8D6VPX183mE/lr1m7pJzjBr2hj+4mlUz3gcHaCRCcyXNLFY1ycV+R3Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663740645; x=1663827045; bh=NnHo3CsNrmvFtcmnP4dzKvVBg/uJ
	8Py/3gZ1t10cb3I=; b=pJ3oTMMW8v761Ub70NbKGKmkzULhypRd5TKU7zIS9DiM
	N9qwZ1vjL1/RzX/ra4eT0hdpfYxzbzxufkdAudmxYNzsDGcNDox0VAsX4VSmiSZh
	W5Zm6hn6OzuqN8iN/r08xeGz17VtNT+iEWi8dDmCMy7xHcyDR9mg6hMfn5/+o5A+
	HTLQn0dxBawMU9knTRNn+ql7ZWbXKtm9qISoUk8/AtUBlLH+5z1f98WjFrACC/C+
	4VboVyiipSOhoi1KE0eJARgDLOWl1VBorbFtxM29N4vRJ1FixnzRvUYN+v67BFkD
	6OlXBfg/DHKc4Re4F339FieieI/vQBsslpz+bnZNBw==
X-ME-Sender: <xms:5aoqYxLQP5NxlNWHE3Izh7XCWjJjh5B_xcLfh401EyManA5ileDYKA>
    <xme:5aoqY9LfqbsAxIf4dBLBT_8CsRg3BgIxzZwwMUNOgwC2ZuU_tHqpgtgLe-3GKlME3
    U2v3VsdN16NNEYSvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeftddguddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecugg
    ftrfgrthhtvghrnhepkedvkeejkefgjeduffetteegjeekteetudevtdfftdeluddthfeh
    veefteekieetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:5aoqY5tQY-8RsVzveQ9Bnrzm64BvDaPeea4JFl7hjtGn_fmlFSnS1A>
    <xmx:5aoqYyYAfCUpGVh65UVnnx1ywbgE-iGdD_zpojuthzoAs5ZrrTGUzw>
    <xmx:5aoqY4b4ObEDY4YJOM2CkgH6CQf8Tb7sQv6l8cWXBSqZ18iwkHnktA>
    <xmx:5aoqYxDGkZ6AoX57Ng8TFLUPjTh4jJx5sDnCENrXOyO3lDwOcB-oOA>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 65D011700083; Wed, 21 Sep 2022 02:10:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <f72c4381-f9e4-4f43-9a6e-dc0b30a04613@app.fastmail.com>
In-Reply-To: <20220921045420.2116037-2-joel@jms.id.au>
References: <20220921045420.2116037-1-joel@jms.id.au>
 <20220921045420.2116037-2-joel@jms.id.au>
Date: Wed, 21 Sep 2022 15:40:24 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 1/3] aspeed/sdram: Use device
 tree to configure ECC
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
Cc: Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 21 Sep 2022, at 14:24, Joel Stanley wrote:
> Instead of configuring ECC based on the build config, use a device tree
> property to selectively enable ECC at runtime.
>
> There are two properties:
>
>   aspeed,ecc-enabled;
>   aspeed,ecc-size-mb = "512";
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
>     aspeed,ecc-size-mb = "512";
>   };
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2:
>   Change property to be aspeed,ecc-size-mb
>   Fix printing of size to use mb
>
>  drivers/ram/aspeed/sdram_ast2500.c | 14 ++++++++++----
>  drivers/ram/aspeed/sdram_ast2600.c | 14 ++++++++++----
>  drivers/ram/aspeed/Kconfig         | 13 -------------
>  3 files changed, 20 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/ram/aspeed/sdram_ast2500.c 
> b/drivers/ram/aspeed/sdram_ast2500.c
> index 435e1a8cfc1d..9bf4906b5939 100644
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
> +		ecc_size = dev_read_u32_default(dev, "aspeed,ecc-size-mb", 0);
> +		ast2500_sdrammc_ecc_enable(priv, ecc_size);

The code you deleted passes `info` to ast2500_sdrammc_ecc_enable() as
the first argument but you're passing `priv` here. Do they alias?

Ah, actually, I think you copied the code from sdram_ast2600.c into
sdram_ast2500.c. I suspect this might not compile?

Andrew
