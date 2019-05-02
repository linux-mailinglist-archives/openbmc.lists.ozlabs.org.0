Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CA9111E8
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 05:37:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vgtv0sDFzDqPy
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 13:37:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XcJRXCUJ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QHhjiW7J"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vgt44sfKzDqPC
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 13:36:44 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E9FF22206E;
 Wed,  1 May 2019 23:36:41 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 01 May 2019 23:36:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=7TUUY2xVkbqdW2d1WZi+UKH//kkn3f1
 AeHkkRBkpAxA=; b=XcJRXCUJNolLtPLnBQBJR8NYxR9+jD5rGTSBWxojZL4jhRE
 KB+XvrIE/pRssxtDfjC7MVcofgKMYZSJrGNOgQVcmz3HHNQ/E5IAc+JzToHP/m58
 ep/bxjcsrJDgRDfuZd9F7FK6HIhgUdU58f87rZwxpMhfB7mTIBo+M32dbnhXY5jY
 LsxbyH0JAuutXdXvmC2gd+CigwvOb5VrJGFnETAp0PdWRUt44mRQHlMNKCyl1xvb
 2M27IyryWDp4kPcE9ndZg5Td88nEl/CoM8QGUW5faTYpmdIiTsBuj+Pd9BC7CNmc
 HJRB9fSdfmsNff+BRjwZF0mdGxBP2hpPH+HxU3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7TUUY2
 xVkbqdW2d1WZi+UKH//kkn3f1AeHkkRBkpAxA=; b=QHhjiW7JtljntOE2jHKgXG
 eHR1Nfjbkunw6ctTiYnG8bHs3uU+dGT0qko2gY0svtYUVYXFUKs/niQ0O/zSDwVl
 lUv5oqTa08ie/mh1oWp4soATSip3qO/cX6/fPXmvCHkaTIQiT5T6ln+X2SUYHSAV
 RArGGpm2NvZTvhHZ7fmNWrVMAV7Xsk460MNQ1b+JoGxDdkmuzY3a5rukZn1XeRzN
 IL0BYWaVuZf6kndG5utlYv1V0jalIogUVIOtTcmarMspR3amb5Ds+0NlksV66XjQ
 tf3tP3E7kHDhDHm/9/DxZNEXW53ekmM5YeQhVg6oKm+rzUTjH//KOiUEjcJFgs3A
 ==
X-ME-Sender: <xms:yGXKXC_bc19GihQpqP7p_WHXlUSLd5aaTeyX1CVyvri8dHS_5vhpQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieekgdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:yGXKXF2PuF9bbnPJL-jpJVpbXtT4SoX7kByJLNq1dhK3xreBlg7XoQ>
 <xmx:yGXKXFcqX4Y1ogGu7KcSr3DesMHF9il0prHibLDrAb8gJfny2ZK9xQ>
 <xmx:yGXKXPCv5T_fAlkFs9e9aBsbuyJMCfnxQQ0JVbDlV70rADJfASLEog>
 <xmx:yWXKXFK9y6aBO15rEYPya2ZDZ54eWYV5VMy6JjpINsy-ARyBZgWasw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BF8057C6D9; Wed,  1 May 2019 23:36:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <b8a60ad4-e3c2-4207-a3bd-421a146c55c2@www.fastmail.com>
In-Reply-To: <1556216903-24529-1-git-send-email-hongweiz@ami.com>
References: <1556216903-24529-1-git-send-email-hongweiz@ami.com>
Date: Wed, 01 May 2019 23:36:40 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Hongwei Zhang" <hongweiz@ami.com>, "Joel Stanley" <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.0]_ARM:_dts:_aspeed:_Initial_git_pull_r?=
 =?UTF-8?Q?equest_for_Microsoft_Olympus_BMC?=
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



On Fri, 26 Apr 2019, at 03:59, Hongwei Zhang wrote:
> Olympus is a Microsoft OCP platform equipped with Aspeed 2400 BMC
> SoC.
> Tested: meta-olympus has been tested on an ASPEED AST2400 EVB board
>         and MT Olympus server.
>         The U-boot and kernel start and run as expected.
> 
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> ---
>  arch/arm/boot/dts/Makefile                   |   3 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-olympus.dts | 219 +++++++++++++++++++++++++++
>  2 files changed, 221 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-olympus.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index bd40148..34c0b7a0 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1247,4 +1247,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-opp-witherspoon.dtb \
>  	aspeed-bmc-opp-zaius.dtb \
>  	aspeed-bmc-portwell-neptune.dtb \
> -	aspeed-bmc-quanta-q71l.dtb
> +	aspeed-bmc-quanta-q71l.dtb \
> +	aspeed-bmc-opp-olympus.dts
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-olympus.dts 
> b/arch/arm/boot/dts/aspeed-bmc-opp-olympus.dts
> new file mode 100644
> index 0000000..8b4b00d0
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-olympus.dts
> @@ -0,0 +1,219 @@
> +//SPDX-License-Identifier: GPL-2.0+
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
> +
> +		flash_memory: region@98000000 {
> +			no-map;
> +			reg = <0x98000000 0x01000000>; /* 16MB */
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
> +	pinctrl-0 = <&pinctrl_spi1debug_default>;

Is this how your board is strapped, or is this a copy/paste issue?

You wouldn't be the first board design to make that strapping mistake ;)

> +
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "pnor";
> +	};
> +};
> +
> +&pinctrl {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
> +			&pinctrl_vgahs_default &pinctrl_vgavs_default
> +			&pinctrl_ddcclk_default &pinctrl_ddcdat_default>;'

This is likely junk. Please confirm you actually need these pinmux hogs.

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
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	clock-frequency = <100000>;
> +
> +	slave-mqueue@20 {
> +		compatible = "slave-ipmb";
> +		reg = <0x40000020>;
> +	};
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
> +	memory-region = <&flash_memory>;
> +	flash = <&spi>;
> +};
> +
> +&mbox {
> +	status = "okay";
> +};
> +
> +&pwm_tacho {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm0_default
> +			&pinctrl_pwm1_default
> +			&pinctrl_pwm2_default
> +			&pinctrl_pwm3_default>;

You need to mux all the pins you're using, which appears to be pwm0-5.

Cheers,

Andrew

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
> Please consider the environment before printing this email.
> 
> The information contained in this message may be confidential and 
> proprietary to American Megatrends, Inc.  This communication is 
> intended to be read only by the individual or entity to whom it is 
> addressed or by their designee. If the reader of this message is not 
> the intended recipient, you are on notice that any distribution of this 
> message, in any form, is strictly prohibited.  Please promptly notify 
> the sender by reply e-mail or by telephone at 770-246-8600, and then 
> delete or destroy all copies of the transmission.
>
