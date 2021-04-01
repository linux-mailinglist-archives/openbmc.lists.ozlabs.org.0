Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B236350B26
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 02:32:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9kfG2P7Pz2xxg
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 11:32:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=e06YipHJ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=mAh2TJcQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=e06YipHJ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=mAh2TJcQ; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9kf15Gv6z2y8D
 for <openbmc@lists.ozlabs.org>; Thu,  1 Apr 2021 11:32:09 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 612E15C00AD;
 Wed, 31 Mar 2021 20:32:06 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 31 Mar 2021 20:32:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=ByGf1GDHvTNrTLtGGExwMxIv08mJfmz
 cOdgtTQ8WQBA=; b=e06YipHJKfL2pwi2smEjpRhNY5vf1fxmSY+UwNOoNVNzkI+
 KCX1MiXWfWtMyiX0c4C5Gt/AwT8xAy0Yk901RdAlru3i0uC1vXjJ/8GYrpv49kGX
 V3/bzzGDJOY6xtqAOcUznJbGBNZBkK5Bs6MhxCDl1c5DcFInNMR2bkbfirRLnYCr
 2qz1w95UTvNxItua4a5mZflQNkl6VlMkfDtQ2oBLdSmE6cBXwzprCHo2GRARiZS1
 P3UqWVW7Q9MGDZDBTv9WqUmsDUHI9/sWRe/DJgIyr8FIGmhHRIzq/e4OdoYgxIvH
 8a3W+sUx2zWFTuMvCBLJTGq7C7DBhtTk2cN0iCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ByGf1G
 DHvTNrTLtGGExwMxIv08mJfmzcOdgtTQ8WQBA=; b=mAh2TJcQ3o0sQbsKKUg0Vi
 MkBVt2J6sa2jHmkDI0N7yJupqsUSqz8wMcjFcARZu+tuIqX/wsvbhDY+6hEcTKW5
 aLLo/o+8wXLN/6Z/PN3NsnyCu2VnXrtUTndNO+kh//24LEE9NFEhbbGpODf+NqbA
 DUVq5/nxd/8lQ6EsB6pmr8Xq027dhj4/PcVEkYsRkrqVO45/8M7AS+9sJOoPBAjP
 j1I7rdQYCB4Gox+HXXxjFzYMS3asBC7knoYjqRLJ92w3+NqbCLHf/hg30Il0AdAn
 dVx1U/nUhVXnnY3k4kmurvmSBrUWOT9YLi/6XyOxAGDMIc122+YT7SfZJOZzhp4A
 ==
X-ME-Sender: <xms:hBRlYBkijUZbseKQXpk31IxvZhcjl-BaHs5TFoc6_Y2q4kqyU3SWNg>
 <xme:hBRlYM0WvDtUs_UMWVX-7DvKSy1f78jcSa_d6a7vzoz_0qtDFjQW0wj1yDt1NwFDt
 C1qIgeds6afOBD2VQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeifedgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:hBRlYHo77i3OXjimrJcTgF0Lgc1RQSA8C_AduLIPi1k8h-0Uzw-osg>
 <xmx:hBRlYBlbOn0QPSygwoJ4QDUlgzZhpKVewhtoYyyixUYNJqt-RRgy_g>
 <xmx:hBRlYP0DAaWEVJ6sMdEk8B18jImA5Yh15qfAAWP2Uo4Ccxi-P9vmHg>
 <xmx:hhRlYI9QDjD7cnRuz82Jd88VlRULJmAg4epaz1NUo4sJVGqLLa7lDg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D8B2FA00073; Wed, 31 Mar 2021 20:32:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <fa9f706e-1b6b-4830-bdad-8497b9d61aca@www.fastmail.com>
In-Reply-To: <1613718670-24417-1-git-send-email-willie_thai@compal.com>
References: <CACPK8XfNrYFNy0KHjxa=nM01LV7PMnVC5U7_Wuudf_xk3tQ2iw@mail.gmail.com>
 <1613718670-24417-1-git-send-email-willie_thai@compal.com>
Date: Thu, 01 Apr 2021 11:01:43 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Willie Thai" <williethaitu@gmail.com>, "Joel Stanley" <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[[PATCH_linux_dev-5.8]_ARM:_dts:_Aspeed:_Add_Compal's_Liwu?=
 =?UTF-8?Q?2_BMC_machine]__ARM:_dts:_aspeed:_Add_device_tree_for_Compal'?=
 =?UTF-8?Q?s_Liwu2_BMC?=
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
Cc: Willie Thai <willie_thai@compal.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 19 Feb 2021, at 17:41, Willie Thai wrote:
> The Liwu2 is a server platform with an ASPEED AST2500 based BMC.
> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

I don't recall providing my r-b tag.

I have comments below.

> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: willie_thai@compal.com
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts | 325 ++++++++++++++++++++++++++
>  2 files changed, 326 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 6320124..a67576d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1354,6 +1354,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-arm-centriq2400-rep.dtb \
>  	aspeed-bmc-arm-stardragon4800-rep2.dtb \
>  	aspeed-bmc-bytedance-g220a.dtb \
> +	aspeed-bmc-compal-liwu2.dtb \
>  	aspeed-bmc-facebook-cmm.dtb \
>  	aspeed-bmc-facebook-minipack.dtb \
>  	aspeed-bmc-facebook-tiogapass.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts 
> b/arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts
> new file mode 100644
> index 0000000..68faf3d
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts
> @@ -0,0 +1,325 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model = "AST2500 liwu2";
> +	compatible = "aspeed,ast2500";
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
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		gfx_memory: framebuffer {
> +			size = <0x01000000>;
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +				<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> +				<&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> +				<&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led_fan0_fault {
> +			label = "LED_FAN0_FAULT";
> +			gpios = <&gpio ASPEED_GPIO(F, 4) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led_fan1_fault {
> +			label = "LED_FAN1_FAULT";
> +			gpios = <&gpio ASPEED_GPIO(F, 5) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led_fan2_fault {
> +			label = "LED_FAN2_FAULT";
> +			gpios = <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led_fan3_fault {
> +			label = "LED_FAN3_FAULT";
> +			gpios = <&gpio ASPEED_GPIO(H, 5) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led_fan4_fault {
> +			label = "LED_FAN4_FAULT";
> +			gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led_fan5_fault {
> +			label = "LED_FAN5_FAULT";
> +			gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		fp_led_status_amber_n {
> +			label = "FP_LED_STATUS_AMBER_N";
> +			gpios = <&gpio ASPEED_GPIO(S, 5) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		rear_id_led_n {
> +			label = "REAR_ID_LED_N";
> +			gpios = <&gpio ASPEED_GPIO(S, 6) GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> +
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "bmc";
> +		spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout.dtsi"
> +	};
> +};
> +
> +&spi1 {
> +	status = "okay";

Should have at least:

pinctrl-names = "default";
pinctrl-0 = <&pinctrl_spi1_default>;

And then if you need additional chip selects, you should add them too.

> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "pnor";
> +		spi-max-frequency = <100000000>;
> +	};
> +};
> +
> +&spi2 {
> +	status = "okay";

Is this necessary given no flash device is defined?

If it is, you also need pinctrl properties.

> +};
> +
> +&uart5 {
> +	status = "okay";
> +};
> +
> +&mac0 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
> +};
> +
> +&mac1 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +};
> +
> +&adc {
> +	status = "okay";

Given you're using the ADC lines in the iio-hwmon bridge, you need to 
request the ADC pins from pinmux here. ADC is the default mux 
configuration for the pins, so this will happen to work as is, but 
pinmux will not prevent something else from requesting the pins out 
from underneath the ADC.

Andrew
