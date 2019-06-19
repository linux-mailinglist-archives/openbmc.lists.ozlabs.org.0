Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CE34AF28
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 02:43:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45T5lS16tNzDqLP
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 10:43:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Xol0YMad"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="rzs8gDE7"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45T5jc4TC3zDqKJ;
 Wed, 19 Jun 2019 10:41:22 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6089622393;
 Tue, 18 Jun 2019 20:41:18 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 18 Jun 2019 20:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=+gHRX6cTDmHSKWNNEZDiaV7fmTx8VY6
 71JKMUQ7FfmQ=; b=Xol0YMadH0jNDydD1NfwOaNXlsouExZ4M1/9uyj0CJJ/jpZ
 LNZvwztse1Y6jz3OP1zBUL0mJnRBH4otttEY/lzAyWs0lnJ7BtmEidtyfwZKq6GB
 cumXGBzbtN2GPt8CSgoRe9u2TnBB2dAixuA8mKav6I9BRIm2bl4+KJ5m+eTYNbzm
 URuxKfgvOf+uYiBbmKOJzJBOaF7WBjNnVJ05e/6py/S5soA6qTSJ2otMxaz9gXDK
 vvxYo2ixeKftG2c11bfIv6MeqU3F1d8QFKsV3kv5IcbY6kMbmaUWXOvB1ggeGOWB
 eIfKvP7lgNkpa8HEhkCf9G4cbvCx9RAnOe/nzZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+gHRX6
 cTDmHSKWNNEZDiaV7fmTx8VY671JKMUQ7FfmQ=; b=rzs8gDE7sglQ0dagm6cfWP
 QZ1hyCLw1DVZdOJ0txMIFdOBWwC5rxieibF2JFGcbOfXGhbJGeZoiQjtcT3vDaqi
 jy7al+DQgCaIJ8aSwTXgNCruIYnm+4d6oXksOS9bqDNoLXx9yj5v8i0J70TYBH0E
 l/poxoJsgAbHwLXnu0qXmja+Ncxo7uMJTrCKvdSVgwKqqLLndUO0sMnd78aR0Bh5
 wR4SwMGqoADMlHkRPSa6wD6MSHSL23CSQrdIqwxt2Ww6H1oLk6U4W6Hn5n0a4LTu
 siDDcnpbkmyl8/XXjs9hQDcBtQz1MX/jI+hdpg/PZ/7ET7yrwZHPaQ8kpb74u2Pg
 ==
X-ME-Sender: <xms:rYQJXa-A0RY1be8EltPd6m24OKzg4pp6JUVwSMzwVIBXG7ux2cfKdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrtddugdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:rYQJXRBI4ygcgye6OIWFLY_yQKTMsCXKYOUiVR79cwKYovE7uVkj-g>
 <xmx:rYQJXctlfABcHf2rCDF4pjv5OISMtr_llb2bmbraEhfO_GNeOXYxcg>
 <xmx:rYQJXREyR9Fq_ux5MV_uCxuV26L3guGYh9Xm5Wucd697lLaXUpEa_A>
 <xmx:roQJXVYnljDdqWJlVb4MbfpeVUxSo-2sRru08PzriJHXlgl4mpwubQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0505FE00A2; Tue, 18 Jun 2019 20:41:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-666-gb2312fa-fmstable-20190614v4
Mime-Version: 1.0
Message-Id: <d201fadc-0b8e-48df-8e50-bccd5d5019c7@www.fastmail.com>
In-Reply-To: <20190618042421.1227372-1-taoren@fb.com>
References: <20190618042421.1227372-1-taoren@fb.com>
Date: Wed, 19 Jun 2019 10:11:16 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Tao Ren" <taoren@fb.com>, "Rob Herring" <robh+dt@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Joel Stanley" <joel@jms.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH] ARM: dts: aspeed: Add Facebook Minipack BMC
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



On Tue, 18 Jun 2019, at 13:54, Tao Ren wrote:
> Add initial version of device tree for Facebook Minipack ast2500 BMC.
> 
> Signed-off-by: Tao Ren <taoren@fb.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-facebook-minipack.dts | 429 ++++++++++++++++++
>  2 files changed, 430 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 323fb7f13438..4c94e4c8de1e 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1267,6 +1267,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-arm-centriq2400-rep.dtb \
>  	aspeed-bmc-arm-stardragon4800-rep2.dtb \
>  	aspeed-bmc-facebook-cmm.dtb \
> +	aspeed-bmc-facebook-minipack.dtb \
>  	aspeed-bmc-facebook-tiogapass.dtb \
>  	aspeed-bmc-facebook-yamp.dtb \
>  	aspeed-bmc-intel-s2600wf.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts 
> b/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
> new file mode 100644
> index 000000000000..c05478296446
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
> @@ -0,0 +1,429 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2018 Facebook Inc.
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +
> +/ {
> +	model = "Facebook Minipack 100 BMC";
> +	compatible = "facebook,minipack-bmc", "aspeed,ast2500";
> +
> +	aliases {
> +		/*
> +		 * Override the default serial aliases to avoid breaking
> +		 * the legacy applications.
> +		 */
> +		serial0 = &uart5;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +		serial4 = &uart4;
> +
> +		/*
> +		 * i2c switch 2-0070, pca9548, 8 child channels assigned
> +		 * with bus number 16-23.
> +		 */
> +		i2c16 = &imux16;
> +		i2c17 = &imux17;
> +		i2c18 = &imux18;
> +		i2c19 = &imux19;
> +		i2c20 = &imux20;
> +		i2c21 = &imux21;
> +		i2c22 = &imux22;
> +		i2c23 = &imux23;
> +
> +		/*
> +		 * i2c switch 8-0070, pca9548, 8 child channels assigned
> +		 * with bus number 24-31.
> +		 */
> +		i2c24 = &imux24;
> +		i2c25 = &imux25;
> +		i2c26 = &imux26;
> +		i2c27 = &imux27;
> +		i2c28 = &imux28;
> +		i2c29 = &imux29;
> +		i2c30 = &imux30;
> +		i2c31 = &imux31;
> +
> +		/*
> +		 * i2c switch 9-0070, pca9548, 8 child channels assigned
> +		 * with bus number 32-39.
> +		 */
> +		i2c32 = &imux32;
> +		i2c33 = &imux33;
> +		i2c34 = &imux34;
> +		i2c35 = &imux35;
> +		i2c36 = &imux36;
> +		i2c37 = &imux37;
> +		i2c38 = &imux38;
> +		i2c39 = &imux39;
> +
> +		/*
> +		 * i2c switch 11-0070, pca9548, 8 child channels assigned
> +		 * with bus number 40-47.
> +		 */
> +		i2c40 = &imux40;
> +		i2c41 = &imux41;
> +		i2c42 = &imux42;
> +		i2c43 = &imux43;
> +		i2c44 = &imux44;
> +		i2c45 = &imux45;
> +		i2c46 = &imux46;
> +		i2c47 = &imux47;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart1;
> +		bootargs = "debug console=ttyS1,9600n8 root=/dev/ram rw";
> +	};
> +
> +	memory@80000000 {
> +		reg = <0x80000000 0x20000000>;
> +	};
> +};
> +
> +&wdt1 {
> +	status = "okay";
> +	aspeed,reset-type = "system";
> +};
> +
> +&wdt2 {
> +	status = "okay";
> +	aspeed,reset-type = "system";
> +};
> +
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "bmc";
> +#include "facebook-bmc-flash-layout.dtsi"
> +	};
> +};
> +
> +&uart1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_txd1_default
> +		     &pinctrl_rxd1_default
> +		     &pinctrl_ncts1_default
> +		     &pinctrl_ndsr1_default
> +		     &pinctrl_ndtr1_default
> +		     &pinctrl_nrts1_default>;
> +};
> +
> +&uart2 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_txd2_default
> +		     &pinctrl_rxd2_default>;
> +};
> +
> +&uart3 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_txd3_default
> +		     &pinctrl_rxd3_default>;
> +};
> +
> +&uart4 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_txd4_default
> +		     &pinctrl_rxd4_default>;
> +};
> +
> +&uart5 {
> +	status = "okay";
> +};
> +
> +&mac1 {
> +	status = "okay";
> +	no-hw-checksum;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +	bus-frequency = <400000>;
> +	multi-master;
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +
> +	i2c-switch@70 {
> +		compatible = "nxp,pca9548";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x70>;
> +
> +		imux16: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +		};
> +
> +		imux17: i2c@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +		};
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
> +
> +		imux23: i2c@7 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <7>;
> +		};
> +	};
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +	multi-master;
> +};
> +
> +&i2c5 {
> +	status = "okay";
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
> +
> +	i2c-switch@70 {
> +		compatible = "nxp,pca9548";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x70>;
> +
> +		imux24: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +		};
> +
> +		imux25: i2c@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +		};
> +
> +		imux26: i2c@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +		};
> +
> +		imux27: i2c@3 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <3>;
> +		};
> +
> +		imux28: i2c@4 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <4>;
> +		};
> +
> +		imux29: i2c@5 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <5>;
> +		};
> +
> +		imux30: i2c@6 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <6>;
> +		};
> +
> +		imux31: i2c@7 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <7>;
> +		};
> +	};
> +};
> +
> +&i2c9 {
> +	status = "okay";
> +
> +	i2c-switch@70 {
> +		compatible = "nxp,pca9548";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x70>;
> +
> +		imux32: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +		};
> +
> +		imux33: i2c@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +		};
> +
> +		imux34: i2c@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +		};
> +
> +		imux35: i2c@3 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <3>;
> +		};
> +
> +		imux36: i2c@4 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <4>;
> +		};
> +
> +		imux37: i2c@5 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <5>;
> +		};
> +
> +		imux38: i2c@6 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <6>;
> +		};
> +
> +		imux39: i2c@7 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <7>;
> +		};
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
> +	i2c-switch@70 {
> +		compatible = "nxp,pca9548";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x70>;
> +
> +		imux40: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +		};
> +
> +		imux41: i2c@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +		};
> +
> +		imux42: i2c@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +		};
> +
> +		imux43: i2c@3 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <3>;
> +		};
> +
> +		imux44: i2c@4 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <4>;
> +		};
> +
> +		imux45: i2c@5 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <5>;
> +		};
> +
> +		imux46: i2c@6 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <6>;
> +		};
> +
> +		imux47: i2c@7 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <7>;
> +		};
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
> +&vhub {
> +	status = "okay";
> +};
> -- 
> 2.17.1
> 
>
