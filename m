Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5031857C20D
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 04:03:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpG7M4tyZz3bqx
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 12:03:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=IHcKb6VM;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=nZmgCo0o;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=IHcKb6VM;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=nZmgCo0o;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpG6r5Cmzz2xkG
	for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2022 12:02:43 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 338575C00A9;
	Wed, 20 Jul 2022 22:02:39 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Wed, 20 Jul 2022 22:02:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1658368959; x=1658455359; bh=r3+JDGTNJO
	gzSGE4CA0LUBJwMoqknUY8ZAPkLJyv/aI=; b=IHcKb6VM/FHUK/ZiL6aLfp1ZgK
	+1IWdRC8tVYa8/zTnalp6tsYI43GMzdcv71wOKc19LfwLbMyPh/NdyCs2JcnJV9Q
	87or2BWcsQp8gPq/Q8jG7dd6aytWRmqCw9FVx1ujT407bEJpu+YsmPPD/HI20P7+
	cIzrcHASAv08P3JSLUGblaME2Y2EsON8ZHdd9BSxZ5mXH6Ze4odk2LpDSfCpJet+
	ZAaDeK4h6QXSpDCfgLdmOf9LQ92Pm6yuG3snjq2txbD/9kl4r83I/Y1ihHDUH5A2
	jZDZjC+FdebQuMoR/mW27GCTNXA0koYYP477DVth7kIJBRvNpLnO/3wPx8OA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658368959; x=1658455359; bh=r3+JDGTNJOgzSGE4CA0LUBJwMoqk
	nUY8ZAPkLJyv/aI=; b=nZmgCo0oCvdVGK65dppsqi3/cNei8EibmbZqC8sn/5YP
	oqZD0ivETcqziuQyb1SE8UstptkErnPvtdIKcDsQZibIEIB2jHoyQvU2PU8Z66oe
	JGP7xHTLmf+Iyo7TRuO74hYXF3V/qJlIOah7D6o3Ci6FrMnQlPLPqdO8kw4rMDOy
	xpyuDQyId2+pVSpL/j0G/EWYeICZPj03vABcpTQyY2r6V7QLQPBKKqIfjjS2bAch
	c7AR0eYPrFKESeaUDHDvnAerkBRRqRXj2h/lZLeXOAvAoBRoHrDB94V1FwUjVblB
	arCSnhTyS0TKM+OW5BNSYwERyhHDhP4ZUY1SKrIlwg==
X-ME-Sender: <xms:vrPYYv3ExOWdzJH9hGEbfmQfWbKbORZ8Ix6d-mdh5VC034xJY_0QAA>
    <xme:vrPYYuFJ9eQGz_rE3dKJk2S6allYbN3a5QEhMgdiTbUw2fyB90R-NGoQvDZ63cEPV
    AmFjRVWtQ98tADGzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelfedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeeuuddugfdtfeekffffudffgedvffetjeeiieefteevteejiedtteek
    ffeiieekvdenucffohhmrghinhepohhpvghnsghmtgdrohhrghdpkhgvrhhnvghlrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghn
    ughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:vrPYYv7ynA2scC_DjNr2grqtCWR6EYSOBbs6ItPo3cmuwyqgM2eeAw>
    <xmx:vrPYYk0WL1lBHkB9-avDokMlUhnhyKVxnSSo3fWNuMXz3M429yKbrw>
    <xmx:vrPYYiFxVdhx_R7_KE_esJBgSVGq9IRYONk-Vl5NrAfQrJzJ_4TZ7w>
    <xmx:v7PYYpetxx6-dHhk3F8AUfYvaXMcJQ3UUvNSBrEbk_cKcngPM2H2OQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7B77C170007E; Wed, 20 Jul 2022 22:02:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-755-g3e1da8b93f-fm-20220708.002-g3e1da8b9
Mime-Version: 1.0
Message-Id: <5848e2d7-33e1-4093-b70f-b52ef9068083@www.fastmail.com>
In-Reply-To: <20220720085230.3801945-3-quan@os.amperecomputing.com>
References: <20220720085230.3801945-1-quan@os.amperecomputing.com>
 <20220720085230.3801945-3-quan@os.amperecomputing.com>
Date: Thu, 21 Jul 2022 11:32:18 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Quan Nguyen" <quan@os.amperecomputing.com>, openbmc@lists.ozlabs.org,
 "Arnd Bergmann" <arnd@arndb.de>, "Olof Johansson" <olof@lixom.net>,
 soc@kernel.org, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Joel Stanley" <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,
 "Open Source Submission" <patches@amperecomputing.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt. Mitchell
 BMC
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
Cc: "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On Wed, 20 Jul 2022, at 18:22, Quan Nguyen wrote:
> The Mt. Mitchell BMC is an ASPEED AST2600-based BMC for the Mt. Mitchell
> hardware reference platform with AmpereOne(TM) processor.
>
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
> Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
> ---
> v2 :
>   + Remove bootargs                                       [Krzysztof]
>   + Fix gpio-keys nodes name to conform with device tree binding
>   documents                                               [Krzysztof]
>   + Fix some nodes to use generic name                    [Krzysztof]
>   + Remove unnecessary blank line                         [Krzysztof]
>   + Fix typo "LTC" to "LLC" in license info and corrected license
>   info to GPL-2.0-only
>
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 577 ++++++++++++++++++
>  2 files changed, 578 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index f9484f5ef126..ecb9dafb8f1a 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1573,6 +1573,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-ast2600-evb.dtb \
>  	aspeed-bmc-amd-ethanolx.dtb \
>  	aspeed-bmc-ampere-mtjade.dtb \
> +	aspeed-bmc-ampere-mtmitchell.dtb \
>  	aspeed-bmc-arm-centriq2400-rep.dtb \
>  	aspeed-bmc-arm-stardragon4800-rep2.dtb \
>  	aspeed-bmc-asrock-e3c246d4i.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts 
> b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> new file mode 100644
> index 000000000000..2e68f5264bb1
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
> @@ -0,0 +1,577 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2022, Ampere Computing LLC
> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model = "Ampere Mt.Mitchell BMC";
> +	compatible = "ampere,mtmitchell-bmc", "aspeed,ast2600";
> +
> +	chosen {
> +		stdout-path = &uart5;
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x80000000>;

This is 2GB of memory

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
> +
> +		video_engine_memory: video {
> +			size = <0x04000000>;
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +
> +		/* 1GB memory */

But you say 1GB of memory here

> +		vga_memory: region@bf000000 {
> +			no-map;
> +			compatible = "shared-dma-pool";
> +			reg = <0xbf000000 0x01000000>;  /* 16M */

And this makes sense for 1GB.

So I think your memory node has the wrong length in reg?

> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		s0-overtemp-event {
> +			label = "S0_OVERTEMP";
> +			gpios = <&gpio0 ASPEED_GPIO(V, 7) GPIO_ACTIVE_LOW>;
> +			linux,code = <ASPEED_GPIO(V, 7)>;
> +		};
> +
> +		s0-hightemp-event {
> +			label = "S0_HIGHTEMP";
> +			gpios = <&gpio0 ASPEED_GPIO(V, 0) GPIO_ACTIVE_LOW>;
> +			linux,code = <ASPEED_GPIO(V, 0)>;
> +		};
> +
> +		s1-overtemp-event {
> +			label = "S1_OVERTEMP";
> +			gpios = <&gpio0 ASPEED_GPIO(X, 6) GPIO_ACTIVE_LOW>;
> +			linux,code = <ASPEED_GPIO(X, 6)>;
> +		};
> +
> +		s1-hightemp-event {
> +			label = "S1_HIGHTEMP";
> +			gpios = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_LOW>;
> +			linux,code = <ASPEED_GPIO(X, 3)>;
> +		};
> +	};

I really want us to stop using GPIO keys and just poll the GPIO in userspace if necessary.

The discussion here might help, eventually:

https://gerrit.openbmc.org/c/openbmc/dbus-sensors/+/54740

> +
> +	voltage_mon_reg: voltage-mon-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "ltc2497_reg";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	gpioI5mux: mux-controller {
> +		compatible = "gpio-mux";
> +		#mux-control-cells = <0>;
> +		mux-gpios = <&gpio0 ASPEED_GPIO(I, 5) GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	adc0mux: adc0mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc0 0>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc1mux: adc1mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc0 1>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc2mux: adc2mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc0 2>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc3mux: adc3mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc0 3>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc4mux: adc4mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc0 4>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc5mux: adc5mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc0 5>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc6mux: adc6mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc0 6>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc7mux: adc7mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc0 7>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc8mux: adc8mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc1 0>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc9mux: adc9mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc1 1>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc10mux: adc10mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc1 2>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc11mux: adc11mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc1 3>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc12mux: adc12mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc1 4>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc13mux: adc13mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc1 5>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc14mux: adc14mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc1 6>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	adc15mux: adc15mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc1 7>;
> +		#io-channel-cells = <1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&gpioI5mux>;
> +		channels = "s0", "s1";
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc0mux 0>, <&adc0mux 1>,
> +			<&adc1mux 0>, <&adc1mux 1>,
> +			<&adc2mux 0>, <&adc2mux 1>,
> +			<&adc3mux 0>, <&adc3mux 1>,
> +			<&adc4mux 0>, <&adc4mux 1>,
> +			<&adc5mux 0>, <&adc5mux 1>,
> +			<&adc6mux 0>, <&adc6mux 1>,
> +			<&adc7mux 0>, <&adc7mux 1>,
> +			<&adc8mux 0>, <&adc8mux 1>,
> +			<&adc9mux 0>, <&adc9mux 1>,
> +			<&adc10mux 0>, <&adc10mux 1>,
> +			<&adc11mux 0>, <&adc11mux 1>,
> +			<&adc12mux 0>, <&adc12mux 1>,
> +			<&adc13mux 0>, <&adc13mux 1>,
> +			<&adc14mux 0>, <&adc14mux 1>,
> +			<&adc15mux 0>, <&adc15mux 1>,
> +			<&adc_i2c 0>, <&adc_i2c 1>,
> +			<&adc_i2c 2>, <&adc_i2c 3>,
> +			<&adc_i2c 4>, <&adc_i2c 5>,
> +			<&adc_i2c 6>, <&adc_i2c 7>,
> +			<&adc_i2c 8>, <&adc_i2c 9>,
> +			<&adc_i2c 10>, <&adc_i2c 11>,
> +			<&adc_i2c 12>, <&adc_i2c 13>,
> +			<&adc_i2c 14>, <&adc_i2c 15>;
> +	};
> +};
> +
> +&mdio0 {
> +	status = "okay";
> +
> +	ethphy0: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0>;
> +	};
> +};
> +
> +&mac0 {
> +	status = "okay";
> +
> +	phy-mode = "rgmii";
> +	phy-handle = <&ethphy0>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +};
> +
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "bmc";
> +		spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout-64.dtsi"
> +	};
> +
> +	flash@1 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "alt-bmc";
> +		spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout-64-alt.dtsi"
> +	};
> +};
> +
> +&spi1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "pnor";
> +		spi-max-frequency = <20000000>;
> +	};
> +};
> +
> +&uart1 {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	temperature-sensor@2e {
> +		compatible = "adi,adt7490";
> +		reg = <0x2e>;
> +	};
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +
> +	psu@58 {
> +		compatible = "pmbus";
> +		reg = <0x58>;
> +	};
> +
> +	psu@59 {
> +		compatible = "pmbus";
> +		reg = <0x59>;
> +	};
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +
> +	adc_i2c: adc-i2c@16 {
> +		compatible = "lltc,ltc2497";
> +		reg = <0x16>;
> +		vref-supply = <&voltage_mon_reg>;
> +		#io-channel-cells = <1>;
> +		status = "okay";
> +	 };
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c64";
> +		reg = <0x50>;
> +		pagesize = <32>;
> +	};
> +
> +	i2c-mux@70 {
> +		compatible = "nxp,pca9545";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x70>;
> +		i2c-mux-idle-disconnect;
> +
> +		i2c4_bus70_chn0: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x0>;
> +
> +			outlet_temp1: temperature-sensor@48 {
> +				compatible = "ti,tmp75";
> +				reg = <0x48>;
> +			};
> +			psu1_inlet_temp2: temperature-sensor@49 {
> +				compatible = "ti,tmp75";
> +				reg = <0x49>;
> +			};
> +		};
> +
> +		i2c4_bus70_chn1: i2c@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x1>;
> +
> +			pcie_zone_temp1: temperature-sensor@48 {
> +				compatible = "ti,tmp75";
> +				reg = <0x48>;
> +			};
> +			psu0_inlet_temp2: temperature-sensor@49 {
> +				compatible = "ti,tmp75";
> +				reg = <0x49>;
> +			};
> +		};
> +
> +		i2c4_bus70_chn2: i2c@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x2>;
> +
> +			pcie_zone_temp2: temperature-sensor@48 {
> +				compatible = "ti,tmp75";
> +				reg = <0x48>;
> +			};
> +			outlet_temp2: temperature-sensor@49 {
> +				compatible = "ti,tmp75";
> +				reg = <0x49>;
> +			};
> +		};
> +
> +		i2c4_bus70_chn3: i2c@3 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x3>;
> +
> +			mb_inlet_temp1: temperature-sensor@7c {
> +				compatible = "microchip,emc1413";
> +				reg = <0x7c>;
> +			};
> +			mb_inlet_temp2: temperature-sensor@4c {
> +				compatible = "microchip,emc1413";
> +				reg = <0x4c>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +
> +	i2c-mux@70 {
> +		compatible = "nxp,pca9548";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x70>;
> +		i2c-mux-idle-disconnect;
> +	};
> +};
> +
> +&i2c6 {
> +	status = "okay";
> +	rtc@51 {
> +		compatible = "nxp,pcf85063a";
> +		reg = <0x51>;
> +	};
> +};
> +
> +&i2c7 {
> +	status = "okay";
> +};
> +
> +&i2c9 {
> +	status = "okay";
> +};
> +
> +&i2c11 {
> +	status = "okay";
> +};
> +
> +&i2c14 {
> +	status = "okay";
> +	eeprom@50 {
> +		compatible = "atmel,24c64";
> +		reg = <0x50>;
> +		pagesize = <32>;
> +	};
> +
> +	bmc_ast2600_cpu: temperature-sensor@35 {
> +		compatible = "ti,tmp175";
> +		reg = <0x35>;
> +	};
> +};
> +
> +&adc0 {
> +	ref_voltage = <2500>;
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
> +		&pinctrl_adc2_default &pinctrl_adc3_default
> +		&pinctrl_adc4_default &pinctrl_adc5_default
> +		&pinctrl_adc6_default &pinctrl_adc7_default>;
> +};
> +
> +&adc1 {
> +	ref_voltage = <2500>;
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
> +		&pinctrl_adc10_default &pinctrl_adc11_default
> +		&pinctrl_adc12_default &pinctrl_adc13_default
> +		&pinctrl_adc14_default &pinctrl_adc15_default>;
> +};
> +
> +&vhub {
> +	status = "okay";
> +};
> +
> +&video {
> +	status = "okay";
> +	memory-region = <&video_engine_memory>;
> +};
> +
> +&gpio0 {
> +	gpio-line-names =
> +	/*A0-A7*/	"","","","","","i2c2-reset-n","i2c6-reset-n","i2c4-reset-n",
> +	/*B0-B7*/	"","","","","host0-sysreset-n","host0-pmin-n","","",
> +	/*C0-C7*/	"s0-vrd-fault-n","s1-vrd-fault-n","bmc-debug-mode","",

Mildly interested in the functionality of "bmc-debug-mode" :)

> +			"irq-n","","vrd-sel","spd-sel",
> +	/*D0-D7*/	"presence-ps0","presence-ps1","hsc-12vmain-alt2-n","ext-high-temp-n",
> +			"","bmc-ncsi-txen","","",

Is "bmc-ncsi-txen" something that should be associated with the MAC?

> +	/*E0-E7*/	"eth-phy-rst-n","eth-phy-int-n","clk50m-bmc-ncsi","","","","","",

Same question for eth-phy-rst-n and eth-phy-int-n.

> +	/*F0-F7*/	"s0-pcp-oc-warn-n","s1-pcp-oc-warn-n","power-chassis-control",
> +			"cpu-bios-recover","cpld-done","hs-scout-proc-hot",
> +			"s0-vr-hot-n","s1-vr-hot-n",
> +	/*G0-G7*/	"","","hsc-12vmain-alt1-n","bmc-salt12-s0-ssif-n","","","","",
> +	/*H0-H7*/	"","fpga-program-b","wd-disable-n","power-chassis-good","","","","",
> +	/*I0-I7*/	"","","","","","adc-sw","power-button","rtc-battery-voltage-read-enable",
> +	/*J0-J7*/	"","","","","","","","",
> +	/*K0-K7*/	"","","","","","","","",
> +	/*L0-L7*/	"","","","","","","","",
> +	/*M0-M7*/	"bmc-uart-cts1","s0-ddr-save","soc-spi-nor-access","presence-cpu0",
> +			"s0-rtc-lock","","","",

Why isn't "bmc-uart-cts1" muxed into the associated UART? Why is it a GPIO?

> +	/*N0-N7*/	"hpm-fw-recovery","hpm-stby-rst-n","jtag-sel-s0","led-sw-hb",
> +			"jtag-dbgr-prsnt-n","","","",
> +	/*O0-O7*/	"","","","","","","","",
> +	/*P0-P7*/	"ps0-ac-loss-n","ps1-ac-loss-n","","",
> +			"led-fault","cpld-user-mode","jtag-srst-n","led-bmc-hb",
> +	/*Q0-Q7*/	"","","","","","","","",
> +	/*R0-R7*/	"","","","","","","","",
> +	/*S0-S7*/	"","","identify-button","led-identify",
> +			"s1-ddr-save","spi-nor-access","sys-pgood","presence-cpu1",
> +	/*T0-T7*/	"","","","","","","","",
> +	/*U0-U7*/	"","","","","","","","",
> +	/*V0-V7*/	"s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n",
> +			"host0-reboot-ack-n","host0-ready","host0-shd-req-n",
> +			"host0-shd-ack-n","s0-overtemp-n",
> +	/*W0-W7*/	"ocp-aux-pwren","ocp-main-pwren","ocp-pgood","",
> +			"bmc-ok","bmc-ready","spi0-program-sel","spi0-backup-sel",
> +	/*X0-X7*/	"i2c-backup-sel","s1-fault-alert","s1-fw-boot-ok",
> +			"s1-hightemp-n","s0-spi-auth-fail-n","s1-sys-auth-failure-n",
> +			"s1-overtemp-n","cpld-s1-spi-auth-fail-n",
> +	/*Y0-Y7*/	"","","","","","","bmc-spi-fm-boot-abr-pd","host0-special-boot",
> +	/*Z0-Z7*/	"reset-button","ps0-pgood","ps1-pgood","","","","","";
> +};
> +
> +&gpio1 {
> +	gpio-line-names =
> +	/*18A0-18A7*/	"","","","","","","","",
> +	/*18B0-18B7*/	"","","","","emmc-rst-n","","s0-soc-pgood","",

"emmc-rst-n" should be specified as part of mmc-pwrseq-emmc, right?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml?h=v5.19-rc7

Cheers,

Andrew
