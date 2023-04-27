Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA2F6EFEA8
	for <lists+openbmc@lfdr.de>; Thu, 27 Apr 2023 02:51:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q6HHD0RXZz3cGH
	for <lists+openbmc@lfdr.de>; Thu, 27 Apr 2023 10:51:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=0QMB6Ga3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Q1VTiYoa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=0QMB6Ga3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Q1VTiYoa;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q6HGf3z4Vz3bgn
	for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2023 10:50:50 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 72D5B5C0004;
	Wed, 26 Apr 2023 20:44:57 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Wed, 26 Apr 2023 20:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1682556297; x=1682642697; bh=DS
	zdG/rPoIkWZ576mMbo5ibsRsdnoJJYpbKBBMwtvDA=; b=0QMB6Ga3xI6t1qrl+c
	Cb8xlGGEaFJN7BSnjSMAyUYcq050iOE0PxWSeqI5tI81KOM7kqeLqZqYXJ3JD+t2
	O27GgFfULzRqhNgm48WLsN0wyT0SN/m0nnJlaMSTJmOux7lStEB92ux9VLBS0Z6e
	kleSxnEha1/gq+A1B3tMqaYrKqcWJg1SYjC6bHVWZC5tan5wWSPwdvNB1HsFcxE9
	plbzzTc0CN1AmAWYeephXRTu298DGI0drDOncSVpDdnNuE87WQ3JmV7Ekdjam6ll
	ir7lS063ACiH3A3XvQywfF3S9G8Kzd+1P99Sci426kUpoSAzMF+mQ7Y1vqh9RnJt
	clew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1682556297; x=1682642697; bh=DSzdG/rPoIkWZ
	576mMbo5ibsRsdnoJJYpbKBBMwtvDA=; b=Q1VTiYoaAVtY/T04xVaSA+Y032yvq
	+wlAdSAOmDYK8JYufumen8c0IZKFwKG9INqZNAAK+DX1RHx1G2+KoVx7wmDXEiCz
	hbiiVKm1S+FJAumPbJGM/NxhDGVW+/Jc4PkPNt69BnuKg6eqYHfqNSOM5iiG7vhS
	JdNk9zWe0zq98db9hYrttPbjxFETZ21UnFXAvPzrb9Xw2bX/4Wcb8fpVYACbpXZp
	ceysVd55Dy0u58HVw4kchtBp+LQHNCpfx3ahnqAFPhLeBgX7PYovOB+E1B2b4M/l
	8oQhgFoLcSC/0nEhCSxBIpqlWdIK5onzO6zGFtZ9zPLtzS1Hi9yAO4KrA==
X-ME-Sender: <xms:iMVJZPOuCqj2qAUVDF1XXeY50Kun8GMgpQKxZBqDcA0nBD3z-JLmfg>
    <xme:iMVJZJ_rtG8fN-y3RITwCQmYT_Bt1wb9Gj_K2ZRvl6WNlsWosureUIY5fUO4D4kYP
    jtNQCLmP1AMfjZoYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduhedgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:iMVJZOSErSsNOyv750mtIUSi4Z5qMQhl8koKR77e8H4xnnlISI08Sw>
    <xmx:iMVJZDvZWf1udALvxo3iRP_ZVp3qAdG8fP7cOH0-mD7mjWqi__H1sg>
    <xmx:iMVJZHdEFEEv64faE12NHf40W0Vq52k0rJQ1wst1j-GqAojFWxaMEQ>
    <xmx:icVJZIH1MeV4niS46RKgPZM_X0aijBEpbWnIhJYiIlvUA4IkHUKIXQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 304A91700089; Wed, 26 Apr 2023 20:44:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-374-g72c94f7a42-fm-20230417.001-g72c94f7a
Mime-Version: 1.0
Message-Id: <6fdb36f8-6366-407d-bb4e-e43ac3e9e700@app.fastmail.com>
In-Reply-To: <20230320044851.3360-1-maxiaoyu_jn@163.com>
References: <20230320044851.3360-1-maxiaoyu_jn@163.com>
Date: Thu, 27 Apr 2023 10:14:35 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: maxiaoyu_jn@163.com, "Joel Stanley" <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH v1 1/1] ARM: dts: aspeed: Add Inspur NF5280M7 BMC machine
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
Cc: George Liu <liuxiwei@inspur.com>, maxiaoyu@inspur.com, banht@inspur.com, wangxinglong@inspur.com, guoping@inspur.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 20 Mar 2023, at 15:18, maxiaoyu_jn@163.com wrote:
> From: Xiaoyu Ma <maxiaoyu@inspur.com>
>
> the Inspur NF5280M7 is an x86 platform server with an AST2600-based BMC.
> This dts file provides a basic configuration for its OpenBMC
> development.
>
> Signed-off-by: Xiaoyu Ma <maxiaoyu@inspur.com>
> ---
> changelog:
> v1:
> -Add Inspur NF5280M7 BMC machine 
>
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-inspur-nf5280m7.dts   | 820 ++++++++++++++++++
>  2 files changed, 821 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m7.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 2ee9c043218b..4ada2cb1935e 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1604,6 +1604,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-intel-s2600wf.dtb \
>  	aspeed-bmc-inspur-fp5280g2.dtb \
>  	aspeed-bmc-inspur-nf5280m6.dtb \
> +	aspeed-bmc-inspur-nf5280m7.dtb \
>  	aspeed-bmc-lenovo-hr630.dtb \
>  	aspeed-bmc-lenovo-hr855xg2.dtb \
>  	aspeed-bmc-microsoft-olympus.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m7.dts 
> b/arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m7.dts
> new file mode 100644
> index 000000000000..65f25aef8bd5
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m7.dts
> @@ -0,0 +1,820 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2023 Inspur Corporation
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/leds/leds-pca955x.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +	model = "Inspur NF5280M7 BMC";
> +	compatible = "inspur, nf5280m7-bmc", "aspeed,ast2600";

Shouldn't have a space after the comma in the first compatible string.

> +
> +	aliases {
> +		i2c200 = &bus2_mux70_0;
> +		i2c500 = &bus5_mux00;
> +		i2c501 = &bus5_mux01;
> +		i2c600 = &i2c6s0ch0;
> +		i2c601 = &i2c6s0ch1;
> +		i2c602 = &i2c6s0ch2;
> +		i2c603 = &i2c6s0ch3;
> +		i2c604 = &i2c6s0ch4;
> +		i2c605 = &i2c6s0ch5;
> +		i2c606 = &i2c6s0ch6;
> +		i2c607 = &i2c6s0ch7;
> +		i2c610 = &i2c6s1ch0;
> +		i2c611 = &i2c6s1ch1;
> +		i2c612 = &i2c6s1ch2;
> +		i2c613 = &i2c6s1ch3;
> +		i2c614 = &i2c6s1ch4;
> +		i2c615 = &i2c6s1ch5;
> +		i2c616 = &i2c6s1ch6;
> +		i2c617 = &i2c6s1ch7;
> +		i2c620 = &i2c6s2ch0;
> +		i2c621 = &i2c6s2ch1;
> +		i2c622 = &i2c6s2ch2;
> +		i2c623 = &i2c6s2ch3;
> +		i2c624 = &i2c6s2ch4;
> +		i2c625 = &i2c6s2ch5;
> +		i2c626 = &i2c6s2ch6;
> +		i2c627 = &i2c6s2ch7;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "console=ttyS4,115200n8 earlycon";
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x80000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		video_engine_memory: jpegbuffer {
> +			size = <0x02000000>;	/* 32M */
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +
> +		vga_memory: frammebuffer {
> +			no-map;
> +			reg = <0x9ff00000 0x01000000>; /* 16M */
> +		};
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
> +			<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
> +			<&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
> +			<&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;

Have you requested these lines from pinctrl?

> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		cpld {
> +			label = "cpld";
> +			gpios = <&gpio0 ASPEED_GPIO(N, 2) GPIO_ACTIVE_HIGH>;
> +			linux,code = <ASPEED_GPIO(N, 2)>;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		fan-fault {
> +			label = "fan-fault";
> +			gpios = <&gpio0 ASPEED_GPIO(B, 0) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		system-hot {
> +			label = "system-hot";
> +			gpios = <&gpio0 ASPEED_GPIO(B, 1) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		psu-fault {
> +			label = "psu-fault";
> +			gpios = <&gpio0 ASPEED_GPIO(B, 2) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		heartbeat {
> +			label = "heartbeat";
> +			gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		memory-fault {
> +			label = "memory-fault";
> +			gpios = <&gpio0 ASPEED_GPIO(Y, 2) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		system-fault {
> +			label = "system-fault";
> +			gpios = <&gpio0 ASPEED_GPIO(Y, 3) GPIO_ACTIVE_LOW>;
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
> +#include "openbmc-flash-layout-64.dtsi"
> +	};
> +	flash@1 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "alt-bmc";
> +		spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout-64-alt.dtsi"
> +	};
> +};
> +
> +
> +&spi1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "bios";
> +		spi-max-frequency = <50000000>;
> +	};
> +};
> +
> +&peci0 {
> +	status = "okay";
> +	gpios = <&gpio0 ASPEED_GPIO(F, 6) 0>;
> +
> +	peci-client@30 {
> +		compatible = "intel,peci-client";
> +		reg = <0x30>;
> +	};
> +
> +	peci-client@31 {
> +		compatible = "intel,peci-client";
> +		reg = <0x31>;
> +	};
> +};
> +
> +&gpio0 {
> +	status = "okay";
> +	gpio-line-names =
> +	/*A0-A7*/	"","","","","","","","",
> +	/*B0-B7*/	"","","","","","","","",
> +	/*C0-C7*/	"","","","","","","","",
> +	/*D0-D7*/	"","","","","","","","",
> +	/*E0-E7*/	"","","","","","","","",
> +	/*F0-F7*/	"","","","","","","","",
> +	/*G0-G7*/	"","","","","","","","",
> +	/*H0-H7*/	"","","","","","","","",
> +	/*I0-I7*/	"","","","","","POWER_OUT","RESET_OUT","",
> +	/*J0-J7*/	"","","","","","","","",
> +	/*K0-K7*/	"","","","","","","","",
> +	/*L0-L7*/	"","","","","","","","",
> +	/*M0-M7*/	"","","","","","","","",
> +	/*N0-N7*/	"","","","","","","","",
> +	/*O0-O7*/	"","","","","","","","",
> +	/*P0-P7*/	"RESET_BUTTON","","","NMI_BUTTON","NMI_OUT","","","",
> +	/*Q0-Q7*/	"","","","","","","","",
> +	/*R0-R7*/	"","","","","","","","",
> +	/*S0-S7*/	"","","","SIO_ONCONTROL","","","","",
> +	/*T0-T7*/	"","","","","","","","",
> +	/*U0-U7*/	"","","","","","","","",
> +	/*V0-V7*/	"","SIO_S5","POWER_BUTTON","","PS_PWROK","","","",
> +	/*W0-W7*/	"","","","","","","","",
> +	/*X0-X7*/	"","","POST_COMPLETE","","","","","",
> +	/*Y0-Y7*/	"","","","","","","","",
> +	/*Z0-Z7*/	"","","","","","","","";
> +};
> +
> +&kcs3 {
> +	aspeed,lpc-io-reg = <0xCA2>;
> +	status = "okay";
> +};
> +
> +&kcs4 {
> +	aspeed,lpc-io-reg = <0xCA4>;
> +	status = "okay";
> +};
> +
> +&lpc_snoop {
> +	snoop-ports = <0x80>;
> +	status = "okay";
> +};
> +
> +&mdio1 {
> +	status = "okay";
> +
> +	ethphy1: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0>;
> +	};
> +};
> +
> +&mac2 {
> +	status = "okay";
> +
> +	phy-mode = "rgmii";
> +	phy-handle = <&ethphy1>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii3_default>;
> +};
> +
> +&mac3 {
> +	status = "okay";
> +
> +	phy-mode = "rmii";
> +	use-ncsi;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rmii4_default>;
> +};
> +
> +&adc0 {
> +	status = "okay";
> +};
> +
> +&adc1 {
> +	status = "okay";
> +};

Need to request the ADC lines from pinmux to ensure that something else in the system doesn't take control of them.

> +
> +&uart1 {
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
> +&uart5 {
> +	status = "okay";
> +};
> +
> +&vuart1 {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	multi-master;
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	multi-master;
> +	status = "okay";
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c256";
> +		reg = <0x50>;
> +	};
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +	pca9546@70{
> +		compatible = "nxp,pca9546";
> +		reg = <0x70>;
> +		bus2_mux70_0: i2c@2{
> +			reg = <0>;
> +			tmp112@49{
> +				compatible = "ti,tmp112";
> +				reg = <0x49>;
> +				label = "Inlet_Temp";
> +			};
> +			emc1413@4c{
> +				compatible = "microchip,emc1413";
> +				reg = <0x4c>;
> +				label = "Outlet_Temp";
> +			};
> +		};
> +	};
> +};
> +
> +&i2c4 {
> +	multi-master;
> +	status = "okay";
> +	ipmb0@10 {
> +		compatible = "ipmb-dev";
> +		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +		i2c-protocol;
> +	};
> +};
> +
> +&i2c5 {
> +	bus-frequency = <1000000>;
> +	multi-master;
> +	status = "okay";
> +	pca9546@70{
> +		compatible = "nxp,pca9546";
> +		reg = <0x70>;
> +		bus5_mux00: i2c@0 {
> +			reg = <0>;
> +			status = "okay";
> +			vrmp2888@76 {
> +				compatible = "mps,mp2888";
> +				reg = <0x76>;
> +			};
> +			vrmp2888@72 {
> +				compatible = "mps,mp2888";
> +				reg = <0x72>;
> +			};
> +			vrmp2888@62{
> +				compatible = "mps,mp2888";
> +				reg = <0x62>;
> +			};
> +		};
> +		bus5_mux01: i2c@1{
> +			reg = <1>;
> +			status = "okay";
> +			vrmp2888@76{
> +				compatible = "mps,mp2888";
> +				reg = <0x76>;
> +			};
> +			vrmp2888@72 {
> +				compatible = "mps,mp2888";
> +				reg = <0x72>;
> +			};
> +			vrmp2888@62{
> +				compatible = "mps,mp2888";
> +				reg = <0x62>;
> +			};
> +		};
> +		bus5_mux02: i2c@2{
> +			reg = <2>;
> +		};
> +		bus5_mux03: i2c@3{
> +			reg = <3>;
> +		};
> +	};
> +};
> +
> +&i2c6 {
> +	multi-master;
> +	status = "okay";
> +
> +	i2c-switch@70 {
> +		compatible = "nxp,pca9548";
> +		reg = <0x70>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		i2c6s0ch0: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +
> +			eeprom@50 {
> +				compatible = "atmel,24c256";
> +				reg = <0x50>;
> +			};
> +			pca9548@71 {
> +				compatible = "nxp,pca9548";
> +				reg = <0x71>;
> +				i2c-mux-idle-disconnect;
> +
> +				i2c6s1ch0: i2c@0 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0>;
> +				};
> +				i2c6s1ch1: i2c@1 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <1>;
> +				};
> +				i2c6s1ch2: i2c@2 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <2>;
> +				};
> +				i2c6s1ch3: i2c@3 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <3>;
> +				};
> +				i2c6s1ch4: i2c@4 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <4>;
> +				};
> +				i2c6s1ch5: i2c@5 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <5>;
> +				};
> +				i2c6s1ch6: i2c@6 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <6>;
> +				};
> +				i2c6s1ch7: i2c@7 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <7>;
> +				};
> +			};
> +
> +			pca9548@72 {
> +				compatible = "nxp,pca9548";
> +				reg = <0x72>;
> +				i2c-mux-idle-disconnect;
> +
> +				i2c6s2ch0: i2c@0 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0>;
> +				};
> +				i2c6s2ch1: i2c@1 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <1>;
> +				};
> +				i2c6s2ch2: i2c@2 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <2>;
> +				};
> +				i2c6s2ch3: i2c@3 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <3>;
> +				};
> +				i2c6s2ch4: i2c@4 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <4>;
> +				};
> +				i2c6s2ch5: i2c@5 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <5>;
> +				};
> +				i2c6s2ch6: i2c@6 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <6>;
> +				};
> +				i2c6s2ch7: i2c@7 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <7>;
> +				};
> +			};
> +		};
> +		i2c6s0ch1: i2c@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +
> +			eeprom@50 {
> +				compatible = "atmel,24c256";
> +				reg = <0x50>;
> +			};
> +		};
> +		i2c6s0ch2: i2c@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +
> +			eeprom@50 {
> +				compatible = "atmel,24c256";
> +				reg = <0x50>;
> +			};
> +		};
> +		i2c6s0ch3: i2c@3 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <3>;
> +
> +			eeprom@50 {
> +				compatible = "atmel,24c256";
> +				reg = <0x50>;
> +			};
> +		};
> +		i2c6s0ch4: i2c@4 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <4>;
> +
> +			eeprom@50 {
> +				compatible = "atmel,24c256";
> +				reg = <0x50>;
> +			};
> +		};
> +		i2c6s0ch5: i2c@5 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <5>;
> +
> +			eeprom@50 {
> +				compatible = "atmel,24c256";
> +				reg = <0x50>;
> +			};
> +		};
> +		i2c6s0ch6: i2c@6 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <6>;
> +
> +			eeprom@50 {
> +				compatible = "atmel,24c256";
> +				reg = <0x50>;
> +			};
> +		};
> +		i2c6s0ch7: i2c@7 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <7>;
> +
> +			eeprom@50 {
> +				compatible = "atmel,24c256";
> +				reg = <0x50>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c7 {
> +	multi-master;
> +	#retries = <3>;
> +	status = "okay";
> +
> +	adc128d818@1d {
> +		compatible = "ti,adc128d818";
> +		reg = <0x1d>;
> +		ti,mode = /bits/ 8 <0x01>;
> +	};
> +	adc128d818@1e {
> +		compatible = "ti,adc128d818";
> +		reg = <0x1e>;
> +		ti,mode = /bits/ 8 <0x01>;
> +	};
> +	adc128d818@2d {
> +		compatible = "g";
> +		reg = <0x2d>;
> +		ti,mode = /bits/ 8 <0x01>;
> +	};
> +	ina226@45 {
> +		compatible = "ti,ina226";
> +		reg = <0x45>;
> +		shunt-resistor = <500>;
> +	};
> +};
> +
> +&i2c8 {
> +	multi-master;
> +	status = "okay";
> +};
> +
> +&i2c9 {
> +	multi-master;
> +	status = "okay";
> +};
> +
> +&i2c10 {
> +	status = "okay";
> +
> +	pca0: pca9555@21 {
> +		compatible = "nxp,pca9555";
> +		reg = <0x21>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		gpio-line-names =
> +			"", "", "", "",
> +			"", "",
> +			"FAN_PRSNT8_D_N", "FAN_PRSNT9_D_N",
> +			"", "",	"", "",
> +			"", "",	"", "";
> +
> +		gpio@0 {
> +			reg = <0>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@1 {
> +			reg = <1>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@2 {
> +			reg = <2>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@3 {
> +			reg = <3>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@4 {
> +			reg = <4>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@5 {
> +			reg = <5>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@6 {
> +			reg = <6>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@7 {
> +			reg = <7>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@8 {
> +			reg = <8>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@9 {
> +			reg = <9>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@10 {
> +			reg = <10>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@11 {
> +			reg = <11>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@12 {
> +			reg = <12>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@13 {
> +			reg = <13>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@14 {
> +			reg = <14>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@15 {
> +			reg = <15>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};

As of ca386253ff6f ("leds: pca955x: Make the gpiochip always expose all pins") specifying `type = <PCA955X_TYPE_GPIO>;` is unnecessary and the child nodes can probably be removed.

> +	};
> +
> +	pca1: pca9555@22 {
> +		compatible = "nxp,pca9555";
> +		reg = <0x22>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		gpio-line-names = "FAN_PRSNT0_D_N", "FAN_PRSNT1_D_N",
> +			"FAN_PRSNT2_D_N", "FAN_PRSNT3_D_N",
> +			"FAN_PRSNT4_D_N", "FAN_PRSNT5_D_N",
> +			"FAN_PRSNT6_D_N", "FAN_PRSNT7_D_N",
> +			"", "",	"", "",
> +			"", "",	"", "";
> +
> +		gpio@0 {
> +			reg = <0>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@1 {
> +			reg = <1>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@2 {
> +			reg = <2>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@3 {
> +			reg = <3>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@4 {
> +			reg = <4>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@5 {
> +			reg = <5>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@6 {
> +			reg = <6>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@7 {
> +			reg = <7>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@8 {
> +			reg = <8>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@9 {
> +			reg = <9>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@10 {
> +			reg = <10>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@11 {
> +			reg = <11>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@12 {
> +			reg = <12>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@13 {
> +			reg = <13>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@14 {
> +			reg = <14>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@15 {
> +			reg = <15>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};

See comment above about type assignments and removing the child nodes.

Andrew
