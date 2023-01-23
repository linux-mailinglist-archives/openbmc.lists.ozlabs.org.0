Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC546773EA
	for <lists+openbmc@lfdr.de>; Mon, 23 Jan 2023 03:02:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0YJc24pGz3cBt
	for <lists+openbmc@lfdr.de>; Mon, 23 Jan 2023 13:02:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=Jhk0niF9;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=iI/UQjS7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=Jhk0niF9;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=iI/UQjS7;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0YHz4JFpz3bT5
	for <openbmc@lists.ozlabs.org>; Mon, 23 Jan 2023 13:01:51 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 8612F32005C1;
	Sun, 22 Jan 2023 21:01:49 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Sun, 22 Jan 2023 21:01:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674439309; x=1674525709; bh=mecrZa2gpe
	JSzM/0s8cT+LW7R+GRKHGKrTTUX5tXzY0=; b=Jhk0niF96dY6sPHLvM+tuRxGk/
	+JoTenx2Kfdto3c17PRBRsMQfsDgueO9OubPhNk64nme4eSRotP9h6a32QGw/RwB
	KjuBwZVDPBpcsNgkFf1NJtXZlyQyG1uEBFu8/dnHamaT99idINA2Ua0w2w0K9gV0
	DyOSi71g6lVRJ6PzVV2qWlRZZVgNrYnylRFKgGLtzUUEoCmqIJ343+J0pjv6XcF1
	a3VjWE8HsJwAbV+XketQJEA27B3D7N/KAtG34dB1eY7Ny+mg6mKxVOecwNU8j5+k
	hgm3UNoqnSDm68048dyiyxccwCvXgRvcTGOd7iFtn6jTmqKvCZie1/v22E7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674439309; x=1674525709; bh=mecrZa2gpeJSzM/0s8cT+LW7R+GR
	KHGKrTTUX5tXzY0=; b=iI/UQjS7Ck/IDUrs15QUHkkL4JBh3EWvvDvEcPK45z57
	ZxlDgJfieR2uuw8uXX3zzi1ACYJ0VWzHyEPn9S8mAaNYMp8W4aaFjzpLneotqdqW
	EZclWl8lJh05Fuz7zMTf36NWUk3/aq+XaO35ZLJ3Au/fGTxemfGZ3xHwMaMSpJ2z
	T5Psk84nBFBZSBA+a8n+GvSrZO0866AbYArGMbUysOje/K6SujYUHmADi2kzlp2v
	1L7tsLR9bHlM3JaAlIqMDmj/ksz2Lo3kpXpOMJ1aY2rIBxIjyvWkF24Qlxk834+x
	eUBWr8+qFEXQngi+7gdgUstyN5JG7t/8zJGM68DAQg==
X-ME-Sender: <xms:jOrNY_QWo1JNe-sbtugo7jUamuX45gRliz3WsgShVfgL3ORSGZnQEQ>
    <xme:jOrNYwwa9r6ladwTQ-OgTDAIC6_VcA1EPO8FmGc3IIWYt9VBS06Sc6ij7IayQPy5b
    lycHvIN3Uuk7HlVXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddujedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpedvvedvieeuteehiefftdfhjeevvdetffevgffhhfeuudffhedvkeef
    veeiueejleenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgr
    uh
X-ME-Proxy: <xmx:jOrNY003oMye2UlaGsWl7bpbLfRWaW7Gfsoqn6VyRvgU_Dpk7EJYMQ>
    <xmx:jOrNY_AlxhdRtxh7L6VfJO79kYPu1WExADkKC6MwRuj4J4mRrbJvpg>
    <xmx:jOrNY4iL93q6In-QEFjvZ1smeLLbTdDPbMaNv8W9m4ggbTbq_R08DQ>
    <xmx:jerNYwIRbtywNX8_TBM__GZB2TZVAyQ5f8JWcaHlglnKGrI_E6245g>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 86DE71700090; Sun, 22 Jan 2023 21:01:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <bf2b4328-2dcf-4da6-94da-91b71ea3aabc@app.fastmail.com>
In-Reply-To: <20221228062232.2003139-1-ryans@supermicro.com.tw>
References: <20221228062232.2003139-1-ryans@supermicro.com.tw>
Date: Mon, 23 Jan 2023 12:31:28 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ryan Sie" <lesly895@gmail.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH] Add Supermicro X13DEM BMC machine
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
Cc: Ryan Sie <ryans@supermicro.com.tw>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ryan,

Thanks for the patch. Please make sure to Cc the upstream lists:

* linux-aspeed@lists.ozlabs.org
* devicetree@vger.kernel.org

and any other people or lists that are found by running scripts/get_maintainer.pl.

Also, please run your patch through scripts/checkpatch.pl

I have a few other comments and queries:

On Wed, 28 Dec 2022, at 16:52, Ryan Sie wrote:
> Signed-off-by: Ryan Sie <ryans@supermicro.com.tw>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-supermicro-x13dem.dts | 476 ++++++++++++++++++
>  2 files changed, 477 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 2ee9c043218b..3b89006fa008 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1623,6 +1623,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-quanta-q71l.dtb \
>  	aspeed-bmc-quanta-s6q.dtb \
>  	aspeed-bmc-supermicro-x11spi.dtb \
> +	aspeed-bmc-supermicro-x13dem.dtb \
>  	aspeed-bmc-inventec-transformers.dtb \
>  	aspeed-bmc-tyan-s7106.dtb \
>  	aspeed-bmc-tyan-s8036.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts 
> b/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts
> new file mode 100644
> index 000000000000..b94783a52999
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts
> @@ -0,0 +1,476 @@
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +	model = "AST2600 BMC";
> +	compatible = "aspeed,ast2600";
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "console=ttyS4,115200 earlyprintk";
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x40000000>;
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
> +		video_engine_memory: jpegbuffer {
> +			size = <0x02000000>;	/* 32M */
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +
> +		ssp_memory: ssp_memory {
> +			size = <0x00200000>;
> +			alignment = <0x00100000>;
> +			compatible = "shared-dma-pool";
> +			no-map;
> +		};

How is this reserved memory used?

> +
> +	};
> +
> +	leds {
> +	    compatible = "gpio-leds";
> +	    powerfail {
> +		default-state = "off";
> +		gpios = <&gpio0 ASPEED_GPIO(G, 5) GPIO_ACTIVE_LOW>;
> +	    };
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
> +			<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
> +			<&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
> +			<&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
> +	};
> +
> +#if 0
> +	aliases {
> +		i2c18 = &imux18;
> +		i2c19 = &imux19;
> +		i2c20 = &imux20;
> +		i2c21 = &imux21;
> +		i2c22 = &imux22;
> +		mmc0 = &emmc;
> +	};
> +#else
> +	aliases {
> +		mmc0 = &emmc;
> +	};
> +#endif

Please remove the ifdefery.

> +
> +};
> +
> +&emmc_controller {
> +	status = "okay";
> +	timing-phase = <0x700FF>;

This is not a valid property. Instead you need to use the clk-phase* 
properties that upstream provides:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/mmc/mmc-controller.yaml?h=v6.2-rc5#n348

These require knowing how much phase correction you need for a given 
bus speed.

> +};
> +
> +&emmc {
> +	status = "okay";
> +
> +	non-removable;
> +	max-frequency = <100000000>;
> +	sdhci-drive-type = /bits/ 8 <3>;
> +#if 1
> +	bus-width = <4>;
> +#else
> +	bus-width = <8>;
> +	pinctrl-0 = <&pinctrl_emmc_default
> +			&pinctrl_emmcdat4_default
> +			&pinctrl_emmcdat5_default
> +			&pinctrl_emmcdat6_default
> +			&pinctrl_emmcdat7_default>;
> +#endif

Please remove the ifdefery

> +};
> +
> +//&jtag1 {
> +//	status = "okay";
> +//};

Remove commented nodes.

> +
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		label = "bmc";
> +		spi-max-frequency = <25000000>;
> +		spi-tx-bus-width = <1>;
> +		m25p,fast-read;
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			u-boot@0 {
> +				reg = <0x0 0x100000>;
> +				label = "u-boot";
> +			};
> +			u-boot-env@3f0000 {
> +				reg = <0x3f0000 0x10000>;
> +				label = "u-boot-env";
> +			};
> +			u-boot-env-redund@7f0000 {
> +				reg = <0x7f0000 0x10000>;
> +				label = "u-boot-env-redund";
> +			};
> +		};
> +	};
> +};

Do you actually have both SPI-NOR and eMMC storage for the BMC?

> +
> +&spi1 {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		label = "spi1:0";
> +		spi-max-frequency = <25000000>;
> +		spi-bus-width = <1>;
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			all-bios@0 {
> +				label = "all_part_bios";
> +				reg = <0x000000000 0x02000000>;
> +			};
> +		};
> +	};
> +
> +};
> +
> +&spi2 {
> +	status = "disabled";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi2_default &pinctrl_spi2cs1_default 
> &pinctrl_spi2cs2_default
> +				&pinctrl_qspi2_default>;
> +
> +	flash@0 {
> +		status = "okay";
> +		label = "spi2:0";
> +		spi-max-frequency = <100000000>;
> +		spi-bus-width = <2>;
> +		m25p,fast-read;
> +	};
> +};
> +
> +//&peci0 {
> +//	status = "okay";
> +//};

Delete commented nodes

> +
> +&syscon {
> +	uart-clock-high-speed;

This isn't a valid property. Please run your devicetree through `make dtbs_check`.

> +	status = "okay";
> +};
> +
> +&adc0 {
> +	status = "okay";

You must also add the pinctrl properties here to ensure your ADC lines 
aren't accidentally muxed for other purposes.

> +};
> +
> +&adc1 {
> +	status = "okay";

Again here.

> +};
> +
> +&gpio0 {
> +	status = "okay";
> +	gpio-line-names =
> +		/*A0-A7*/	"","","","","","","","",
> +		/*B0-B7*/	"","","","","","","","",
> +		/*C0-C7*/	"","","","","","","","",
> +		/*D0-D7*/	"","","","","","","","",
> +		/*E0-E7*/	"","","","","","","","",
> +		/*F0-F7*/	"","","","","","","","",
> +		/*G0-G7*/	"","","","","","","","",
> +		/*H0-H7*/	"","NMI_N","PWRBTN_N","RST_N","","","","",
> +		/*I0-I7*/	"","","","","","","","",
> +		/*J0-J7*/	"","","","","","","","",
> +		/*K0-K7*/	"","","","","","","","",
> +		/*L0-L7*/	"","","","","","","","",
> +		/*M0-M7*/	"","","","","","","","",
> +		/*N0-N7*/	"","","","","","","","",
> +		/*O0-O7*/	"","","","","","","","",
> +		/*P0-P7*/	"","","","","","","","",
> +		/*Q0-Q7*/	"","","","","","","","",
> +		/*R0-R7*/	"","","","","","","","",
> +		/*S0-S7*/	"","","","","PWROK_IN","","","",
> +		/*T0-T7*/	"","","","","","","","",
> +		/*U0-U7*/	"","","","","","","","",
> +		/*V0-V7*/	"","","","","","","","",
> +		/*W0-W7*/	"","","","","","","","",
> +		/*X0-X7*/	"","BIOS_CMP_IN","","","","","","",
> +		/*Y0-Y7*/	"","","","","","","","",
> +		/*Z0-Z7*/	"","","PWRBTN_IN","","","","","";
> +};
> +
> +&gpio1 {
> +	status = "disabled";
> +};
> +
> +&sgpiom0 {
> +	status = "disabled";
> +	gpio-line-names =
> +		/* SGPIO output lines */
> +		/*OA0-OA7*/	"","","","","","","","",
> +		/*OB0-OB7*/	"","","","","","","","",
> +		/*OC0-OC7*/	"","","","","","","","",
> +		/*OD0-OD7*/	"","","","","","","","",
> +		/*OE0-OE7*/	"","","","","","","","",
> +		/*OF0-OF7*/	"","","","","","","","",
> +		/*OG0-OG7*/	"","","","","","","","",
> +		/*OH0-OH7*/	"","","","","","","","",
> +		/*OI0-OI7*/	"","","","","","","","",
> +		/*OJ0-OJ7*/	"","","","","","","","",
> +		/*DUMMY*/	"","","","","","","","",
> +		/*DUMMY*/	"","","","","","","","",
> +
> +		/* SGPIO input lines */
> +		/*IA0-IA7*/	"","","","","","","","",
> +		/*IB0-IB7*/	"","","","","","","","",
> +		/*IC0-IC7*/	"","","","","","","","",
> +		/*ID0-ID7*/	"","","","","","","","",
> +		/*IE0-IE7*/	"","","","","","","","",
> +		/*IF0-IF7*/	"","","","","","","","",
> +		/*IG0-IG7*/	"","","","","","","","",
> +		/*IH0-IH7*/	"","","","","","","","",
> +		/*II0-II7*/	"","","","","","","","",
> +		/*IJ0-IJ7*/	"","","","","","","","";
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
> +//&lpc_sio {
> +//	status = "okay";
> +//};

Delete commented nodes.

I don't think this node is even legitimate. Does this devicetree compile?

> +
> +&lpc_snoop {
> +	snoop-ports = <0x80>;
> +	status = "okay";
> +};
> +
> +//&mbox {
> +//	status = "okay";
> +//};

Delete commented node.

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
> +};
> +
> +&uart2 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_txd2_default
> +			&pinctrl_rxd2_default
> +			&pinctrl_nrts2_default
> +			&pinctrl_ndtr2_default
> +			&pinctrl_ndsr2_default
> +			&pinctrl_ncts2_default
> +			&pinctrl_ndcd2_default
> +			&pinctrl_nri2_default>;
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
> +&uart_routing {
> +	status = "okay";
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
> +    status = "okay";
> +
> +    phy-mode = "rgmii";
> +    phy-handle = <&ethphy0>;
> +
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&pinctrl_rgmii1_default>;
> +};
> +
> +&mdio1 {
> +	status = "disabled";
> +
> +	ethphy1: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0>;
> +	};
> +};
> +
> +&mac1 {
> +	status = "disabled";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii2_default>;
> +	phy-mode = "rgmii";
> +	phy-handle = <&ethphy1>;
> +};
> +
> +&mdio2 {
> +	status = "disabled";
> +
> +	ethphy2: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0>;
> +	};
> +};
> +
> +&mac2 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rmii3_default>;
> +	use-ncsi;
> +};
> +
> +&mdio3 {
> +	status = "disabled";
> +
> +	ethphy3: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0>;
> +	};
> +};
> +
> +&mac3 {
> +	status = "disabled";
> +	pinctrl-names = "default";
> +	phy-handle = <&ethphy3>;
> +	phy-mode = "rgmii";
> +
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	status = "disabled";
> +};
> +
> +&i2c2 {
> +	multi-master;
> +	status = "okay";
> +#if 0
> +	i2c-switch@71 {
> +		compatible = "nxp,pca9548";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x71>;
> +		i2c-mux-idle-disconnect;
> +
> +		imux18: i2c@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +		};
> +
> +		imux19: i2c@3 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <3>;
> +		};
> +
> +		imux20: i2c@4 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <4>;
> +		};
> +
> +		imux21: i2c@5 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <5>;
> +		};
> +
> +		imux22: i2c@6 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <6>;
> +		};
> +	};
> +#endif

Delete the ifdefery

The rest looks okay.

Cheers,

Andrew
