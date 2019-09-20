Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C41B8B7D
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 09:26:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZQHz2QnmzF1DH
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 17:26:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VSmj2+Ap"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="j+DijtnC"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZQH01GDjzDrJJ
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 17:25:31 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BAD4C220A3;
 Fri, 20 Sep 2019 03:25:28 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 20 Sep 2019 03:25:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=n1zeXnL4KonDLs7cHZ5CL8htJCsSQI+
 wsAF9aKsEjJs=; b=VSmj2+ApZ7hKETk7+uU0n29xQCn0YnHFz5WbfQCLDnODhvm
 USpG6+C5N75WT6AhKerlVHS6Lp/+q48dxlQ+7LRwv6d/9xqjhzLqFagHSxHOrngW
 PLZl7XaiOnnJXxKaGtJ49sUSC2OcpmD4VQ5PL1zsRihZxJb3Wwd0xhg9nF549dOV
 csRQbIFn8DmWMZbH48SUV3Gmb+b7+klZ09mkIXgJdXKuY9cVOjGCVPZlVDixJmiF
 QU+M5uShiGqZLJ6lG29jcuG6+G57SwEr1Zc36GHkAQdk8FY4oH/sAdqxqSHzjjIz
 2u3Zn3T75W9yuFeUl2qpmmk9DVEsFihElStPRLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=n1zeXn
 L4KonDLs7cHZ5CL8htJCsSQI+wsAF9aKsEjJs=; b=j+DijtnC0vysGeWleg+7V3
 NZJ1rAViBLIFfGlRweIJvMBCB7fzrB38AHYyIsMxJr0GU0vQNXX/SYI5K0/F+9CK
 drP7C3jKlmYe7yuaUmWrQuJlUkFBK7ZT0uo3Q8NcDQvDRjByHGxupoWIMSV4dmTA
 ZIVUrEqSWBjGUOJJOgqq2C+xQPeFS8STF66BiA4vaj+kzucwUnnbU4li6Pc500F8
 a5NGprqqVMkcwKuusIt6bzMphrRQ2E+DuNSrYyS24Kbd78V4eS2InOOGhm1AQCFU
 +Rh6sGNz58IuIPtPJP4w2cLIcbN66sybltoeCeUv7OCEIISIdLNAFzhModGn0UBg
 ==
X-ME-Sender: <xms:536EXV_UaXyisedEnfAtxsihaq1ywNjyLveQyCr1LU93YT4q4nrPCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddugdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:536EXWdwu9SQE-MDcQicNETvtgcBz2BYRHesal20svZ85qKp23gvXw>
 <xmx:536EXdnlU0Zmqv7MHWiHIfz8xPkQ71SZbPm2Kf4kk1rNZGk-RJaTzA>
 <xmx:536EXcuNQ3C7iVf75FvlQGVl-bl1CdelkTwRevRUSvi_GcR_NBbSpg>
 <xmx:6H6EXei0oD4547suMfgQ7yNAai-3lj3I9Yi67Uc7HIyZpL7l97xk1w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C340DE00A9; Fri, 20 Sep 2019 03:25:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-238-g170a812-fmstable-20190913v1
Mime-Version: 1.0
Message-Id: <ec008c39-5c2d-4b52-a0a5-09b6ffa9b2a8@www.fastmail.com>
In-Reply-To: <20190919152340.23133-5-bradleyb@fuzziesquirrel.com>
References: <20190919152340.23133-1-bradleyb@fuzziesquirrel.com>
 <20190919152340.23133-5-bradleyb@fuzziesquirrel.com>
Date: Fri, 20 Sep 2019 16:55:15 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH v2 linux dev-5.3 4/4] ARM: dts: aspeed: add Rainier system
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 20 Sep 2019, at 00:53, Brad Bishop wrote:
> Rainier is a new Power system with an AST2600.
> 
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
> v2:
>   - reordered rainier DT elements (alphabetized).
>   - added rainier rtc, lpc-ctl, reserved memory, mac devices
> ---
>  arch/arm/boot/dts/Makefile                   |   3 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts | 485 +++++++++++++++++++
>  2 files changed, 487 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 5af075c2f819..2f81a4be50a8 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1293,4 +1293,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-opp-witherspoon.dtb \
>  	aspeed-bmc-opp-zaius.dtb \
>  	aspeed-bmc-portwell-neptune.dtb \
> -	aspeed-bmc-quanta-q71l.dtb
> +	aspeed-bmc-quanta-q71l.dtb \
> +	aspeed-bmc-opp-rainier.dtb

Rainier isn't an OpenPOWER Platform so we should drop the 'opp' or
potentially substitute it with 'ibm' ("aspeed-bmc-ibm-rainier.dtb").

> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts 
> b/arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts
> new file mode 100644
> index 000000000000..5f45b1effe4a
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts
> @@ -0,0 +1,485 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2019 IBM Corp.
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +
> +/ {
> +	model = "Rainier";
> +	compatible = "ibm,rainier-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial4 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "console=ttyS4,115200n8";
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x80000000>;

Do we have 2GiB? According to the schematic I have it should be 1GiB.
My schematic could be out of date though.

> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		flash_memory: region@98000000 {
> +			no-map;
> +			reg = <0x98000000 0x04000000>; /* 64M */

That's a strange place to put it given we have much more memory :) We
picked that address for the AST2500-based OPP systems because it's
the lowest usable address below the VGA region. If we have more RAM
then we should move it up.

> +		};
> +	};
> +
> +};
> +
> +&emmc_controller {
> +	status = "okay";
> +};
> +
> +&emmc {
> +	status = "okay";
> +};
> +
> +&fsim0 {
> +	status = "okay";
> +};
> +
> +&ibt {
> +	status = "okay";
> +};
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
> +	power-supply@68 {
> +		compatible = "ibm,cffps2";
> +		reg = <0x68>;
> +	};
> +
> +	power-supply@69 {
> +		compatible = "ibm,cffps2";
> +		reg = <0x69>;
> +	};
> +
> +	power-supply@6a {
> +		compatible = "ibm,cffps2";
> +		reg = <0x6a>;
> +	};
> +
> +	power-supply@6b {
> +		compatible = "ibm,cffps2";
> +		reg = <0x6b>;
> +	};
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +
> +	tmp275@48 {
> +		compatible = "ti,tmp275";
> +		reg = <0x48>;
> +	};
> +
> +	tmp275@49 {
> +		compatible = "ti,tmp275";
> +		reg = <0x49>;
> +	};
> +
> +	tmp275@4a {
> +		compatible = "ti,tmp275";
> +		reg = <0x4a>;
> +	};
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +
> +	tmp275@48 {
> +		compatible = "ti,tmp275";
> +		reg = <0x48>;
> +	};
> +
> +	tmp275@49 {
> +		compatible = "ti,tmp275";
> +		reg = <0x49>;
> +	};
> +};
> +
> +&i2c6 {
> +	status = "okay";
> +
> +	tmp275@48 {
> +		compatible = "ti,tmp275";
> +		reg = <0x48>;
> +	};
> +
> +	tmp275@4a {
> +		compatible = "ti,tmp275";
> +		reg = <0x4a>;
> +	};
> +
> +	tmp275@4b {
> +		compatible = "ti,tmp275";
> +		reg = <0x4b>;
> +	};
> +};
> +
> +&i2c7 {
> +	status = "okay";
> +
> +	si7021-a20@20 {
> +		compatible = "silabs,si7020";
> +		reg = <0x20>;
> +	};
> +
> +	tmp275@48 {
> +		compatible = "ti,tmp275";
> +		reg = <0x48>;
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
> +		};
> +
> +		gpio@1 {
> +			reg = <1>;
> +		};
> +
> +		gpio@2 {
> +			reg = <2>;
> +		};
> +
> +		gpio@3 {
> +			reg = <3>;
> +		};
> +
> +		gpio@4 {
> +			reg = <4>;
> +		};
> +
> +		gpio@5 {
> +			reg = <5>;
> +		};
> +
> +		gpio@6 {
> +			reg = <6>;
> +		};
> +
> +		gpio@7 {
> +			reg = <7>;
> +		};
> +
> +		gpio@8 {
> +			reg = <8>;
> +		};
> +
> +		gpio@9 {
> +			reg = <9>;
> +		};
> +
> +		gpio@10 {
> +			reg = <10>;
> +		};
> +
> +		gpio@11 {
> +			reg = <11>;
> +		};
> +
> +		gpio@12 {
> +			reg = <12>;
> +		};
> +
> +		gpio@13 {
> +			reg = <13>;
> +		};
> +
> +		gpio@14 {
> +			reg = <14>;
> +		};
> +
> +		gpio@15 {
> +			reg = <15>;
> +		};
> +	};
> +
> +	dps: dps310@76 {
> +		compatible = "infineon,dps310";
> +		reg = <0x76>;
> +		#io-channel-cells = <0>;
> +	};
> +};
> +
> +&i2c8 {
> +	status = "okay";
> +
> +	ucd90320@b {
> +		compatible = "ti,ucd90160";
> +		reg = <0x0b>;
> +	};
> +
> +	ucd90320@c {
> +		compatible = "ti,ucd90160";
> +		reg = <0x0c>;
> +	};
> +
> +	ucd90320@11 {
> +		compatible = "ti,ucd90160";
> +		reg = <0x11>;
> +	};
> +
> +	rtc@32 {
> +		compatible = "epson,rx8900";
> +		reg = <0x32>;
> +	};
> +
> +	tmp275@48 {
> +		compatible = "ti,tmp275";
> +		reg = <0x48>;
> +	};
> +
> +	tmp275@4a {
> +		compatible = "ti,tmp275";
> +		reg = <0x4a>;
> +	};
> +};
> +
> +&i2c9 {
> +	status = "okay";
> +
> +	ir35221@42 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x42>;
> +	};
> +
> +	ir35221@43 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x43>;
> +	};
> +
> +	ir35221@44 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x44>;
> +	};
> +
> +	tmp423a@4c {
> +		compatible = "ti,tmp423";
> +		reg = <0x4c>;
> +	};
> +
> +	tmp423b@4d {
> +		compatible = "ti,tmp423";
> +		reg = <0x4d>;
> +	};
> +
> +	ir35221@72 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x72>;
> +	};
> +
> +	ir35221@73 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x73>;
> +	};
> +
> +	ir35221@74 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x74>;
> +	};
> +};
> +
> +&i2c10 {
> +	status = "okay";
> +
> +	ir35221@42 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x42>;
> +	};
> +
> +	ir35221@43 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x43>;
> +	};
> +
> +	ir35221@44 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x44>;
> +	};
> +
> +	tmp423a@4c {
> +		compatible = "ti,tmp423";
> +		reg = <0x4c>;
> +	};
> +
> +	tmp423b@4d {
> +		compatible = "ti,tmp423";
> +		reg = <0x4d>;
> +	};
> +
> +	ir35221@72 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x72>;
> +	};
> +
> +	ir35221@73 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x73>;
> +	};
> +
> +	ir35221@74 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x74>;
> +	};
> +};
> +
> +&i2c11 {
> +	status = "okay";
> +
> +	tmp275@48 {
> +		compatible = "ti,tmp275";
> +		reg = <0x48>;
> +	};
> +
> +	tmp275@49 {
> +		compatible = "ti,tmp275";
> +		reg = <0x49>;
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

It might be worth splitting out the i2c bits as the support isn't yet
upstream.

> +
> +&lpc_ctrl {
> +	status = "okay";
> +	memory-region = <&flash_memory>;
> +	flash = <&spi1>;

Drop the flash property as we won't be using that.

> +};
> +
> +&mac0 {
> +	status = "okay";
> +};
> +
> +&mac1 {
> +	status = "okay";
> +};
> +
> +&mac2 {
> +	status = "okay";
> +};
> +
> +&mac3 {
> +	status = "okay";
> +};

Only MACs 3 and 4 are connected. Both should also have use-ncsi and request
the RMII pinmux.

> +
> +&sdc {
> +	status = "okay";
> +};
> +
> +&sdhci0 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sd1_default>;
> +};
> +
> +&sdhci1 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sd2_default>;
> +};

We're only using the eMMC controller (i.e. neither of the two SD slots),
so we shouldn't be enabling these.

Andrew
