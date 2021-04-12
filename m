Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D37A535B8A0
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 04:26:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJXfY5nVdz30Gd
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 12:26:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=teeWEse5;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=YfZipf6l;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=teeWEse5; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=YfZipf6l; 
 dkim-atps=neutral
X-Greylist: delayed 543 seconds by postgrey-1.36 at boromir;
 Mon, 12 Apr 2021 12:25:57 AEST
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJXfF6rdvz2yyC;
 Mon, 12 Apr 2021 12:25:57 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id D92F71588;
 Sun, 11 Apr 2021 22:16:46 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 11 Apr 2021 22:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=M9P4Fh68L8b7pD9soMp1oQ/p2ZkqGaQ
 LEL9HTQWPbC4=; b=teeWEse5VYKyhg2a96T0CU1saAUquwJfInB1LwzFiuhO5T+
 l2ECVgR5ZrEjYpv1l/F+mBKF5eY9aNH5/ZFVAWjWZ8mYXmPRaiX5kaxvADDLBJW7
 U+E01xQXOpgYLZs54Hh00lP7EL6eXjnulVf5cGEAykDD1E5+PwFOC1g7DEHl0t1o
 NhiR9zBl40fBi9HjQhPLRwpgxJvtwC1xWnIBZ9X83EXHImuMzJ22wIc1jfm7Z3h3
 XXDHLB7/0UqN6rsNXfV2P3h4QZiv4rLsW/8C3q3pyaTrVqBZrEwT6zI4LQMS3PDz
 GgzfeB9rkO4jFOHmDPrXrKO4+7HI0EZtWuw1ysA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=M9P4Fh
 68L8b7pD9soMp1oQ/p2ZkqGaQLEL9HTQWPbC4=; b=YfZipf6lIKLBhkNVhX0wP+
 XJXuEmPXpgAvJ9jQmZ/7iNF2/t4htnEuZl+XA6NUXjWgoa2/TvJki5kazcNnEbNx
 fZoDLotGuaYJ+sHefOhk3fEpFHMV74n/tu/zm1TyntxZ2rFfTzLDkRKeRKCqUhze
 BMw7XckTtIfLn2f5HCcOD0HOES3TWVL0Jq1Xvhd+KOWPnHRX/uT6NcdyQputwrxV
 wPV2S/b4tikV4JNSKPtLa/yp8RuEBGuRjKZFSpWuX3jfDhbBWwwY4e7aH1hc5LXi
 1k0l7NnGSDdT+/+9/ZdyJaHj3GQGIWWjBnrmCiIOoz4tRQMti7gXUPXVcxASeJDQ
 ==
X-ME-Sender: <xms:jK1zYJoSmiZYxrC6oHg6T3EdRF3y2sZg2WHpbzKxvz_Mxe_LfoNfyw>
 <xme:jK1zYLpjPtZA-s-MIdQbhk43Iy9SNqete5_zz-gxryes6-ffUss-IuwlrWX5f60Dk
 c3tzEP2QViHENKHYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekiedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:jK1zYGPqAXkSKCOqQ2DSyuim80fHPGz2sT1o_SXSqiIxqQEW1pZQiA>
 <xmx:jK1zYE4qjXAMZ2IjT958mEB7FGcvnxRc_aC1Pua5CMZZQ72N1v9K5w>
 <xmx:jK1zYI7bSKCYt8j4VMNISx0u_tSUm-S26rKxqXHTVL7DV8SrSiAWtg>
 <xmx:jq1zYHZQUMUTufmtAMNYVTbLPb5CQGLUCDEtXb57f5apJWLcdt-dOw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4AD64A00079; Sun, 11 Apr 2021 22:16:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <84202973-1a94-4630-beeb-f33d044a0364@www.fastmail.com>
In-Reply-To: <20210401044232.9637-1-zev@bewilderbeest.net>
References: <20210401044232.9637-1-zev@bewilderbeest.net>
Date: Mon, 12 Apr 2021 11:46:24 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Zev Weiss" <zev@bewilderbeest.net>, "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH v3] ARM: dts: aspeed: add ASRock E3C246D4I BMC
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 1 Apr 2021, at 15:12, Zev Weiss wrote:
> This is a relatively low-cost AST2500-based Xeon E-2100/E-2200 series
> mini-ITX board that we hope can provide a decent platform for OpenBMC
> development.
> 
> This initial device-tree provides the necessary configuration for
> basic BMC functionality such as host power control, serial console and
> KVM support, and POST code snooping.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
> 
> Changes since v2:
>  - un-bungled filename in dtb-$(CONFIG_ARCH_ASPEED)
> Changes since v1:
>  - added entry to dtb-$(CONFIG_ARCH_ASPEED)
>  - added board to compatible
>  - added pinctrl properties to adc
>  - split out of mostly-unrelated patch series
> 
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-asrock-e3c246d4i.dts  | 202 ++++++++++++++++++
>  2 files changed, 203 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 8e5d4ab4e75e..c22151b50ddc 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1406,6 +1406,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-ampere-mtjade.dtb \
>  	aspeed-bmc-arm-centriq2400-rep.dtb \
>  	aspeed-bmc-arm-stardragon4800-rep2.dtb \
> +	aspeed-bmc-asrock-e3c246d4i.dtb \
>  	aspeed-bmc-bytedance-g220a.dtb \
>  	aspeed-bmc-facebook-cmm.dtb \
>  	aspeed-bmc-facebook-galaxy100.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts 
> b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> new file mode 100644
> index 000000000000..dcab6e78dfa4
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/{
> +	model = "ASRock E3C246D4I BMC";
> +	compatible = "asrock,e3c246d4i-bmc", "aspeed,ast2500";
> +
> +	aliases {
> +		serial4 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";
> +	};
> +
> +	memory@80000000 {
> +		reg = <0x80000000 0x20000000>;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		heartbeat {
> +			/* BMC_HB_LED_N */
> +			gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "timer";
> +		};
> +
> +		system-fault {
> +			/* SYSTEM_FAULT_LED_N */
> +			gpios = <&gpio ASPEED_GPIO(Z, 2) GPIO_ACTIVE_LOW>;
> +			panic-indicator;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		uid-button {
> +			label = "uid-button";
> +			gpios = <&gpio ASPEED_GPIO(F, 1) GPIO_ACTIVE_LOW>;
> +			linux,code = <ASPEED_GPIO(F, 1)>;
> +		};
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>,
> +			<&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>, <&adc 9>,
> +			<&adc 10>, <&adc 11>, <&adc 12>;
> +	};
> +};
> +
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "bmc";
> +		spi-max-frequency = <100000000>; /* 100 MHz */
> +#include "openbmc-flash-layout.dtsi"
> +	};
> +};
> +
> +&uart5 {
> +	status = "okay";
> +};
> +
> +&vuart {
> +	status = "okay";
> +	aspeed,sirq-active-high;

This should probably go away, but otherwise,

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
