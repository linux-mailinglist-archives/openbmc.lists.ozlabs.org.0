Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC367C9544
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 01:56:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kChP3V6kzDqSv
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 09:56:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="PX2iEXbP"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="wUdb+Crd"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kCgd6s8XzDqSm
 for <openbmc@lists.ozlabs.org>; Thu,  3 Oct 2019 09:55:25 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 57741220CB;
 Wed,  2 Oct 2019 19:55:23 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 02 Oct 2019 19:55:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=NbenJKZa8ztcrdKfeBCv0Zkjstz4rKR
 qZMa22PICOe4=; b=PX2iEXbPPT0Tvq7QCZlwYtY+PTdLleX6TLgQvnjd4Ssnt8x
 cI+bO9rf9q4HL3JywS1CWQfbqhr2W5CE3I4gm0oH8NuI4O4kDliBTXcKyIPZ4Fb/
 p5T69Gh8Tqs6eCiqCLHFSmBPMZ8XBwDivGrdBUoX9QqOXmCTlYEsA82fF7Hfec2t
 LFQXH28vFFTHFhgJ8tCpHpNUxTruiFUPj0QwxZFggW8p+9hlfa8yk09oD3zprNRf
 t9iu/m41uk2OSAjT21sZnglGOTeZW67aJ1t4+oVzk1E5lhFcljH1fSGQLLdUZ0sw
 dOufy5IUq4YLm/jKUdhugqzCav3eHZpydYdPnFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=NbenJK
 Za8ztcrdKfeBCv0Zkjstz4rKRqZMa22PICOe4=; b=wUdb+Crdwy/mF2TfeMxeKt
 0Cldjc7amFc2cfEE5nqqeDkoNerb8VsJweHkRyAX9PKD3/fES97SqvsrSY71bDsx
 fPTC9tMrNmiP+ksNvfrKrA6CTTC8CqJv/RicGWE8sxDpUn4Aq67VmFPvAEgVOC+5
 wj69lZdp8Lgq6pq05ZG2/q5A4NEplAkxM8dXJw5S/fFMXVSRhm0N/TJmGkJaP50u
 Ct39HJO0O3fzEJJzlUZChLHrwgieMbqYIO+L+Z2FRE5H1Gl51n4RqvHwp0164RIx
 TYfc4WRDBzafAnuH+rt16hRvDxA2Qj11HLXS0kqYa2ZaL42/Wpzan0LP9/KfT5qw
 ==
X-ME-Sender: <xms:6jiVXRBvZzooo9MnR8LrImaKT4rfyOC-lX2aCfFw3FpgLxd1P4yI0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrgeejgddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepghhithhhuhgsrdgtohhmnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
 fiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:6ziVXdOJ7reSx3NoXUuCY0rh-cIPe6qM35rEP1SxbhpJqvkVUUmZWA>
 <xmx:6ziVXUoodxcR5biUYWf3UMorFzVrOOLYitSfGEBqjp9J8yemjCY0xw>
 <xmx:6ziVXUKGl5fsvEHA8SlfUQI0StZbL3Y-Rre7mVfyK6X33F4IPK-SPA>
 <xmx:6ziVXZF2zQJlieR28IWIsrggDxv89noAl53Ki_t-knEAiG70g5R2bw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E2F16E00A6; Wed,  2 Oct 2019 19:55:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-359-g64bf1af-fmstable-20191002v2
Mime-Version: 1.0
Message-Id: <8b4a6b60-0d9c-45be-8cfe-87a80b818947@www.fastmail.com>
In-Reply-To: <20191002102328.5196-2-joel@jms.id.au>
References: <20191002102328.5196-1-joel@jms.id.au>
 <20191002102328.5196-2-joel@jms.id.au>
Date: Thu, 03 Oct 2019 09:26:11 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_1/4]_ARM:_dts:_aspeed-g6:_Add_VUART_d?=
 =?UTF-8?Q?escriptions?=
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 2 Oct 2019, at 19:53, Joel Stanley wrote:
> The AST2600 has two VUART devices.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 5bea04b67b5c..2ad90a906266 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -29,6 +29,8 @@
>  		i2c14 = &i2c14;
>  		i2c15 = &i2c15;
>  		serial4 = &uart5;
> +		serial5 = &vuart1;
> +		serial6 = &vuart2;
>  	};
>  
>  
> @@ -475,6 +477,26 @@
>  				};
>  			};
>  
> +			vuart1: serial@1e787000 {
> +				compatible = "aspeed,ast2500-vuart";
> +				reg = <0x1e787000 0x40>;
> +				reg-shift = <2>;
> +				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;

For anyone playing along the IRQ isn't documented in current releases of the
datasheet, but you can find it in the SDK devicetree:

https://github.com/AspeedTech-BMC/linux/blob/3f525e22080917f5569fb853f348f5ecb089a0d9/arch/arm/boot/dts/aspeed-g6.dtsi#L516

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
