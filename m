Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A07201C0BD
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2019 04:54:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4532NC1fmBzDqJ2
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2019 12:54:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Gk0EKSUc"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="FVaiI8Dt"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4532MF5qZczDq6y
 for <openbmc@lists.ozlabs.org>; Tue, 14 May 2019 12:54:01 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 23B4D24089;
 Mon, 13 May 2019 22:53:58 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 13 May 2019 22:53:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=ZpLkM5jKVBPkJfMYc8S7iuXpOLb/u51
 b2Eh/4ZjgziY=; b=Gk0EKSUcAgA0vfSu4knbIM9AxLS0eENLnhrxyw9B9qP5tQ9
 tCP0LLXnN24EBDFkD6cfTIZCREGBA+JTmnqjFOsu/MWxfLoBUZwy7DsME6aAFTdb
 JwA/jZtvlnxC/6mPGmZp4zjnGma+JoKgIzeQbCWbDw1l8VpWz1osdbUeZaKq8pjw
 0As3TiP4W4iYWDUANNBHHqEtu38IEJ0krmiwjyF7aMVMeW3aJtN9hrP+Q4I8SFeP
 mVkFfyHqDxbUpk6X3wN4f/EfYcGmnmZJEKujXoX3OuKBv5UDqmY6TDQ2IGZCqM7i
 j7jOOjU6g626Ifjjo44uvm3Z0GOZfIPtm99+QTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ZpLkM5
 jKVBPkJfMYc8S7iuXpOLb/u51b2Eh/4ZjgziY=; b=FVaiI8Dtr060OqhlGhWhOl
 nVNPAm+wkLL4a0w47k9HrOa3xJt55rL8h+e/DLgQMKtdFCuOBFbfYsd4+EDMIUwh
 ZyB0rJKyqjXkMOKemCetX3rd5/O0s8rNjY8+ZrDmyTFvKjDhdXsDTEVRR7dqj7rF
 eQpeyi9ASQ8fr4TUtiwhYl3OjVw1czBBc+pZVxadZC83cUUNG7Z+DBOAYuX77sr5
 z8wJsWLRoNrrkwX4Vp2MmzaHDMeat/8rnkbZ5N7HOFmJYG9Hj9ov6YHn/zvYnmrT
 r14dBnOVarVGQB7QMlua6Ez7wTKkkRpUzvgVcd91gov+r5R/F7OlT/SfV4dc/uYA
 ==
X-ME-Sender: <xms:xS3aXBYOMrDqx3hUtkGQfp2f5P3JEAWJdJLefL5on4OmdSPwZjT0mg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrleehgdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:xS3aXLIPijaaPoCjwth-BCofceKbYDMP_p0mlnB4i_QStzSNhs0fdw>
 <xmx:xS3aXA02V6pjL9jQFpveJJZoXhSmEg0SYKhFXhvnJuP_y4SYq3MpHw>
 <xmx:xS3aXHJirPjSejknsNT042UChXJC5Jg07xDQyQCbFtWft5DDE6aK0A>
 <xmx:xi3aXImM9bABhSiWLJ2DYNZlTK6A73v0aGFu4o9KSBlDGaDVA4a5jA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E1FF07C1BA; Mon, 13 May 2019 22:53:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-453-g9eaa09e-fmstable-20190430v2bis
Mime-Version: 1.0
Message-Id: <0192570c-1383-4183-b976-ce5c6b8270a3@www.fastmail.com>
In-Reply-To: <1557771437-26366-1-git-send-email-hongweiz@ami.com>
References: <1557771437-26366-1-git-send-email-hongweiz@ami.com>
Date: Mon, 13 May 2019 22:53:39 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Hongwei Zhang" <hongweiz@ami.com>, "Joel Stanley" <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-5.0] ARM: dts: aspeed: Add Microsoft Olympus BMC
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Hongwei,

Thanks for the patch!

I think this is the second or third iteration? If you send an updated patch in the future
please make sure to use the `-v` option as well as`--subject-prefix` to
`git format-patch` - this changes the subject to e.g. `[PATCH linux dev-5.0 v2]` and
allows us to identify why you've sent the patch from reading the subject.

On Tue, 14 May 2019, at 03:48, Hongwei Zhang wrote:
> Olympus is a Microsoft OCP platform equipped with Aspeed 2400 BMC
> Soc.
> 
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> ---
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts | 204 +++++++++++++++++++++
>  2 files changed, 205 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index c01a7b1..072725a 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1242,6 +1242,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-facebook-tiogapass.dtb \
>  	aspeed-bmc-intel-s2600wf.dtb \
>  	aspeed-bmc-lenovo-hr630.dtb \
> +	aspeed-bmc-microsoft-olympus.dtb \
>  	aspeed-bmc-opp-lanyang.dtb \
>  	aspeed-bmc-opp-palmetto.dtb \
>  	aspeed-bmc-opp-romulus.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts 
> b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
> new file mode 100644
> index 0000000..ed25fac
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
> @@ -0,0 +1,204 @@
> +//SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Device Tree file for Microsoft Olympus platform.
> + */
> +
> +/dts-v1/;
> +
> +#include "aspeed-g4.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model = "Olympus BMC";
> +	compatible = "microsoft,olympus-bmc", "aspeed,ast2400";
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "console=ttyS4,115200 earlyprintk";
> +	};
> +
> +	memory@40000000 {
> +		reg = <0x40000000 0x20000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		vga_memory: framebuffer@5f000000 {
> +			no-map;
> +			reg = <0x5f000000 0x01000000>; /* 16M */
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		bmc_heartbeat {
> +			gpios = <&gpio ASPEED_GPIO(B, 0) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		power_green {
> +			gpios = <&gpio ASPEED_GPIO(U, 2) GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		power_amber {
> +			gpios = <&gpio ASPEED_GPIO(U, 3) GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		identify {
> +			gpios = <&gpio ASPEED_GPIO(Q, 5) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		fault {
> +			gpios = <&gpio ASPEED_GPIO(A, 1) GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +		<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>;
> +	};
> +};
> +
> +&adc {
> +	status = "okay";

Can you please add the pinmux properties for the ADC lines that you're using?
The iio-hwmon node suggests you're using lines 0-7.

> +};
> +
> +&fmc {
> +	status = "okay";
> +
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "bmc";
> +#include "openbmc-flash-layout.dtsi"
> +	};
> +};
> +
> +&spi {
> +	status = "okay";
> +	pinctrl-names = "default";

This is missing the pinctrl-0 property.

I think in the last version of the patch you had this set to:

pinctrl-0 = <&pinctrl_spi1debug_default>;

and I queried how the board was strapped - you still need the pinctrl-0
node, but what I should have been clearer about was that you should
probably be using the following instead:

pinctrl-0 = <&pinctrl_spi1_default>;

unless your board is strapped for SPI debug mode. This is
something you'll need to check on the schematics, as pinctrl won't
modify the strapping value to accommodate the devicetree in this case.

Otherwise, the patch looks okay to me!

Cheers,

Andrew

> +
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "pnor";
> +	};
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
> +&i2c0 {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +
> +	tmp421@4c {
> +		compatible = "ti,tmp421";
> +		reg = <0x4c>;
> +	};
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +	clock-frequency = <100000>;
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +};
> +
> +&i2c6 {
> +	status = "okay";
> +
> +	tmp421@4c {
> +		compatible = "ti,tmp421";
> +		reg = <0x4c>;
> +	};
> +};
> +
> +&i2c7 {
> +	status = "okay";
> +};
> +
> +&vuart {
> +	status = "okay";
> +};
> +
> +&wdt2 {
> +	status = "okay";
> +};
> +
> +&lpc_ctrl {
> +	status = "okay";
> +};
> +
> +&mbox {
> +	status = "okay";
> +};
> +
> +&pwm_tacho {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 =    <&pinctrl_pwm0_default
> +			&pinctrl_pwm1_default
> +			&pinctrl_pwm2_default
> +			&pinctrl_pwm3_default
> +			&pinctrl_pwm4_default
> +			&pinctrl_pwm5_default
> +			&pinctrl_pwm6_default>;
> +
> +	fan@0 {
> +		reg = <0x00>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +	};
> +
> +	fan@1 {
> +		reg = <0x01>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> +	};
> +
> +	fan@2 {
> +		reg = <0x02>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x02>;
> +	};
> +
> +	fan@3 {
> +		reg = <0x03>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x03>;
> +	};
> +
> +	fan@4 {
> +		reg = <0x04>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x04>;
> +	};
> +
> +	fan@5 {
> +		reg = <0x05>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x05>;
> +	};
> +
> +};
> -- 
> 2.7.4
> 
>
