Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEA8194C26
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 00:22:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pLbq3WDWzDr2w
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 10:21:59 +1100 (AEDT)
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
 header.s=fm2 header.b=gxK9Lq1U; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=w6pqPp7I; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pLZj0yWpzDr1q;
 Fri, 27 Mar 2020 10:21:00 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3E0F95C0296;
 Thu, 26 Mar 2020 19:20:56 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 26 Mar 2020 19:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=SPBez9eP4WUK7nuKDXBKLrvMRPHaZsR
 cUIsM6kI098U=; b=gxK9Lq1U1ZxYWuJmDagu+BiWgP0UnweCyPcj1hQFPT3pqyB
 LxatrOpz3FAEfvUd5qLkvi73gmsE81WE1yuXW3/+H2utlTJ700zpmigwBnng3LbP
 Epw8/ZUwW//YNGi5vI5WP29M05ArTjZhgECYpIDLXpl6l0XutKGVK/TqH3kcZBdb
 3fSSnnl3RegVFPK/pIMZwfbrLHVDz3R6nOZICjfQBEfWu4mT5wdRt6V042RXxLmB
 HkftvIlma412PclEU/x7QGDAcvIx6P6fK/P70Q67FDmPZhmfiGiC5mD8vTQus/wK
 YbUFsrsiOCXjtwmYkz/tONJ9O56EGqCaNR+XSBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=SPBez9
 eP4WUK7nuKDXBKLrvMRPHaZsRcUIsM6kI098U=; b=w6pqPp7Ik+M1thZhT77paX
 0kTNlrTdUYnMQAcVrtDz0NnabndanpH5Kz7uitVjMAH0IawekET32chwxjx/QrAB
 AI5EfDCNQ0ShnkOkID+8nHPKbHikhphmtXZIsHLlv2WNug7wH7+rQJVOYtlTdBUy
 /I5OGMrmq66pb2tLup533nvm5ega0BzsX+qGUr9aHIGB8pen3wqOIAzVku6CGdr5
 xIWIZvNyfoE7Wpw1QhVFQ+KvRMN7rQD1z/FJcERurYlNGq8E/FSzXocw+RRPxMX9
 jEcJsfq855jiZVYtNqFIlqx/UDaUIpMMzgTwthXI2YV74airZKu9lhdGwLETBR3Q
 ==
X-ME-Sender: <xms:1zh9XiSSQNyIfR04Kthsm7UhzVRMzwkPn4FDqhKG-ph4JO8hrCG-fw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehjedguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfies
 rghjrdhiugdrrghu
X-ME-Proxy: <xmx:1zh9XufHtV7zdwoJoABA-XKbJMCRjPY8iHi8hsLe8a8Jb5SOWvmeYA>
 <xmx:1zh9XhKzeexi5vEcv5EEK2-QJmy_wLjc9fAATGXS2oBd9NlFV8nS-w>
 <xmx:1zh9Xj46U2c1B70fLh5hYzpKB_YaQ7-xS0qosaP_zzgI0y1FsQ5TFQ>
 <xmx:2Dh9XmZVnS9kqIWj4sBS7nBGvNBOOGjDmrY1GIvL4Kj1IhMLrUY-hA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 02149E00EF; Thu, 26 Mar 2020 19:20:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1021-g152deaf-fmstable-20200319v1
Mime-Version: 1.0
Message-Id: <294a52cd-2f60-41e5-a58f-a74151a83b08@www.fastmail.com>
In-Reply-To: <20200306170218.79698-2-geissonator@yahoo.com>
References: <20200306170218.79698-1-geissonator@yahoo.com>
 <20200306170218.79698-2-geissonator@yahoo.com>
Date: Fri, 27 Mar 2020 09:50:58 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Andrew Geissler" <geissonator@gmail.com>,
 "Joel Stanley" <joel@jms.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: zaius: Add gpio line names
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org,
 Andrew Geissler <geissonator@yahoo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sat, 7 Mar 2020, at 03:32, Andrew Geissler wrote:
> Name the GPIOs to help userspace work with them. The names describe the
> functionality the lines provide, not the net or ball name. This makes it
> easier to share userspace code across different systems and makes the
> use of the lines more obvious.
> 
> Signed-off-by: Andrew Geissler <geissonator@yahoo.com>

So we're creating a bit of an ad-hoc ABI here between the DT and userspace.

Where are we documenting it?

Generally I think the idea is good though, so:

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 37 +++++++++++++++++++---
>  1 file changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts 
> b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index bc60ec291681..4bcc82046362 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -478,32 +478,61 @@
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpioh_unbiased>;
>  
> +	gpio-line-names =
> +	/*A0-A7*/	"","cfam-reset","","","","","","",
> +	/*B0-B7*/	"","","","","","","","",
> +	/*C0-C7*/	"","","","","","","","",
> +	/*D0-D7*/	"fsi-enable","","","","","led-sys-boot-status","led-attention",
> +				"led-fault",
> +	/*E0-E7*/	"","","","","","","","presence-pcie-e2b",
> +	/*F0-F7*/	"","","","","","","","checkstop",
> +	/*G0-G7*/	"fsi-clock","fsi-data","","","","","","",
> +	/*H0-H7*/	"onewire0","onewire1","onewire2","onewire3","","","","",
> +	/*I0-I7*/	"","","","power-button","","","","",
> +	/*J0-J7*/	"","","","","","","","",
> +	/*K0-K7*/	"","","","","","","","",
> +	/*L0-L7*/	"","","","","","","","",
> +	/*M0-M7*/	"","","","","","","","",
> +	/*N0-N7*/	"","","","","","","","",
> +	/*O0-O7*/	"","","","","iso_u164_en","","fsi-trans","",
> +	/*P0-P7*/	"ncsi_mux_en_n","bmc_i2c2_sw_rst_n","","bmc_i2c5_sw_rst_n","",
> +				"","fsi-mux","",
> +	/*Q0-Q7*/	"","","","","","","","",
> +	/*R0-R7*/	"","","","","","","","",
> +	/*S0-S7*/	"","","","","","","","",
> +	/*T0-T7*/	"","","","","","","","",
> +	/*U0-U7*/	"","","","","","","","",
> +	/*V0-V7*/	"","","","","","","","",
> +	/*W0-W7*/	"","","","","","","","",
> +	/*X0-X7*/	"","","","","","","","",
> +	/*Y0-Y7*/	"","","","","","","","",
> +	/*Z0-Z7*/	"","","","","","","","",
> +	/*AA0-AA7*/	"","","led-hdd-fault","","","","","",
> +	/*AB0-AB7*/	"","","","","","","","",
> +	/*AC0-AC7*/	"","","","","","","","";
> +
>  	line_iso_u146_en {
>  		gpio-hog;
>  		gpios = <ASPEED_GPIO(O, 4) GPIO_ACTIVE_HIGH>;
>  		output-high;
> -		line-name = "iso_u164_en";
>  	};
>  
>  	ncsi_mux_en_n {
>  		gpio-hog;
>  		gpios = <ASPEED_GPIO(P, 0) GPIO_ACTIVE_HIGH>;
>  		output-low;
> -		line-name = "ncsi_mux_en_n";
>  	};
>  
>  	line_bmc_i2c2_sw_rst_n {
>  		gpio-hog;
>  		gpios = <ASPEED_GPIO(P, 1) GPIO_ACTIVE_HIGH>;
>  		output-high;
> -		line-name = "bmc_i2c2_sw_rst_n";
>  	};
>  
>  	line_bmc_i2c5_sw_rst_n {
>  		gpio-hog;
>  		gpios = <ASPEED_GPIO(P, 3) GPIO_ACTIVE_HIGH>;
>  		output-high;
> -		line-name = "bmc_i2c5_sw_rst_n";
>  	};
>  };
>  
> -- 
> 2.21.0 (Apple Git-122)
> 
>
