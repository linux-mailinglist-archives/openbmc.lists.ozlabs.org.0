Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B006BE9D4
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 02:53:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dxJ76c87zDqkd
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 10:53:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pHSTosVz"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="v6sAGcLR"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dxHQ4blBzDqhk
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 10:53:05 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8E7ED613;
 Wed, 25 Sep 2019 20:53:01 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 20:53:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=oJyHVYcm0yUNdX4wWRrdICWirTCMN27
 XGC/5uxg8mPY=; b=pHSTosVz8Vu/zs5acltYg+vEyd0+EFCV1lVlEbTolHosBaF
 E3p6X5Ggrlzv8jcVELaq/ERBJPxy1U+XRsQek7aWDP/6iKt5k4Kv5/HQrEoTHK2r
 n9ygz9RBoNS6DEJ9xowjwrOAIIg0xgUc2zC4Td/Znt9EeVYwT0pqyJIvt2tdHN0X
 uMCiPosvNGtxTwQ1mpOKoZ4WTCf9w7TeNE7xhSzk8wx9ZSVneLtiNlawZ7VzooMK
 5FUR3COy7SKwEsRRbS6TQfbwUsQNKVjTY8dj8VQ7Zazk3Cg8BWOz6yQu127mcBar
 J7Ek+nPFnT3MPrGnqGCrPpIAx+CyK/FkOdDZmkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=oJyHVY
 cm0yUNdX4wWRrdICWirTCMN27XGC/5uxg8mPY=; b=v6sAGcLRpjzk7iGzI88apd
 2fkW91TPMP66FtaHQKVwEHaGHkDhNZF4ZiWTSLgrEI9nDKW2hygyurqUgzGBsXZn
 mmbG/CHtSzNlDvrkxzsspdmY4v3HmRjJjEkH20K7wZgd8rfLPzSU3n85sPrckBGA
 cGTAoM9vWc6nHE7aGiAEXCeKm6NlgBfzB5tnUdCjiD40jPB2aTCjWDotgPQmez8f
 AbMdWEYxcrl5NLbnJvoBkDjVC2SzKt7Xob5DeDWzsKfgCSFmJLnW0XG99WhDzjYc
 6V0aPSipiuT07gRgruaRtBXI8dTUA6lP3KS47nYL72ZlUK1Gz8+PDywD/BOOSZgQ
 ==
X-ME-Sender: <xms:7AuMXWG0eZkpoMN5nhMVAIbPsdXGSXWEjHKHsO9XhXorTp1Q8WiFpA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdeflecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:7AuMXbnocbkTqlH8H8K4GKxSwsgMhsQ_x1o5OacLFA-7Wdpuzfj2KQ>
 <xmx:7AuMXbI5zQYOC5zxRelYfN1TVVnpo0jZ10b6Trt4Xk2HNeR9vVhbBA>
 <xmx:7AuMXUaGTuIVgv-8T8IKBo2ErdRns2NtnlRJIEjQKWSGPlRn_4o_uA>
 <xmx:7QuMXYYnW6pN-f_lyTWR29YQmeJEOI4r9-_vuBjUzFJkg9hWVD3k-w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 025E0E00A5; Wed, 25 Sep 2019 20:52:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <02fdf035-a275-4f27-897d-8d5cc84d6db5@www.fastmail.com>
In-Reply-To: <20190925125610.12096-2-bradleyb@fuzziesquirrel.com>
References: <20190925125610.12096-1-bradleyb@fuzziesquirrel.com>
 <20190925125610.12096-2-bradleyb@fuzziesquirrel.com>
Date: Thu, 26 Sep 2019 10:23:42 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v4_linuux_dev-5.3_01/10]_dt-bindings:_aspeed-lpc:_A?=
 =?UTF-8?Q?dd_G6_compatible_strings?=
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



On Wed, 25 Sep 2019, at 22:26, Brad Bishop wrote:
> The AST2600 datasheet indicates the same register set behind the LPC
> controller address space.
> 
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>   v4: fix commit message
>   v3: move ipmi binding updates to a separate patch
>   v2: new for v2
> ---
>  Documentation/devicetree/bindings/mfd/aspeed-lpc.txt | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt 
> b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> index 86446074e206..e1197bab57bb 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> @@ -46,6 +46,7 @@ Required properties
>  - compatible:	One of:
>  		"aspeed,ast2400-lpc", "simple-mfd"
>  		"aspeed,ast2500-lpc", "simple-mfd"
> +		"aspeed,ast2600-lpc", "simple-mfd"
>  
>  - reg:		contains the physical address and length values of the Aspeed
>                  LPC memory region.
> @@ -64,6 +65,7 @@ BMC Node
>  - compatible:	One of:
>  		"aspeed,ast2400-lpc-bmc"
>  		"aspeed,ast2500-lpc-bmc"
> +		"aspeed,ast2600-lpc-bmc"
>  
>  - reg:		contains the physical address and length values of the
>                  H8S/2168-compatible LPC controller memory region
> @@ -74,6 +76,7 @@ Host Node
>  - compatible:   One of:
>  		"aspeed,ast2400-lpc-host", "simple-mfd", "syscon"
>  		"aspeed,ast2500-lpc-host", "simple-mfd", "syscon"
> +		"aspeed,ast2600-lpc-host", "simple-mfd", "syscon"
>  
>  - reg:		contains the address and length values of the host-related
>                  register space for the Aspeed LPC controller
> @@ -128,6 +131,7 @@ Required properties:
>  - compatible:	One of:
>  		"aspeed,ast2400-lpc-ctrl";
>  		"aspeed,ast2500-lpc-ctrl";
> +		"aspeed,ast2600-lpc-ctrl";
>  
>  - reg:		contains offset/length values of the host interface controller
>  		memory regions
> @@ -168,6 +172,7 @@ Required properties:
>  - compatible:	One of:
>  		"aspeed,ast2400-lhc";
>  		"aspeed,ast2500-lhc";
> +		"aspeed,ast2600-lhc";
>  
>  - reg:		contains offset/length values of the LHC memory regions. In the
>  		AST2400 and AST2500 there are two regions.
> @@ -187,7 +192,8 @@ state of the LPC bus. Some systems may chose to 
> modify this configuration.
>  
>  Required properties:
>  
> - - compatible:		"aspeed,ast2500-lpc-reset" or
> + - compatible:		"aspeed,ast2600-lpc-reset" or
> +			"aspeed,ast2500-lpc-reset"
>  			"aspeed,ast2400-lpc-reset"
>   - reg:			offset and length of the IP in the LHC memory region
>   - #reset-controller	indicates the number of reset cells expected
> -- 
> 2.21.0
>
