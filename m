Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C8D55CF1
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 02:36:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YPGy1dZBzDqZN
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 10:36:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.221; helo=new1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hXKea5bm"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="aSQU9pOw"; dkim-atps=neutral
X-Greylist: delayed 313 seconds by postgrey-1.36 at bilbo;
 Wed, 26 Jun 2019 10:36:10 AEST
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YPGL4HvdzDqSg
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 10:36:10 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 286E83736;
 Tue, 25 Jun 2019 20:30:52 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 25 Jun 2019 20:30:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=Tou/XJtWon4Y0EqL/NuUMaJ7Iw9jiYg
 o+Sn1o1uErn4=; b=hXKea5bmYWk5ufTSOX74smKVyYtMRQ8tPJ5/P22LfUXsXh7
 hfELaq5d/TqgvMbdnafc+1b8m6/NE5qcCnIrxhlT3yDM14bZi1NLnzKzNQASGxhF
 4ouzLCIAfuu4gaEj7nye+3Tg8IB3Z+bx/NzsgXTFZcNJA81XsfuuvgW9WG8RGxfe
 kBIYDqqSlnJ9KdCPCYRnn6bWi4vL3BNj51DpQ/JUel6DLCDg0RNTb3BbFmYZ+zrK
 rEo+T0jEZiWpWAR26521if0/7w2pW6xlNCD/F9b6s5FLxuqmh0RXDt8Gs1pj6IKG
 cp36XDfIJuu26JSBEV4LfcxvxorfBJ7ivbliZww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Tou/XJ
 tWon4Y0EqL/NuUMaJ7Iw9jiYgo+Sn1o1uErn4=; b=aSQU9pOwUCvFUUktrpzm3j
 FzT1sAVL0YHMvdJjBoxISN1jLHFRF4pVQk1WXdqTAMYpxc7vBvTQF5tK5cTJzveI
 X1RI5RBm5DsvHNPEGcC/YZJ4X7PMGtAp73iI6M6aT5pcYpJcGxr8QyPdJRjQTffm
 wfJ6WP2rNUdrvO2SCKqWoMK0VLgPRoAzjkBlDd9brquUW0mFH5tjsDRaCSO1DT8j
 jKEW6i/ZXE/ZmrZoB50vKut0gOXWzZGi9ML7jgl/5paJBzUBN5cfIRQ52TDbUthX
 IJY1E9KTAkCOoq2viyfR3AxaC+d4opald976mCt+k8Db+FDSDk6K5e/fN9mVqplw
 ==
X-ME-Sender: <xms:urwSXf3VkaO1GkHmpST4YyPCQSwh9NbtZngBKC3pG1xy3zCvQfZL_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:urwSXaXFq2omK43v93mm6wwn-FpCi5rPIFt2FT1s_YprmwqfUVFBRg>
 <xmx:urwSXWIjada8_3FZSNgLGcYim9vEwk8PWvIQxC_DEOjc9160n9A3dA>
 <xmx:urwSXSe-mbhV86xYF_FDl4c2iO1mb3LR0B1Fvk2XcwqeruWFV14KKw>
 <xmx:vLwSXZwfYvBX7oypG0ntm9ouicT7UDvSJghWM5S2Vo5rM9ZjQ0Mfzw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C0B32E00A2; Tue, 25 Jun 2019 20:30:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-730-g63f2c3b-fmstable-20190622v1
Mime-Version: 1.0
Message-Id: <b9abadd4-58e1-4a47-bbcf-f173a1dd2bff@www.fastmail.com>
In-Reply-To: <1561444696-446373-1-git-send-email-pengms1@lenovo.com>
References: <1561444696-446373-1-git-send-email-pengms1@lenovo.com>
Date: Wed, 26 Jun 2019 10:00:50 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Andrew Peng" <pengms1@lenovo.com>, "Patrick Venture" <venture@google.com>,
 "Benjamin Fair" <benjaminfair@google.com>, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, mark.rutland@arm.com,
 "Rob Herring" <robh+dt@kernel.org>
Subject: Re: [PATCH] [PATCH v1] ARM: dts: aspeed: Adding Lenovo Hr855xg2 BMC
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
Cc: Derek Lin <dlin23@lenovo.com>, dukh@lenovo.com, openbmc@lists.ozlabs.org,
 hsung1@lenovo.com, liuyh21@lenovo.com, liuyj19@lenovo.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 25 Jun 2019, at 16:08, Andrew Peng wrote:
> Initial introduction of Lenovo Hr855xg2 family equipped with
> Aspeed 2500 BMC SoC. Hr855xg2 is a x86 server development kit
> with a ASPEED ast2500 BMC manufactured by Lenovo.
> Specifically, This adds the Hr855xg2 platform device tree file
> used by the Hr855xg2 BMC machines.
> 
> This also adds an entry of Hr855xg2 device tree file in Makefile
> 
> Signed-off-by: Andrew Peng <pengms1@lenovo.com>
> Signed-off-by: Yonghui Liu <liuyh21@lenovo.com>
> Signed-off-by: Lisa Liu <liuyj19@lenovo.com>
> Signed-off-by: Harry Sung <hsung1@lenovo.com>
> Signed-off-by: Derek Lin <dlin23@lenovo.com>
> ---
>  arch/arm/boot/dts/Makefile                       |   1 +
>  arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts | 687 +++++++++++++++++++++++
>  2 files changed, 688 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index dab2914f..d874777 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1269,6 +1269,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-facebook-cmm.dtb \
>  	aspeed-bmc-facebook-tiogapass.dtb \
>  	aspeed-bmc-intel-s2600wf.dtb \
> +	aspeed-bmc-lenovo-hr855xg2.dtb \
>  	aspeed-bmc-opp-lanyang.dtb \
>  	aspeed-bmc-opp-palmetto.dtb \
>  	aspeed-bmc-opp-romulus.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts 
> b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
> new file mode 100644
> index 0000000..d8dbf3a
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
> @@ -0,0 +1,687 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Device Tree file for Lenovo Hr855xg2 platform
> + *
> + * Copyright (C) 2019-present Lenovo
> + */
> +
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model = "HR855XG2 BMC";
> +	compatible = "lenovo,hr855xg2-bmc", "aspeed,ast2500";
> +
> +	aliases {
> +		i2c14 = &i2c_riser1;
> +		i2c15 = &i2c_riser2;
> +		i2c16 = &i2c_riser3;
> +		i2c17 = &i2c_M2;
> +		i2c18 = &channel_0;
> +		i2c19 = &channel_1;
> +		i2c20 = &channel_2;
> +		i2c21 = &channel_3;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";
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
> +		flash_memory: region@98000000 {
> +			no-map;
> +			reg = <0x98000000 0x00100000>; /* 1M */
> +		};

We've got a couple of patches on their way upstream for 5.3 that remove
the need to reserve memory simply to satisfy the aspeed-lpc-ctrl driver.

If you base the patch on top of Joel's aspeed-5.3-soc tag you can remove
this node and the phandle reference to it.

> +
> +		gfx_memory: framebuffer {
> +			size = <0x01000000>;
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		heartbeat {
> +			gpios = <&gpio ASPEED_GPIO(C, 7) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		fault {
> +			gpios = <&gpio ASPEED_GPIO(G, 3) GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +		<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> +		<&adc 8>, <&adc 9>, <&adc 10>,<&adc 11>,
> +		<&adc 12>,<&adc 13>,<&adc 14>;
> +	};
> +
> +	iio-hwmon-battery {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc 15>;
> +	};
> +
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
> +&lpc_ctrl {
> +	status = "okay";
> +	memory-region = <&flash_memory>;

i.e. remove the above.

> +	flash = <&spi1>;
> +};
> +
> +&lpc_snoop {
> +	status = "okay";
> +	snoop-ports = <0x80>;
> +};
> +
> +&uart1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_txd1_default
> +			&pinctrl_rxd1_default>;
> +};
> +
> +&uart2 {
> +	/* Rear RS-232 connector */
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
> +&uart5 {
> +	status = "okay";
> +};
> +
> +&ibt {
> +	status = "okay";
> +};
> +
> +&mac0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rmii1_default>;
> +	use-ncsi;
> +};
> +
> +&mac1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +};
> +
> +&adc{
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_adc0_default
> +			&pinctrl_adc1_default
> +			&pinctrl_adc2_default
> +			&pinctrl_adc3_default
> +			&pinctrl_adc4_default
> +			&pinctrl_adc5_default
> +			&pinctrl_adc6_default
> +			&pinctrl_adc7_default
> +			&pinctrl_adc8_default
> +			&pinctrl_adc9_default
> +			&pinctrl_adc10_default
> +			&pinctrl_adc11_default
> +			&pinctrl_adc12_default
> +			&pinctrl_adc13_default
> +			&pinctrl_adc14_default
> +			&pinctrl_adc15_default>;
> +};
> +
> +&peci0 {
> +	status = "okay";
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
> +
> +	peci-client@32 {
> +		compatible = "intel,peci-client";
> +		reg = <0x32>;
> +	};
> +
> +	peci-client@33 {
> +		compatible = "intel,peci-client";
> +		reg = <0x33>;
> +	};
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	i2c-switch@70 {
> +		compatible = "nxp,pca9545";
> +		reg = <0x70>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		i2c_riser1: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +		};
> +
> +		i2c_riser2: i2c@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +		};
> +
> +		i2c_riser3: i2c@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +		};
> +
> +		i2c_M2: i2c@3 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <3>;
> +		};
> +	};
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +	bus-frequency = <90000>;
> +	HotSwap@10 {
> +		compatible = "adm1272";
> +		reg = <0x10>;
> +	};
> +
> +	VR@45 {
> +		compatible = "pmbus";
> +		reg = <0x45>;
> +	};
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +	i2c-switch@70 {
> +		compatible = "nxp,pca9546";
> +		reg = <0x70>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		channel_0: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +		};
> +
> +		channel_1: i2c@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +		};
> +
> +		channel_2: i2c@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +		};
> +
> +		channel_3: i2c@3 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <3>;
> +		};
> +	};
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +};
> +
> +&i2c6 {
> +	status = "okay";
> +	/* temp1 */
> +	tmp75@49 {
> +		compatible = "national,lm75";
> +		reg = <0x49>;
> +	};
> +
> +	/* temp2 */
> +	tmp75@4d {
> +		compatible = "national,lm75";
> +		reg = <0x4d>;
> +	};
> +
> +	eeprom@54 {
> +		compatible = "atmel,24c256";
> +		reg = <0x54>;
> +		pagesize = <16>;
> +	};
> +};
> +
> +&i2c7 {
> +	status = "okay";
> +};
> +
> +&i2c8 {
> +	status = "okay";
> +};
> +
> +&i2c9 {
> +	status = "okay";
> +};
> +
> +&i2c10 {
> +	status = "okay";
> +};
> +
> +&i2c11 {
> +	status = "okay";
> +};
> +
> +&i2c13 {
> +	status = "okay";
> +};
> +
> +&ehci1 {
> +	status = "okay";
> +};
> +
> +&uhci {
> +	status = "okay";
> +};
> +
> +&gfx {
> +	status = "okay";
> +	memory-region = <&gfx_memory>;
> +};
> +
> +&pwm_tacho {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm0_default
> +	&pinctrl_pwm1_default
> +	&pinctrl_pwm2_default
> +	&pinctrl_pwm3_default
> +	&pinctrl_pwm4_default
> +	&pinctrl_pwm5_default
> +	&pinctrl_pwm6_default
> +	&pinctrl_pwm7_default>;
> +
> +	fan@0 {
> +		reg = <0x00>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +	};
> +
> +	fan@1 {
> +		reg = <0x00>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> +	};
> +
> +	fan@2 {
> +		reg = <0x01>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x02>;
> +	};
> +
> +	fan@3 {
> +		reg = <0x01>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x03>;
> +	};
> +
> +	fan@4 {
> +		reg = <0x02>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x04>;
> +	};
> +
> +	fan@5 {
> +		reg = <0x02>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x05>;
> +	};
> +
> +	fan@6 {
> +		reg = <0x03>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x06>;
> +	};
> +
> +	fan@7 {
> +		reg = <0x03>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x07>;
> +	};
> +
> +	fan@8 {
> +		reg = <0x04>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x08>;
> +	};
> +
> +	fan@9 {
> +		reg = <0x04>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x09>;
> +	};
> +
> +	fan@10 {
> +		reg = <0x05>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x0a>;
> +	};
> +
> +	fan@11 {
> +		reg = <0x05>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x0b>;
> +	};
> +
> +	fan@12 {
> +		reg = <0x06>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x0c>;
> +	};
> +
> +	fan@13 {
> +		reg = <0x06>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x0d>;
> +	};
> +
> +	fan@14 {
> +		reg = <0x07>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x0e>;
> +	};
> +
> +	fan@15 {
> +		reg = <0x07>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x0f>;
> +	};
> +
> +	fan@16 {
> +		reg = <0x07>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x0f>;
> +	};
> +};
> +
> +&gpio {
> +
> +	pin_gpio_a1 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(A, 1) GPIO_ACTIVE_LOW>;
> +		output-high;
> +		line-name = "BMC_EMMC_RST_N";
> +	};
> +
> +	pin_gpio_a3 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(A, 3) GPIO_ACTIVE_LOW>;
> +		output-high;
> +		line-name = "PCH_PWROK_BMC_FPGA";
> +	};
> +
> +	pin_gpio_b5 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "IRQ_BMC_PCH_SMI_LPC_N";
> +	};
> +
> +	pin_gpio_b7 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(B, 7) GPIO_ACTIVE_LOW>;
> +		output-low;
> +		line-name = "CPU_SM_WP";
> +	};
> +
> +	pin_gpio_e0 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(E, 0) GPIO_ACTIVE_HIGH>;
> +		input;
> +		line-name = "PDB_PSU_SEL";
> +	};
> +
> +	pin_gpio_e2 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(E, 2) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "LOCATOR_LED_N";
> +	};
> +
> +	pin_gpio_e5 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(E, 5) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "FM_BMC_DBP_PRESENT_R1_N";
> +	};
> +
> +	pin_gpio_e6 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(E, 6) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "BMC_ME_SECURITY_OVERRIDE_N";
> +	};
> +
> +	pin_gpio_f0 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(F, 0) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "IRQ_BMC_PCH_NMI_R";
> +	};
> +
> +	pin_gpio_f1 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(F, 1) GPIO_ACTIVE_HIGH>;
> +		input;
> +		line-name = "CPU2_PROCDIS_BMC_N";
> +	};
> +
> +	pin_gpio_f2 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(F, 2) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "RM_THROTTLE_EN_N";
> +	};
> +
> +	pin_gpio_f3 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(F, 3) GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "FM_PMBUS_ALERT_B_EN";
> +	};
> +
> +	pin_gpio_f4 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(F, 4) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "BMC_FORCE_NM_THROTTLE_N";
> +	};
> +
> +	pin_gpio_f6 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(F, 6) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "FM_BMC_CPU_PWR_DEBUG_N";
> +	};
> +
> +	pin_gpio_g7 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(G, 7) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "BMC_PCIE_I2C_MUX_RST_N";
> +	};
> +
> +	pin_gpio_h6 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "FM_BMC_DBP_PRESENT_R2_N";
> +	};
> +
> +	pin_gpio_i3 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(I, 3) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "SPI_BMC_BIOS_WP_N";
> +	};
> +
> +	pin_gpio_j1 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "BMC_USB_SEL";
> +	};
> +
> +	pin_gpio_j2 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "PDB_SMB_RST_N";
> +	};
> +
> +	pin_gpio_j3 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(J, 3) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "SPI_BMC_BIOS_HOLD_N";
> +	};
> +
> +	pin_gpio_l0 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(L, 0) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "PDB_FAN_TACH_SEL";
> +	};
> +
> +	pin_gpio_l1 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(L, 1) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "SYS_RESET_BMC_FPGA_N";
> +	};
> +
> +	pin_gpio_l4 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "FM_EFUSE_FAN_G1_EN";
> +	};
> +
> +	pin_gpio_l5 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(L, 5) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "FM_EFUSE_FAN_G2_EN";
> +	};
> +
> +	pin_gpio_r6 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(R, 6) GPIO_ACTIVE_HIGH>;
> +		input;
> +		line-name = "CPU3_PROCDIS_BMC_N";
> +	};
> +
> +	pin_gpio_r7 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(R, 7) GPIO_ACTIVE_HIGH>;
> +		input;
> +		line-name = "CPU4_PROCDIS_BMC_N";
> +	};
> +
> +	pin_gpio_s1 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(S, 1) GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "DBP_SYSPWROK_BMC";
> +	};
> +
> +	pin_gpio_s2 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(S, 2) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "PCH_RST_RSMRST_N";
> +	};
> +
> +	pin_gpio_s6 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(S, 6) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "BMC_HW_STRAP_5";
> +	};
> +
> +	pin_gpio_z3 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "FM_BMC_PCH_SCI_LPC_N";
> +	};
> +
> +	pin_gpio_aa0 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "FW_PSU_ALERT_EN_N";
> +	};
> +
> +	pin_gpio_aa4 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(AA, 4) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "DBP_CPU_PREQ_N";
> +	};
> +
> +	pin_gpio_ab3 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(AB, 3) GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "BMC_WDTRST";
> +	};
> +
> +	pin_gpio_ac6 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(AC, 6) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "ESPI_BMC_ALERT_N";
> +	};

Just want to confirm that you want the kernel to hog these lines
(the consequence is they're unavailable to userspace).

Cheers,

Andrew

> +
> +};
> -- 
> 2.7.4
> 
>
