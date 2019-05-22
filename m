Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8319E25AFF
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 02:03:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457tCJ5QtMzDqNk
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 10:03:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LrQOoNmw"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RDegwKMg"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457tBm68xTzDqLY
 for <openbmc@lists.ozlabs.org>; Wed, 22 May 2019 10:03:28 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2759C23DB5;
 Tue, 21 May 2019 20:03:24 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 21 May 2019 20:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=blnN2tXEbu5c2JQ6lLuSaip0sg8DOZ2
 oIVZeOveGyY0=; b=LrQOoNmwMOvggltGkwkho7dE8Us47fT8h82nXh8+ZQUPdju
 2ROahupDFL/V5xA86QErufqXhx1ForKCWgqmnebJZ2mOmZIjOJOmnuXMip/zepDE
 +n91QEmrNybsL972dRP+M0FAyDQu3n/2MNKI9uyEk8iUNZypxYn/NOaDpnI7yxnx
 eEoW0AjOg2nrqqLn0ojjEpP8zIRSVW7ZYKX3uWl30BAEqqu746+UQQbn0ci0z/0I
 /3jUkC43OPJr6KJkIhPta5jQT5C/DTbOB9NXDBZwO7g2Y3pjCFCuY6r5VZPWIAlT
 oB5PXxMMZKdPLYy/j1DD5gjBlqJIuIOkMhSSCwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=blnN2t
 XEbu5c2JQ6lLuSaip0sg8DOZ2oIVZeOveGyY0=; b=RDegwKMgnKPEbX62EvOV+3
 IEp9qvVf/q+WeoTqSOAZ7cbb0H8tI/XS4+N3iDaxs1I1N2nFpvkeVrrxOKJq7w8w
 JctsrHDO7BWHJc3g6xrrc+rnXk6HGTPa+UmhvfG8Cs9wdj7iXNcswBd31MEUDZyp
 HFj79W+ApKYERz5XsX08gDMssf0Dw7g/c8aDHR+rlldqBzJuRI/Hx7NDeVwUa2YF
 tZo1NYW7QFepsWBpAMDEgKu2obm5BQHoYABG9vYnJOg4UJ/1ovh9DKxfPpbb1m6m
 ODcoumQLvLNdHedOaEFSCSo9XJnYXMGs42p+vTIxTJX6NZHztHowJthbUfO0Uycw
 ==
X-ME-Sender: <xms:y5HkXLb402Vq8Lrei1wQahJqvuUa8vKkHeyW57oydQBhoL4mxLL_nQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduuddgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:y5HkXID0MQUkqrhhmdIYEzkeX1EwOvzTJ0O2USCXgXCPUOk1OTWWsA>
 <xmx:y5HkXDjgZtXIKukMhvIYjjp14VZnK44N3RFQwEqCBgx5_QkpwuiiXQ>
 <xmx:y5HkXFTbvESiYV-fZVvmJn8-g2_XAhJ3meVT91ykWIW1ffBZJx2cjw>
 <xmx:zJHkXDMqgOnU4qOVEaNH8cEtYjZ72krCQt6CaJhagf3gFtolbPliww>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4B9ED7C9CB; Tue, 21 May 2019 20:03:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-550-g29afa21-fmstable-20190520v1
Mime-Version: 1.0
Message-Id: <d1d3f7b3-b989-4e6e-ad52-239b6ac8aa48@www.fastmail.com>
In-Reply-To: <1558475264-29119-1-git-send-email-hongweiz@ami.com>
References: <1558475264-29119-1-git-send-email-hongweiz@ami.com>
Date: Wed, 22 May 2019 09:33:23 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Hongwei Zhang" <hongweiz@ami.com>, "Joel Stanley" <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.0_v3]_ARM:_dts:_aspeed:_Add_Microsoft_O?=
 =?UTF-8?Q?lympus_BMC?=
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



On Wed, 22 May 2019, at 07:18, Hongwei Zhang wrote:
> Olympus is a Microsoft OCP platform equipped with Aspeed 1250 or
> 2400 BMC SoC.
> 
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts | 211 +++++++++++++++++++++
>  2 files changed, 212 insertions(+)
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
> index 0000000..a3d6b71
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
> @@ -0,0 +1,211 @@
> +//SPDX-License-Identifier: GPL-2.0+
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
> +	pinctrl-names = "default";
> +	pinctrl-0 =    <&pinctrl_adc0_default
> +			&pinctrl_adc1_default
> +			&pinctrl_adc2_default
> +			&pinctrl_adc3_default
> +			&pinctrl_adc4_default
> +			&pinctrl_adc5_default
> +			&pinctrl_adc6_default
> +			&pinctrl_adc7_default>;
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
> +	pinctrl-0 = <&pinctrl_spi1_default>;
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
