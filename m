Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE8257C23C
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 04:26:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpGfC5YGQz3bXR
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 12:26:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=o5m4fMW5;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LXxNFNNW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=o5m4fMW5;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LXxNFNNW;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpGdk36znz2y8F;
	Thu, 21 Jul 2022 12:26:02 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 842FA5C00CD;
	Wed, 20 Jul 2022 22:26:00 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Wed, 20 Jul 2022 22:26:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1658370360; x=1658456760; bh=IY22mRWqSo
	8usiXkyL4SonvPzNqw0Y/i8axysexlkIk=; b=o5m4fMW5ti19M9MiQ3TgGkzY3y
	VyN6cAbT+kn1b1CVFxP1DucRivwZY+/D72Xm5NSojvC44M4V7D+ewhjUWxxVuviL
	SbBDiHBJ6QvqiNtZjZpD8YarAxptH5AXta306iSS+piw1iXJRdZhvc1R2h6Hb5Qk
	tT8H1LjLbuTvSXvzs/oz2yGMEArTUsmokOOivdLxPpaALxmVg3AtuYqRWKrP+OQY
	VgbKJ0Uoun3AhRjde+/DhXxQramxR4T0TE7pTjI9NbMDKW/gJDeEGGl0BZaJOcwh
	MQegPqz+HnbYNpMaySK4HyM28NWM5rX4a+b34zaXd8tGef8FeVQ4UfAEwprQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658370360; x=1658456760; bh=IY22mRWqSo8usiXkyL4SonvPzNqw
	0Y/i8axysexlkIk=; b=LXxNFNNWLDfDfpMDhvANk0njkT+II2tX06UQZQPIjzWX
	Pov2uLsDGDxJxs7Sv2CKtytMjVAKP19wp/IkTAn2tFUAGM9dEQKPK9IdWJtW/E/1
	KO5D9WjZa1OAwF/Ll3G76qGObE9M491tPwNNszsOD+GvU8rMxDWOi3bKxpyFkw/K
	Cv0AWiwvQfNq/1CQOpcOuM9NM8ckc9fLwYVLtTmKmC9gxPg4DGvq+VyjVhgtUQ7I
	t4QDJCXQxbMozgZsKNYewd3j+285NOiSFnDly5jbcF3jV9jIuYcRGyQnU6zEQYw2
	RwtyX/lfrQNz6WIoOgUe1tV2wSSazOfn7ST/agTuwA==
X-ME-Sender: <xms:OLnYYg0nne9cfqfBw2fqW_XHZrzukhmsp9QOOGqhN9FPQQT-ZgZ1Fw>
    <xme:OLnYYrFq8cS7UnHe1BgQkipHTA9M8HT2vzNFFIoX2bn-DWrM4C3aL63MOHsvSwfho
    K1uKXDV7OpVU7IC9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelfedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:OLnYYo7LMZGMAOEVIJk4HzI56ObVXnm2JMdB31ALYLvrGoZh39RQdw>
    <xmx:OLnYYp2r4J4XVRP9WKRQ6jSi4kZjBNTsTU1rzeTQs_oYEBPprCIVOg>
    <xmx:OLnYYjHk1xYs89btstFxodfBpEKJbxZCXr3nlLPpdJdCXuXB8X3wHg>
    <xmx:OLnYYoTmbi_H6JJUgt4-xdAUlvbA8xWGtPEkhiAGgRGwrGuDXrlFEA>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 32644170007E; Wed, 20 Jul 2022 22:26:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-755-g3e1da8b93f-fm-20220708.002-g3e1da8b9
Mime-Version: 1.0
Message-Id: <9340007a-b9c0-4657-8279-51892f963e5e@www.fastmail.com>
In-Reply-To: <20220712012353.386887-2-wangmin_phy@126.com>
References: <20220712012353.386887-1-wangmin_phy@126.com>
 <20220712012353.386887-2-wangmin_phy@126.com>
Date: Thu, 21 Jul 2022 11:55:39 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: wangmin_phy <wangmin_phy@126.com>, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH 1/1] ARM: dts: aspeed: Add device tree for Phytium's BMC
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
Cc: wangmin@phytium.com.cn
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 12 Jul 2022, at 10:53, wangmin_phy@126.com wrote:
> From: Min Wang <wangmin@phytium.com.cn>
>
> The Phytium's BMC card is an ASPEED AST2500-based BMC for the
> hardware reference platform with Phytium's Processors Family.
>
> Signed-off-by: Min Wang <wangmin@phytium.com.cn>
> ---
>  arch/arm/boot/dts/Makefile                    |   3 +-
>  .../boot/dts/aspeed-bmc-phytium-pomelo.dts    | 302 ++++++++++++++++++
>  2 files changed, 304 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-phytium-pomelo.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7e0934180724..e02cd800d45a 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1497,4 +1497,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-opp-zaius.dtb \
>  	aspeed-bmc-portwell-neptune.dtb \
>  	aspeed-bmc-quanta-q71l.dtb \
> -	aspeed-bmc-supermicro-x11spi.dtb
> +	aspeed-bmc-supermicro-x11spi.dtb \
> +	aspeed-bmc-phytium-pomelo.dtb

Please keep the list in alphabetical order.

> diff --git a/arch/arm/boot/dts/aspeed-bmc-phytium-pomelo.dts 
> b/arch/arm/boot/dts/aspeed-bmc-phytium-pomelo.dts
> new file mode 100644
> index 000000000000..a75017f22140
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-phytium-pomelo.dts
> @@ -0,0 +1,302 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model = "Phytium AST2500 BMC";
> +	compatible = "aspeed,ast2500";
> +
> +	aliases {
> +		serial4 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";

I think we're in favour of dropping bootargs from the devicetree now. 
This is handled in other ways (u-boot).

> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x20000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		vga_memory: framebuffer@9c000000 {
> +			no-map;
> +			reg = <0x9c000000 0x04000000>; /* 64M */
> +		};
> +
> +		video_engine_memory: jpegbuffer {
> +			size = <0x02000000>;	/* 32M */
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		id-button {
> +			label = "id-button";
> +			gpios = <&gpio  ASPEED_GPIO(S, 2)  GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		identify {
> +			gpios = <&gpio ASPEED_GPIO(C, 6) GPIO_ACTIVE_LOW>;
> +		};
> +		fault {
> +			gpios = <&gpio ASPEED_GPIO(C, 7) GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +		      <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> +		      <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> +		      <&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
> +	};
> +};
> +
> +&adc {
> +	status = "okay";

I recommend you mux the ADC lines to avoid them being 'stolen' by 
userspace accidentally requesting the wrong GPIOs.

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
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi1_default>;
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
> +};
> +
> +&uart5 {
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_txd1_default
> +			&pinctrl_rxd1_default
> +			&pinctrl_nrts1_default
> +			&pinctrl_ndtr1_default
> +			&pinctrl_ndsr1_default
> +			&pinctrl_ncts1_default
> +			&pinctrl_ndcd1_default
> +			&pinctrl_nri1_default>;
> +
> +};
> +
> +&lpc_snoop {
> +	status = "okay";
> +	snoop-ports = <0x80>;
> +};
> +
> +&kcs3 {
> +	status = "okay";
> +	aspeed,lpc-io-reg = <0xCA2>;
> +};
> +
> +&kcs2 {
> +	status = "okay";
> +	aspeed,lpc-io-reg = <0xCA8>;
> +};
> +
> +&mac0 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rmii1_default>;
> +	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
> +		 <&syscon ASPEED_CLK_MAC1RCLK>;
> +	clock-names = "MACCLK", "RCLK";
> +	use-ncsi;
> +};
> +
> +&mac1 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +	psu1@58 {
> +		compatible = "pmbus";
> +		reg = <0x58>;
> +	};
> +	psu2@59 {
> +		compatible = "pmbus";
> +		reg = <0x59>;
> +	};
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +	rtc@68 {
> +		compatible = "dallas,ds1339";
> +		reg = <0x68>;
> +	};
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +};
> +
> +
> +&i2c6 {
> +	status = "okay";
> +};
> +
> +&i2c7 {
> +	status = "okay";
> +};
> +
> +&i2c8 {
> +	status = "okay";
> +	lm75@48 {
> +		compatible = "ti,tmp100";
> +		reg = <0x48>;
> +	};
> +	lm75@49 {
> +		compatible = "ti,tmp100";
> +		reg = <0x49>;
> +	};
> +	lm75@4a {
> +		compatible = "ti,tmp100";
> +		reg = <0x4a>;
> +	};
> +	lm75@4c {
> +		compatible = "ti,tmp100";
> +		reg = <0x4c>;
> +	};
> +	lm75@4d {
> +		compatible = "ti,tmp100";
> +		reg = <0x4d>;
> +	};
> +	lm75@4e {
> +		compatible = "ti,tmp100";
> +		reg = <0x4e>;
> +	};
> +
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +};
> +
> +
> +/*
> + * Enable port A as device (via the virtual hub) and port B as
> + * host by default on the eval board. This can be easily changed
> + * by replacing the override below with &ehci0 { ... } to enable
> + * host on both ports.
> + */

Drop this comment as it's not the EVB?

Cheers,

Andrew
