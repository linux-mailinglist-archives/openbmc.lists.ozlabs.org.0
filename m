Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D42ED1A2E8F
	for <lists+openbmc@lfdr.de>; Thu,  9 Apr 2020 06:53:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yTLk1TyDzDqRN
	for <lists+openbmc@lfdr.de>; Thu,  9 Apr 2020 14:53:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=Kw6gWkOl; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=wbtU+f5z; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yTKz1ytyzDqQ3
 for <openbmc@lists.ozlabs.org>; Thu,  9 Apr 2020 14:53:10 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 002122A6;
 Thu,  9 Apr 2020 00:53:06 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 09 Apr 2020 00:53:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=dHvAVjg26/MdpfhJwaineCQVcidUozU
 IdFvfqTYnRWE=; b=Kw6gWkOl3HuP/tyyzn+t6LfPY4DEAZoZn8oaV/HiaUFUxHn
 Uif4vgHm5fovPioX7rY81/cGjexMwZY854UWPeXpRB0fWs+w2iW/FISbQz2174Mw
 3UP2I2JslhLTa2GRn2PIY0yPq1qFtaJtrscNeB5b2hq3v6DG9UTnOdkBHpWJyn71
 /rm/yE4cw5USWSlUjMt9tny0TIKOLVl7tXrb3C2HYMq7azkqkazsTEvNiRjn7ZC8
 1h8/YWiuK3Lr06ijSyPz9/vA55k5wOWz+EjOk3/VMYHyFCFisUOP5HDfVZvEYnaW
 4DRkq5TbSkv0xtisPX4hDs4MB9K/LcMqx83M2eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dHvAVj
 g26/MdpfhJwaineCQVcidUozUIdFvfqTYnRWE=; b=wbtU+f5zUL1JB3Rqhe/hmA
 XYVKXBXKrTI8tJiIMNHt4qAg0E/uONR1ZO2N3SidCGmGgHRA/wRT9EZgF/ocQbn2
 xSX67Ga4o50w0+3gyUsQb0kvAWEeKJPwIx1xQVrzvShcz/2ULia2raRaIAnK9YLc
 h8kT+mVvnnk6e0uG8Or6r/W30UGRgBOCt0IWi83zYmxTLpX3qirYRoCTeP0HJlxC
 ZsuMG0FrbSZ3NeKsEn9wj2vBWIb9u+kXRv3Uxu/eJSS1Z/ZcwdmnZ8sqPG632WhE
 YvDG00SaMhksEKquhI/tMh723DQ/SRTaG1pmRiNgS9L0qg0YbeHlbn6HPDktbMkw
 ==
X-ME-Sender: <xms:MqqOXgn91s56egCZ6Qc9YF85tmD6D2v0J8WnoBqGD097wwPHvGWojQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudekgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:MqqOXnaypAYxplV2dHeSzim7D3426yIFxcOlbfTH6VqxidcFYe8b5w>
 <xmx:MqqOXmMddkkuJVq-5uQbk7ACXev-M9kwRI0EKB4fLMxSXUN6BDWqKw>
 <xmx:MqqOXsj8J-QLuOK_gV_AvRUBoz7Qqi-gMYCStvx3TC2O2sFN_XYv1g>
 <xmx:MqqOXjBSx_fAm0j2n6sCKIQuFiQ4VuOhQwPWTgavPLLMxABV1PDRlA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4F50EE00E1; Thu,  9 Apr 2020 00:53:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1104-g203475c-fmstable-20200408v2
Mime-Version: 1.0
Message-Id: <71cfd9fd-a70f-47ad-8c54-b950e32c0fef@www.fastmail.com>
In-Reply-To: <20200408202711.3509-1-eajames@linux.ibm.com>
References: <20200408202711.3509-1-eajames@linux.ibm.com>
Date: Thu, 09 Apr 2020 14:23:31 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-5.4] clk: ast2600: Fix AHB clock divider for A1
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



On Thu, 9 Apr 2020, at 05:57, Eddie James wrote:
> The latest specs for the AST2600 A1 chip include some different bit
> definitions for calculating the AHB clock divider. Implement these in
> order to get the correct AHB clock value in Linux.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/clk/clk-ast2600.c | 31 +++++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> index 42bfdc16bf7a..35f53956c762 100644
> --- a/drivers/clk/clk-ast2600.c
> +++ b/drivers/clk/clk-ast2600.c
> @@ -642,14 +642,22 @@ static const u32 ast2600_a0_axi_ahb_div_table[] = {
>  	2, 2, 3, 5,
>  };
>  
> -static const u32 ast2600_a1_axi_ahb_div_table[] = {
> -	4, 6, 2, 4,
> +static const u32 ast2600_a1_axi_ahb_div0_tbl[] = {
> +	3, 2, 3, 4,
> +};
> +
> +static const u32 ast2600_a1_axi_ahb_div1_tbl[] = {
> +	3, 4, 6, 8,
> +};
> +
> +static const u32 ast2600_a1_axi_ahb200_tbl[] = {
> +	3, 4, 3, 4, 2, 2, 2, 2,
>  };
>  
>  static void __init aspeed_g6_cc(struct regmap *map)
>  {
>  	struct clk_hw *hw;
> -	u32 val, div, chip_id, axi_div, ahb_div;
> +	u32 val, div, divbits, chip_id, axi_div, ahb_div;
>  
>  	clk_hw_register_fixed_rate(NULL, "clkin", NULL, 0, 25000000);
>  
> @@ -679,11 +687,22 @@ static void __init aspeed_g6_cc(struct regmap *map)
>  	else
>  		axi_div = 2;
>  
> +	divbits = (val >> 11) & 0x3;
>  	regmap_read(map, ASPEED_G6_SILICON_REV, &chip_id);
> -	if (chip_id & BIT(16))
> -		ahb_div = ast2600_a1_axi_ahb_div_table[(val >> 11) & 0x3];
> -	else
> +	if (chip_id & BIT(16)) {
> +		if (!divbits) {
> +			ahb_div = ast2600_a1_axi_ahb200_tbl[(val >> 8) & 0x3];
> +			if (val & BIT(16))
> +				ahb_div *= 2;
> +		} else {
> +			if (val & BIT(16))
> +				ahb_div = ast2600_a1_axi_ahb_div1_tbl[divbits];
> +			else
> +				ahb_div = ast2600_a1_axi_ahb_div0_tbl[divbits];
> +		}
> +	} else {
>  		ahb_div = ast2600_a0_axi_ahb_div_table[(val >> 11) & 0x3];
> +	}

This was hard for me to read. Have you considered giving the conditions
names?

Andrew
