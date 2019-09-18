Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAD7B6384
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 14:46:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YKTn3P60zF4SM
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 22:46:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.33.250.45; helo=2.mo179.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4196 seconds by postgrey-1.36 at bilbo;
 Wed, 18 Sep 2019 22:45:15 AEST
Received: from 2.mo179.mail-out.ovh.net (2.mo179.mail-out.ovh.net
 [178.33.250.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YKSq4r8yzF4RC
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 22:45:11 +1000 (AEST)
Received: from player688.ha.ovh.net (unknown [10.109.143.79])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id D8819142AE7
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 12:18:50 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player688.ha.ovh.net (Postfix) with ESMTPSA id 163A99DDDAA2;
 Wed, 18 Sep 2019 10:18:45 +0000 (UTC)
Subject: Re: [PATCH linux dev-5.2 v2 3/4] ARM: dts: Aspeed: ast2600: Add I2C
 busses
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <1568391353-32584-1-git-send-email-eajames@linux.ibm.com>
 <1568391353-32584-4-git-send-email-eajames@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9f747c91-0988-2eb1-7387-6bb5edff8611@kaod.org>
Date: Wed, 18 Sep 2019 12:18:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568391353-32584-4-git-send-email-eajames@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 327073926204459987
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudekgddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: andrew@aj.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 13/09/2019 18:15, Eddie James wrote:
> Add all the I2C busses to the AST2600 dtsi and set their required
> properties.
> 

The DT defines an interrupt per I2C bus but this is not how the I2C 
driver operates. It still uses the old mode from the Aspeed AST2500.

C.  

 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 272 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 272 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index f3edcff..916503a 100644
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
> @@ -281,6 +297,262 @@
>  				};
>  			};
>  
> +			i2c0: i2c-bus@1e78a080 {
> +				#address-cells = <1>;
> +				#size-cells = <1>;
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
> +				#size-cells = <1>;
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
> +				#size-cells = <1>;
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
> +				#size-cells = <1>;
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
> +				#size-cells = <1>;
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
> +				#size-cells = <1>;
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
> +			i2c6: i2c-bus@1e78a380 {
> +				#address-cells = <1>;
> +				#size-cells = <1>;
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
> +				#size-cells = <1>;
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
> +				#size-cells = <1>;
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
> +				#size-cells = <1>;
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
> +				#size-cells = <1>;
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
> +				#size-cells = <1>;
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
> +				#size-cells = <1>;
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
> +				#size-cells = <1>;
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
> +				#size-cells = <1>;
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
> +				#size-cells = <1>;
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
> 

