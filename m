Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9DCCEFDA
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 02:17:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nHwt6WKLzDqDP
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 11:17:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="EAcLbrDF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="FOH6Wyrt"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nHwJ418GzDqKS
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 11:17:04 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9A24921C57;
 Mon,  7 Oct 2019 20:17:01 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 07 Oct 2019 20:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=U1RSf0kQy5ozIqorkT3WHC4H+uX3Rkb
 J+E+9F+XARso=; b=EAcLbrDFDc6UqbjwH6hGIcIgXWI5clU25aDUf0G6kVMvbyC
 izzmR/jUD/Au6D/3gZOWgW5oAkigLMlD2iECgd5pgm+b6aeC8T27UeQaohoqgxjw
 m3MQ4uEbQkliNLgrESX7eHAV0lnUkOLPtZEN05sUKoFKGCBerxaHcZenvwT42GaH
 8YXSe+s4aOrxisEcbC3Ke9xqQFuoZw2njYHvJUw3yFssqlvpkkds8ioExGknePOc
 mLsxjdYKegTWoqhSSd5ZRcurSUh5MPyh3fdHPuS0ms9NGUyQbP8kC/XaoBWmqerL
 w+rOloA+HTm1aXNdcOtthSPDc9bUtzc7zHc/ZJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=U1RSf0
 kQy5ozIqorkT3WHC4H+uX3RkbJ+E+9F+XARso=; b=FOH6WyrtQCluWYbDhgDwrz
 fz2hZLMUmk/pvwyHu27wyP5DdpQJuhEASt1FpSeMEcKWNskT2X0z+wkCTaxHqQZv
 c/DeV5i/yDo3wzz6GQiDT2DpkJ5/AdPHyWljs1eLtJXWh0kGHiEDJk5krwuWR84+
 /SkHoH6KO9pzu9g4ied+NeqYPnN94hd/XDywnlIrQ9FWYNee3oS6Xuu/lq6BAWMI
 ti3B2g6T8n6alo+WNaEVjSUPOAl5V/SrET5d6CCn+nBCDsQMuf+5TOUBbcDma0jo
 qoOPrv3nojNx3U2TNHvNHUA+yixb5CmM5qat3hx5YTWyxolYYsaeWoka9Ml/tYnw
 ==
X-ME-Sender: <xms:fNWbXdhftdERk4J7__PG3dzQmJHb8MK3Zu4z_jAcYvTwubliztBMyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheekgdefudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:fNWbXZfWR5s1A90QfnYGSI2FQX2Nx5kZUcj-DaK6auaKenPU1_72UA>
 <xmx:fNWbXacQFKLGR1OydOjwDA5k28qOaoc8QGXMjkULhLLMPwDrjNedug>
 <xmx:fNWbXb-kPx4rrQ5B2I6NRichq4zFLNtB9JzMQUzNhnIYGH8wzPLztg>
 <xmx:fdWbXfdjItBjErhx1WxlGgzRchpz8CMcB3QckTXHTGeen8miXHh9fg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 15626E00A5; Mon,  7 Oct 2019 20:16:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <f9fa4886-16d2-465e-8628-13cbbd04c6c9@www.fastmail.com>
In-Reply-To: <20191003222415.6938-2-eajames@linux.ibm.com>
References: <20191003222415.6938-1-eajames@linux.ibm.com>
 <20191003222415.6938-2-eajames@linux.ibm.com>
Date: Tue, 08 Oct 2019 10:47:53 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_1/2]_ARM:_dts:_Aspeed:_Tacoma:_Add_gp?=
 =?UTF-8?Q?io-key_definitions?=
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



On Fri, 4 Oct 2019, at 07:54, Eddie James wrote:
> Add gpio-keys for various signals on Tacoma.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 60 +++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts 
> b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> index 52c4374ce0d9..ea6e666d0caa 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -3,6 +3,7 @@
>  /dts-v1/;
>  
>  #include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
>  #include <dt-bindings/leds/leds-pca955x.h>
>  
>  / {
> @@ -33,6 +34,65 @@
>  			reg = <0xba000000 0x2000000>; /* 32M */
>  		};
>  	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		air-water {
> +			label = "air-water";
> +			gpios = <&gpio0 ASPEED_GPIO(Q, 7) GPIO_ACTIVE_LOW>;
> +			linux,code = <ASPEED_GPIO(Q, 7)>;
> +		};
> +
> +		checkstop {
> +			label = "checkstop";
> +			gpios = <&gpio0 ASPEED_GPIO(E, 3) GPIO_ACTIVE_LOW>;
> +			linux,code = <ASPEED_GPIO(E, 3)>;
> +		};
> +
> +		ps0-presence {
> +			label = "ps0-presence";
> +			gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
> +			linux,code = <ASPEED_GPIO(H, 3)>;
> +		};
> +
> +		ps1-presence {
> +			label = "ps1-presence";
> +			gpios = <&gpio0 ASPEED_GPIO(E, 5) GPIO_ACTIVE_LOW>;
> +			linux,code = <ASPEED_GPIO(E, 5)>;
> +		};
> +	};
> +
> +	gpio-keys-polled {
> +		compatible = "gpio-keys-polled";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		poll-interval = <1000>;
> +
> +		fan0-presence {
> +			label = "fan0-presence";
> +			gpios = <&pca0 4 GPIO_ACTIVE_LOW>;
> +			linux,code = <4>;
> +		};
> +
> +		fan1-presence {
> +			label = "fan1-presence";
> +			gpios = <&pca0 5 GPIO_ACTIVE_LOW>;
> +			linux,code = <5>;
> +		};
> +
> +		fan2-presence {
> +			label = "fan2-presence";
> +			gpios = <&pca0 6 GPIO_ACTIVE_LOW>;
> +			linux,code = <6>;
> +		};
> +
> +		fan3-presence {
> +			label = "fan3-presence";
> +			gpios = <&pca0 7 GPIO_ACTIVE_LOW>;
> +			linux,code = <7>;
> +		};
> +	};
>  };
>  
>  &fmc {
> -- 
> 2.23.0
> 
>
