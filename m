Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61007A98A9
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 05:02:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P57p2SkxzDqyj
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 13:01:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KUcEag8A"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WU8ni1dz"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P56z6nNBzDqjy
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 13:01:15 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9850920A82
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 23:01:11 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 04 Sep 2019 23:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=PaA/M8SqadNq3gpki6b8l4EnmuMOCgw
 BidGH0CBuOSc=; b=KUcEag8AjPsXAI+vliqTyMg5Ja7wEb2V2B1TVQUWiT1DoJx
 nDxwWYtOoBOXxIlcijVJNiYu7h2XThj+eDSYoCHNK9JV/V3ENR+lJaMSc7wDJkYx
 9Q4viLe0+aPsPhU+LR+RyPFs0hpu6P0N/BG1JhhInQzRcPPwG/CH3pmJhL3ix8VS
 UD277b64aIjEk6I/4OyTJwcdxaLpK7qoxwOX6zplQP6UU+2uyNKbXAXa3GpXoAuh
 NyQjpAcY5f0wG7swwRezDwE/jVe2gFC2I9akhzPnmEPX4wJ+UlG6otOhNXfNP4rC
 ebgDM7id1lCH5vV/61gpc0QMwg5C/VOTcRd1HiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=PaA/M8
 SqadNq3gpki6b8l4EnmuMOCgwBidGH0CBuOSc=; b=WU8ni1dzKEig9cdloFD/Kv
 14zaWd4vXVMzrQtqa9kSnGpVT5Pjoje90IDonypFTnlTUVBE7bwf+CWowpSpcCB2
 ckhRVnY/P6Q/XSUw6ZfGOv/k0wEtXSd7ZFqp65AQ1F8KrsU072jeXmlGJaw6NNi2
 0J73W8DiAQKug8+4IUcGkJbO1yE85IloD1EP79Ygfmu98wOlPuHSRUzytTGiHX5J
 BAzsZXiXED4mY2V+vFT4N5abp+m5VnulP3m8OLS4vcUUElAS2bKYlbh/sftvjkaG
 rgG9bI7Vo2/kXdlK7g7OPj7Z6MsPqw/WxHSKtwhHRqidJi+HfEVbar8BZ3YiacUw
 ==
X-ME-Sender: <xms:d3pwXfAjDIOVV80q-zX7VwOVxY2ppVleUeHMAE-QIQEW8A7q3djfSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejiedgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderreejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:d3pwXZzi2ZaD2ZiPd-Q6RcyBP6nruefBzoRUqXzciog7DQsDWZxyuA>
 <xmx:d3pwXVmR2O3UHtaYpfFMeZYHVLap8aCk84Z1XZaUeImRa7eIQO1QYQ>
 <xmx:d3pwXWHi1hIBfAf91VkbmRu4AFyESYNwpgdNcQRi8mWtYtzKjvEdMQ>
 <xmx:d3pwXe53OQNqQ6EdwAC8GMUUghk4pzBhyOWfwWbfvG98i3rwSMi8EQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DFBE7E00A3; Wed,  4 Sep 2019 23:01:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-186-gf4cb3c3-fmstable-20190904v1
Mime-Version: 1.0
Message-Id: <fe3bbdf4-d3fd-4454-95fe-eef5228e353a@www.fastmail.com>
In-Reply-To: <1567629311-7553-1-git-send-email-eajames@linux.ibm.com>
References: <1567629311-7553-1-git-send-email-eajames@linux.ibm.com>
Date: Thu, 05 Sep 2019 12:31:36 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.2_1/2]_ARM:_dts:_Aspeed:_Add_I2C_busses?=
 =?UTF-8?Q?_to_AST2600_and_Tacoma?=
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 5 Sep 2019, at 06:05, Eddie James wrote:
> Add all the I2C busses to the AST2600 dtsi. Set the busses status to
> "okay" and add all the devices present on the Tacoma card to the
> busses.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 384 ++++++++++++++++++++++++++++
>  arch/arm/boot/dts/aspeed-g6.dtsi            | 272 ++++++++++++++++++++

Bit of a nit, but can you please split the dtsi change from the tacoma change? 

>  2 files changed, 656 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts 
> b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> index 0a38bc0..408af00 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -3,6 +3,7 @@
>  /dts-v1/;
>  
>  #include "aspeed-g6.dtsi"
> +#include <dt-bindings/leds/leds-pca955x.h>
>  
>  / {
>  	model = "Tacoma";
> @@ -37,3 +38,386 @@
>  &fsim0 {
>  	status = "okay";
>  };
> +
> +&i2c0 {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +
> +	bmp: bmp280@77 {
> +		compatible = "bosch,bmp280";
> +		reg = <0x77>;
> +		#io-channel-cells = <1>;
> +	};
> +
> +	max31785@52 {
> +		compatible = "maxim,max31785a";
> +		reg = <0x52>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		fan@0 {
> +			compatible = "pmbus-fan";
> +			reg = <0>;
> +			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
> +		};
> +
> +		fan@1 {
> +			compatible = "pmbus-fan";
> +			reg = <1>;
> +			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
> +		};
> +
> +		fan@2 {
> +			compatible = "pmbus-fan";
> +			reg = <2>;
> +			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
> +		};
> +
> +		fan@3 {
> +			compatible = "pmbus-fan";
> +			reg = <3>;
> +			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
> +		};
> +	};
> +
> +	dps: dps310@76 {
> +		compatible = "infineon,dps310";
> +		reg = <0x76>;
> +		#io-channel-cells = <0>;
> +	};
> +
> +	pca0: pca9552@60 {
> +		compatible = "nxp,pca9552";
> +		reg = <0x60>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
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
> +	};
> +
> +	power-supply@68 {
> +		compatible = "ibm,cffps1";
> +		reg = <0x68>;
> +	};
> +
> +	power-supply@69 {
> +		compatible = "ibm,cffps1";
> +		reg = <0x69>;
> +	};
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +
> +	tmp423a@4c {
> +		compatible = "ti,tmp423";
> +		reg = <0x4c>;
> +	};
> +
> +	ir35221@70 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x70>;
> +	};
> +
> +	ir35221@71 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x71>;
> +	};
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +
> +	tmp423a@4c {
> +		compatible = "ti,tmp423";
> +		reg = <0x4c>;
> +	};
> +
> +	ir35221@70 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x70>;
> +	};
> +
> +	ir35221@71 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x71>;
> +	};
> +};
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
> +};
> +
> +&i2c9 {
> +	status = "okay";
> +
> +	tmp275@4a {
> +		compatible = "ti,tmp275";
> +		reg = <0x4a>;
> +	};
> +};
> +
> +&i2c10 {
> +	status = "okay";
> +};
> +
> +&i2c11 {
> +	status = "okay";
> +
> +	pca9552: pca9552@60 {
> +		compatible = "nxp,pca9552";
> +		reg = <0x60>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		gpio-line-names = "PS_SMBUS_RESET_N", "APSS_RESET_N",
> +			"GPU0_TH_OVERT_N_BUFF",	"GPU1_TH_OVERT_N_BUFF",
> +			"GPU2_TH_OVERT_N_BUFF", "GPU3_TH_OVERT_N_BUFF",
> +			"GPU4_TH_OVERT_N_BUFF",	"GPU5_TH_OVERT_N_BUFF",
> +			"GPU0_PWR_GOOD_BUFF", "GPU1_PWR_GOOD_BUFF",
> +			"GPU2_PWR_GOOD_BUFF", "GPU3_PWR_GOOD_BUFF",
> +			"GPU4_PWR_GOOD_BUFF", "GPU5_PWR_GOOD_BUFF",
> +			"12V_BREAKER_FLT_N", "THROTTLE_UNLATCHED_N";
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
> +	};
> +
> +	rtc@32 {
> +		compatible = "epson,rx8900";
> +		reg = <0x32>;
> +	};
> +
> +	eeprom@51 {
> +		compatible = "atmel,24c64";
> +		reg = <0x51>;
> +	};
> +
> +	ucd90160@64 {
> +		compatible = "ti,ucd90160";
> +		reg = <0x64>;
> +	};
> +};
> +
> +&i2c12 {
> +	status = "okay";
> +};
> +
> +&i2c13 {
> +	status = "okay";
> +};
> +
> +&i2c14 {
> +	status = "okay";
> +};
> +
> +&i2c15 {
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 12569e5..0a8e08a 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -12,6 +12,22 @@
>  	interrupt-parent = <&gic>;
>  
>  	aliases {
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +		i2c4 = &i2c4;
> +		i2c5 = &i2c5;
> +		i2c6 = &i2c6;
> +		i2c7 = &i2c7;
> +		i2c8 = &i2c8;
> +		i2c9 = &i2c9;
> +		i2c10 = &i2c10;
> +		i2c11 = &i2c11;
> +		i2c12 = &i2c12;
> +		i2c13 = &i2c13;
> +		i2c14 = &i2c14;
> +		i2c15 = &i2c15;
>  		serial4 = &uart5;
>  	};
>  
> @@ -255,6 +271,262 @@
>  				};
>  			};
>  
> +			i2c0: i2c-bus@1e78a80 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				#interrupt-cells = <1>;
> +
> +				reg = <0x1e78a080 0x80>;
> +				compatible = "aspeed,ast2600-i2c-bus";
> +				clocks = <&syscon ASPEED_CLK_APB1>;
> +				resets = <&syscon ASPEED_RESET_I2C>;
> +				bus-frequency = <100000>;
> +				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_i2c1_default>;
> +				status = "disabled";
> +			};
> +
> +			i2c1: i2c-bus@1e78a100 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				#interrupt-cells = <1>;
> +
> +				reg = <0x1e78a100 0x80>;
> +				compatible = "aspeed,ast2600-i2c-bus";
> +				clocks = <&syscon ASPEED_CLK_APB1>;
> +				resets = <&syscon ASPEED_RESET_I2C>;
> +				bus-frequency = <100000>;
> +				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_i2c2_default>;
> +				status = "disabled";
> +			};
> +
> +			i2c2: i2c-bus@1e78a180 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				#interrupt-cells = <1>;
> +
> +				reg = <0x1e78a180 0x80>;
> +				compatible = "aspeed,ast2600-i2c-bus";
> +				clocks = <&syscon ASPEED_CLK_APB1>;
> +				resets = <&syscon ASPEED_RESET_I2C>;
> +				bus-frequency = <100000>;
> +				interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_i2c3_default>;
> +				status = "disabled";
> +			};
> +
> +			i2c3: i2c-bus@1e78a200 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				#interrupt-cells = <1>;
> +
> +				reg = <0x1e78a200 0x80>;
> +				compatible = "aspeed,ast2600-i2c-bus";
> +				clocks = <&syscon ASPEED_CLK_APB1>;
> +				resets = <&syscon ASPEED_RESET_I2C>;
> +				bus-frequency = <100000>;
> +				interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_i2c4_default>;
> +				status = "disabled";
> +			};
> +
> +			i2c4: i2c-bus@1e78a280 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				#interrupt-cells = <1>;
> +
> +				reg = <0x1e78a280 0x80>;
> +				compatible = "aspeed,ast2600-i2c-bus";
> +				clocks = <&syscon ASPEED_CLK_APB1>;
> +				resets = <&syscon ASPEED_RESET_I2C>;
> +				bus-frequency = <100000>;
> +				interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_i2c5_default>;
> +				status = "disabled";
> +			};
> +
> +			i2c5: i2c-bus@1e78a300 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				#interrupt-cells = <1>;
> +
> +				reg = <0x1e78a300 0x80>;
> +				compatible = "aspeed,ast2600-i2c-bus";
> +				clocks = <&syscon ASPEED_CLK_APB1>;
> +				resets = <&syscon ASPEED_RESET_I2C>;
> +				bus-frequency = <100000>;
> +				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_i2c6_default>;
> +				status = "disabled";
> +			};
> +
> +			i2c6: i2c-bus@380 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				#interrupt-cells = <1>;
> +
> +				reg = <0x1e78a380 0x80>;
> +				compatible = "aspeed,ast2600-i2c-bus";
> +				clocks = <&syscon ASPEED_CLK_APB1>;
> +				resets = <&syscon ASPEED_RESET_I2C>;
> +				bus-frequency = <100000>;
> +				interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_i2c7_default>;
> +				status = "disabled";
> +			};
> +
> +			i2c7: i2c-bus@1e78a400 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				#interrupt-cells = <1>;
> +
> +				reg = <0x1e78a400 0x80>;
> +				compatible = "aspeed,ast2600-i2c-bus";
> +				clocks = <&syscon ASPEED_CLK_APB1>;
> +				resets = <&syscon ASPEED_RESET_I2C>;
> +				bus-frequency = <100000>;
> +				interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_i2c8_default>;
> +				status = "disabled";
> +			};
> +
> +			i2c8: i2c-bus@1e78a480 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				#interrupt-cells = <1>;
> +
> +				reg = <0x1e78a480 0x80>;
> +				compatible = "aspeed,ast2600-i2c-bus";
> +				clocks = <&syscon ASPEED_CLK_APB1>;
> +				resets = <&syscon ASPEED_RESET_I2C>;
> +				bus-frequency = <100000>;
> +				interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_i2c9_default>;
> +				status = "disabled";
> +			};
> +
> +			i2c9: i2c-bus@1e78a500 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				#interrupt-cells = <1>;
> +
> +				reg = <0x1e78a500 0x80>;
> +				compatible = "aspeed,ast2600-i2c-bus";
> +				clocks = <&syscon ASPEED_CLK_APB1>;
> +				resets = <&syscon ASPEED_RESET_I2C>;
> +				bus-frequency = <100000>;
> +				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_i2c10_default>;
> +				status = "disabled";
> +			};
> +
> +			i2c10: i2c-bus@1e78a580 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				#interrupt-cells = <1>;
> +
> +				reg = <0x1e78a580 0x80>;
> +				compatible = "aspeed,ast2600-i2c-bus";
> +				clocks = <&syscon ASPEED_CLK_APB1>;
> +				resets = <&syscon ASPEED_RESET_I2C>;
> +				bus-frequency = <100000>;
> +				interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_i2c11_default>;
> +				status = "disabled";
> +			};
> +
> +			i2c11: i2c-bus@1e78a600 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				#interrupt-cells = <1>;
> +
> +				reg = <0x1e78a600 0x80>;
> +				compatible = "aspeed,ast2600-i2c-bus";
> +				clocks = <&syscon ASPEED_CLK_APB1>;
> +				resets = <&syscon ASPEED_RESET_I2C>;
> +				bus-frequency = <100000>;
> +				interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_i2c12_default>;
> +				status = "disabled";
> +			};
> +
> +			i2c12: i2c-bus@1e78a680 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				#interrupt-cells = <1>;
> +
> +				reg = <0x1e78a680 0x80>;
> +				compatible = "aspeed,ast2600-i2c-bus";
> +				clocks = <&syscon ASPEED_CLK_APB1>;
> +				resets = <&syscon ASPEED_RESET_I2C>;
> +				bus-frequency = <100000>;
> +				interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_i2c13_default>;
> +				status = "disabled";
> +			};
> +
> +			i2c13: i2c-bus@1e78a700 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				#interrupt-cells = <1>;
> +
> +				reg = <0x1e78a700 0x80>;
> +				compatible = "aspeed,ast2600-i2c-bus";
> +				clocks = <&syscon ASPEED_CLK_APB1>;
> +				resets = <&syscon ASPEED_RESET_I2C>;
> +				bus-frequency = <100000>;
> +				interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_i2c14_default>;
> +				status = "disabled";
> +			};
> +
> +			i2c14: i2c-bus@1e78a780 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				#interrupt-cells = <1>;
> +
> +				reg = <0x1e78a780 0x80>;
> +				compatible = "aspeed,ast2600-i2c-bus";
> +				clocks = <&syscon ASPEED_CLK_APB1>;
> +				resets = <&syscon ASPEED_RESET_I2C>;
> +				bus-frequency = <100000>;
> +				interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_i2c15_default>;
> +				status = "disabled";
> +			};
> +
> +			i2c15: i2c-bus@1e78a800 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				#interrupt-cells = <1>;
> +
> +				reg = <0x1e78a800 0x80>;
> +				compatible = "aspeed,ast2600-i2c-bus";
> +				clocks = <&syscon ASPEED_CLK_APB1>;
> +				resets = <&syscon ASPEED_RESET_I2C>;
> +				bus-frequency = <100000>;
> +				interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_i2c16_default>;
> +				status = "disabled";
> +			};
> +
>  			fsim0: fsi@1e79b000 {
>  				compatible = "aspeed,ast2600-fsi-master", "fsi-master";
>  				reg = <0x1e79b000 0x94>;
> -- 
> 1.8.3.1
> 
>
