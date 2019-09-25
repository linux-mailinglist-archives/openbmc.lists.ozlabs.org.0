Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEC9BD690
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 05:08:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dNKw6gpZzDqhK
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 13:08:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="G07Wvurw"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JKH9XoX+"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dNHY4HW4zDqbX
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 13:06:17 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0B4D9222BD;
 Tue, 24 Sep 2019 23:06:13 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 24 Sep 2019 23:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=4PCEJnBsGFuT+atiHfg/PLDEWIBC7+j
 gsRdmtKGcxq4=; b=G07Wvurw2kcuc3Q8/btiCn+PhJ2jIWPKS9b6n9nKEOQwxY8
 2V+zZwAr96gMS190o7XGyE1tDpNjrX1VjZpbEU+7yG8Qgp5Hws2oYs5JT4YqFUIs
 239xaxiUJ3cbM43NIO1zjaHT+j7Ht6Hgxo9gblcq3sO96QlivK3hh2IaaATtHj0H
 /hXUS0R2KkrmH5EEeIHmFpx3xXTRR+uBk+d4zv/bZyaXiFEDr9TbULW4mlomA/Ty
 P/We3iahz9rWQGrozjPDYHiqdQ0ALUDYbz2t3CaOiCNKO6af4tHN3fNyNOp4iTQt
 7vNJbsQr1pjvKuuIC/I9p3KQY0SVoof9J3AxVMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4PCEJn
 BsGFuT+atiHfg/PLDEWIBC7+jgsRdmtKGcxq4=; b=JKH9XoX+YwA/n88OOJ0ab9
 mcHnDy2aNDCNVJZzI8wdmCU1m/TvmQIvzkKeRahhTtSEa7x+/vqJ8BI7mmxy9sf2
 oRMj2myzK24UD5uVlyXhmTjc5wE1LmL+A70sOaR83X9SxBRRpuaYR+5cR0YXKvs9
 CEbABbz9DTV/PsOkpqZDZPUeGy05Jvlrh5waJB79AEUcxxYT8WliGbbcnqcFXezo
 3cQT5R27T3N0c1z8plOHPlHSt2nUMHrRIv2qB6vB0f4sUMxXGoEwO5ri7GItrGSl
 15mjG/JJMOzTTerMHNjcN9EjSc3aR0wqEslLbTwvv4mOMTftBUDBHXyHH4KciLEw
 ==
X-ME-Sender: <xms:pNmKXecwiICCJE6kjqqCasQhbxasEw3mznXVL-imqe4pkPSZGHn6_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedugdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedu
X-ME-Proxy: <xmx:pNmKXTZQ-wxgUDzcjiuWcXiW0vNa09sDzE2g_ipy5t4xmW8AVOwPZQ>
 <xmx:pNmKXeoF8Cr0R1uKSSb25zc1ESDPANNLqgbIb4VjlmjtjwDGEEPzJA>
 <xmx:pNmKXcN-0hoyX-AkmOKg6zyDjTLcaXw4UylckfgAiDhqFY96WhOiGg>
 <xmx:pdmKXVEVpyGDkG53VPi1CffQmOv6oNP6awrS14C8PE_ma-1E2pObzw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C7819E00AF; Tue, 24 Sep 2019 23:06:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <9b1003aa-2dc7-4b7f-9b44-5055ba450375@www.fastmail.com>
In-Reply-To: <20190924194759.26854-6-bradleyb@fuzziesquirrel.com>
References: <20190924194759.26854-1-bradleyb@fuzziesquirrel.com>
 <20190924194759.26854-6-bradleyb@fuzziesquirrel.com>
Date: Wed, 25 Sep 2019 12:36:55 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_linux_dev-5.3_05/10]_reset:_simple:_Add_AST2600_?=
 =?UTF-8?Q?compatibility_string?=
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 25 Sep 2019, at 05:17, Brad Bishop wrote:
> The AST2600 SoC contains the same LPC register set as the AST2500.
> 
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> v3: new for v3
> ---
>  drivers/reset/reset-simple.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
> index 1154f7b1f4dd..2fe9c889a75a 100644
> --- a/drivers/reset/reset-simple.c
> +++ b/drivers/reset/reset-simple.c
> @@ -125,6 +125,7 @@ static const struct of_device_id reset_simple_dt_ids[] = {
>  		.data = &reset_simple_active_low },
>  	{ .compatible = "aspeed,ast2400-lpc-reset" },
>  	{ .compatible = "aspeed,ast2500-lpc-reset" },
> +	{ .compatible = "aspeed,ast2600-lpc-reset" },
>  	{ .compatible = "bitmain,bm1880-reset",
>  		.data = &reset_simple_active_low },
>  	{ /* sentinel */ },
> -- 
> 2.21.0
>
