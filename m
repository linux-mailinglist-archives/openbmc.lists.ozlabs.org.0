Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0671A6823A
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2019 04:28:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45n6sT3k8JzDqPW
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2019 12:28:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="F6tZ4Ja6"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IVlIat4Y"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45n6pR0xRWzDqTK
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 12:26:06 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 821B121F76;
 Sun, 14 Jul 2019 22:26:03 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 14 Jul 2019 22:26:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=5ed/qK+K+itXppMmT4g/PgiK8VtO1RK
 SlbLF5hoWXqE=; b=F6tZ4Ja6hYLsp24SHnGDrC08RKXZ++Kx5Nu2l17p2Jau4/D
 eWBv83opp2N1qHGeJGzKJQuCGpSMMWNMkrZfMZn1d9HL3errFcH6iPuBNykkcawc
 4aslH1HrHoiaHKI1Pb9hJeEgOQVG6ygpJ2TNvH3HvaLQ7/HVDZ32kV3v3X+UgwN2
 u/rCR/njptp8TCGHbyfwHcmB5tVGsVSkyKoLM65b5DmWr6QAkEKclzGii1jBFadF
 e1xer7jDCHLU6NIT/epTr9Bbs5za7LX12R8MyzJ/Ok0wrbQLDdJQoyfFSbHPxrSc
 +hCU1OaHZMwxtZSYAY5uJVq6mngfcN+zkTZrxxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5ed/qK
 +K+itXppMmT4g/PgiK8VtO1RKSlbLF5hoWXqE=; b=IVlIat4Yubf/eU+UdyvfZs
 x2HQH//gxe7gf/rOoa39Trc/Y4Qg8nEV3ZF55eEdgSU+7cJthvfnCy6GdmAxCqnK
 OoTHUOmpJnp2lyHAVJ3ePCPmlc+i9Gu5CPtWdBslfel0kpsxPvkF5cIuzEgInUiw
 90kQJ4DH9Ta3l9Wd3N5Caw170yO/wxDycbiHyGZ1pXRoeIyLuphaigwGdZsANkqQ
 75+tNE8OreSTgVt3rAg/Qq7JCti0gq13QA4nF3J1ue93QZv3vZcMT2Ka46LKCYWL
 T2RWJejrUJwU48nI5f37Wt9ILkk7JEqYv+OQKCkHDKXk0n29REFyopXStoP4sxTQ
 ==
X-ME-Sender: <xms:O-QrXah8sn5YCVZm2zDG4Xp14u6Y6ZZ5Tea11DmOnaVR9L2ajkByLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrheejgdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:O-QrXVShGaPYf5B2_7_kDc7apKGonG9ybtyV5uJrRYpm_LHjd7eWwA>
 <xmx:O-QrXT33TPf0DRmt23XwRIZqU8jjnte9ppWYLe1vKZb8zOhQAEbmKw>
 <xmx:O-QrXX1YSC_xNSIGRim1JmD__Phz5J1GwODbgH1GFgCcoBP9fIQDGA>
 <xmx:O-QrXUGis6LVe81jEp31Du-4-WNUs8DtLL5nwlh9q2StGXy3FKVY1A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 466A5E00CC; Sun, 14 Jul 2019 22:26:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <588446e9-8528-4081-9a1f-476628c37767@www.fastmail.com>
In-Reply-To: <1562945738-7432-1-git-send-email-eajames@linux.ibm.com>
References: <1562945738-7432-1-git-send-email-eajames@linux.ibm.com>
Date: Mon, 15 Jul 2019 11:56:12 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.2]_ARM:_dts:_aspeed:_swift:_Enable_vide?=
 =?UTF-8?Q?o_engine_and_USB_hub_devices?=
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



On Sat, 13 Jul 2019, at 01:18, Eddie James wrote:
> These devices are necessary for IpKVM to function, so enable them on
> Swift.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-swift.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts 
> b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> index caac895..bdf3fb9 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> @@ -33,6 +33,13 @@
>  			compatible = "shared-dma-pool";
>  			reusable;
>  		};
> +
> +		video_engine_memory: jpegbuffer {
> +			size = <0x02000000>;	/* 32MM */
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
>  	};
>  
>  	gpio-keys {
> @@ -963,4 +970,13 @@
>  	status = "okay";
>  };
>  
> +&vhub {
> +	status = "okay";
> +};
> +
> +&video {
> +	status = "okay";
> +	memory-region = <&video_engine_memory>;
> +};
> +
>  #include "ibm-power9-dual.dtsi"
> -- 
> 1.8.3.1
> 
>
