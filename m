Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2E81A3E9B
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 05:11:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48z31Z2GDVzDrKL
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 13:10:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=vwLN2YCf; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=FdAn8F1P; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48z30N37dGzDrK2
 for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2020 13:09:55 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id AA8355C0220;
 Thu,  9 Apr 2020 23:06:17 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 09 Apr 2020 23:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=mSZpCjoQSGiUf+utUGY4p5TraBfnqG8
 3h0OQApm+2Vs=; b=vwLN2YCftXupGR+tUVXXBhsKAHBrfMfPurT+T0ChNcA2AZM
 2zZAHMllzjxLPVFMX2mK4TjDP2w6K226RFByXktzv13aTNEo+34X2jYKF34mIdQj
 DDfWbFpGx/fLwNMGKbxyZyupqNSIOabxiL2WLTgOnhyKRVq2cSMidQjcruvin9jz
 JL2BIXSwgg4iile61GzQO+t9aPPrye8snrCCSm6LW40y+cSE2y3IUReTZvAMVGnC
 6ZuGbgeLuEYL56NAhOSwt2XQEBj1PF94spZep7B/JdgI3wJtPTxGY7/4+u9XUxfC
 pNCmkpJ7R8Ez3Qfvhok/65p62ON9ASLScUqEkKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=mSZpCj
 oQSGiUf+utUGY4p5TraBfnqG83h0OQApm+2Vs=; b=FdAn8F1PQtXJC1y2UQjz/T
 4SFI8H7taC4zBcY/mGxytCw0B2yTSNrKjMsMh+64qes79LXXd295WVQbUGvamXac
 mRF+aOSiAWEqMNQxjwZGhOAsxONMkcvCt5XMGjc5ggUY+h7tCSZpwfsvj3QZaN1u
 O4aepBfB/tbaIeyGJCrMJY1RiMeoqszwnIQuURw/y/8jSx4HEppWQMJOfvoNX8WH
 LRuAvs4xH6iJ3fGpMnxsMrXze6o4TtYsXmL+HRxtFbeaxNukx2hVpZCpg1vHikOr
 8yAPsxMajZju1m1bNODkasufpzl6DbD8HZ7fssn3Le5Zzr9N2TkKuZ2YtQrAxBew
 ==
X-ME-Sender: <xms:qeKPXqfJc8BEm8ShNQ0Dux9Hw-knjpRtiH6mdmVXoz094N7YFl_dxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrvddugdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:qeKPXqtb-aHcEuCtwKEXlDZ8UhdpY6LAjCLbKdCpP64RC1gwsLN9qQ>
 <xmx:qeKPXutKKCro3PtVZgSGsrVFjhjf1IVMtIYT_UyTBE4X2roa86OpZw>
 <xmx:qeKPXh-dez_sy6Xy9tIuIST7lhAcCY-rFceFn2PxnOw8QRpuZRKm0g>
 <xmx:qeKPXpMLIErzFawkvujKis2ndnEzpY4FJ4qxr2rCX1jF0CNlAeZdFw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DAA2AE00A5; Thu,  9 Apr 2020 23:06:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1104-g203475c-fmstable-20200408v2
Mime-Version: 1.0
Message-Id: <733d447e-d9a7-4aab-a7d3-47540d6638e5@www.fastmail.com>
In-Reply-To: <afc1c465-3bfc-1f8a-7f61-96329643b02c@linux.ibm.com>
References: <20200408202711.3509-1-eajames@linux.ibm.com>
 <71cfd9fd-a70f-47ad-8c54-b950e32c0fef@www.fastmail.com>
 <afc1c465-3bfc-1f8a-7f61-96329643b02c@linux.ibm.com>
Date: Fri, 10 Apr 2020 12:36:41 +0930
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



On Fri, 10 Apr 2020, at 06:59, Eddie James wrote:
> 
> On 4/8/20 11:53 PM, Andrew Jeffery wrote:
> >
> > On Thu, 9 Apr 2020, at 05:57, Eddie James wrote:
> >> The latest specs for the AST2600 A1 chip include some different bit
> >> definitions for calculating the AHB clock divider. Implement these in
> >> order to get the correct AHB clock value in Linux.
> >>
> >> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> >> ---
> >>   drivers/clk/clk-ast2600.c | 31 +++++++++++++++++++++++++------
> >>   1 file changed, 25 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> >> index 42bfdc16bf7a..35f53956c762 100644
> >> --- a/drivers/clk/clk-ast2600.c
> >> +++ b/drivers/clk/clk-ast2600.c
> >> @@ -642,14 +642,22 @@ static const u32 ast2600_a0_axi_ahb_div_table[] = {
> >>   	2, 2, 3, 5,
> >>   };
> >>   
> >> -static const u32 ast2600_a1_axi_ahb_div_table[] = {
> >> -	4, 6, 2, 4,
> >> +static const u32 ast2600_a1_axi_ahb_div0_tbl[] = {
> >> +	3, 2, 3, 4,
> >> +};
> >> +
> >> +static const u32 ast2600_a1_axi_ahb_div1_tbl[] = {
> >> +	3, 4, 6, 8,
> >> +};
> >> +
> >> +static const u32 ast2600_a1_axi_ahb200_tbl[] = {
> >> +	3, 4, 3, 4, 2, 2, 2, 2,
> >>   };
> >>   
> >>   static void __init aspeed_g6_cc(struct regmap *map)
> >>   {
> >>   	struct clk_hw *hw;
> >> -	u32 val, div, chip_id, axi_div, ahb_div;
> >> +	u32 val, div, divbits, chip_id, axi_div, ahb_div;
> >>   
> >>   	clk_hw_register_fixed_rate(NULL, "clkin", NULL, 0, 25000000);
> >>   
> >> @@ -679,11 +687,22 @@ static void __init aspeed_g6_cc(struct regmap *map)
> >>   	else
> >>   		axi_div = 2;
> >>   
> >> +	divbits = (val >> 11) & 0x3;
> >>   	regmap_read(map, ASPEED_G6_SILICON_REV, &chip_id);
> >> -	if (chip_id & BIT(16))
> >> -		ahb_div = ast2600_a1_axi_ahb_div_table[(val >> 11) & 0x3];
> >> -	else
> >> +	if (chip_id & BIT(16)) {
> >> +		if (!divbits) {
> >> +			ahb_div = ast2600_a1_axi_ahb200_tbl[(val >> 8) & 0x3];
> >> +			if (val & BIT(16))
> >> +				ahb_div *= 2;
> >> +		} else {
> >> +			if (val & BIT(16))
> >> +				ahb_div = ast2600_a1_axi_ahb_div1_tbl[divbits];
> >> +			else
> >> +				ahb_div = ast2600_a1_axi_ahb_div0_tbl[divbits];
> >> +		}
> >> +	} else {
> >>   		ahb_div = ast2600_a0_axi_ahb_div_table[(val >> 11) & 0x3];
> >> +	}
> > This was hard for me to read. Have you considered giving the conditions
> > names?
> 
> 
> Yea it's a bit complicated. Do you mean use some boolean variables or 
> add some comments?

Yeah, pretty much that. I had a bit of a crack but then figured I'd just ask
the question :)

Andrew
