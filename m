Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7427EA88
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 04:57:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460Bdv1mLRzDqlQ
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 12:57:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="YB0B0Lno"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="zyPywBiw"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460Bd85R84zDql8;
 Fri,  2 Aug 2019 12:56:28 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 30ED821FE7;
 Thu,  1 Aug 2019 22:56:26 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 01 Aug 2019 22:56:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=b13Qy1cbkkhaYNqP2u5N7xcdlQ9zyV2
 1qZFwzIFtu3w=; b=YB0B0LnoLskRSKCcZlVV0Js1yIDy1QUteqFqwLQdDbtd2qd
 HHQCwu9Zm2sQ07nxyQ2IQQqwDJCRNyoMbzwoBPOgCPGqtgMfVh9ouJoEDhQqx91q
 THUZwGLnXjN58TzHpVGStMSyxKtQ+IBSuJ/CYnYxOLyppFqhcrlE9wvIzypMeM4k
 inhcYflYeAFlK/iICRSGf+gN/Yq2TMvUD5Qy3DZnUZkzT+ZJyD/YI35amEMqt6o6
 FtN1D09VErOS+SsTsb/aFwDllPM94k3IQi1RG6Ea98Q83Pd3rVAJ+is5AL92S/7M
 wQsKlTZq2dsfDvBExMAKDOdPPgwr5chOlVK26bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=b13Qy1
 cbkkhaYNqP2u5N7xcdlQ9zyV21qZFwzIFtu3w=; b=zyPywBiw14Cf6SCHIcI2yy
 192WMY3/xF+fgHhZaaBHssd2DhycCwjimND7DYBa6/y7yS2jQHhxr0tJcQkhuy+X
 aSSMZSxF1GNi0l3WPjwH2V5S8j/HZY6mdWDkDn55NCQJxPlg9raHyk5GpS+YliAP
 VnckwwWi4jKz4CQv1TnQO/piMdqxebkpLu7rlcchj9Xx38NNGORuxeCiqZWz2Hpa
 uO8zH6DjSmIKljsqC2tW2mPLDcLxNFSI08w2SNY0RXwQmElbKl6Nmm4KruzukOCg
 w8HJi8MR49LhBQiIy7GTuDJq2ZFM4MMgPndA91nPntNcwoKnLriAsp+3GHE6dhCw
 ==
X-ME-Sender: <xms:WaZDXXKXyrKPlpfLNRKeG2RX5zO_lNGeK8i10muBmz0YF0H5NUVuwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrleekgdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:WqZDXfQNDXAuYTk6GygGUP5iLxwGoXVKakLl4y-tW7URx3wVO6Sp6A>
 <xmx:WqZDXUOH6RkeV_nwtOZcJzGYSEJGz41zK2vLYwAMbmgeAOSB3sRPJg>
 <xmx:WqZDXRGmi0HH7zSJjCQ9ArgWdzYxdTiE4YalMBOveXuIEwFkzJ0YOQ>
 <xmx:WqZDXexA962Vsu_-Bk--56X9ruoskOpS5SCC6tzEZxUBZ0ZXbzHoZA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E340AE00A2; Thu,  1 Aug 2019 22:56:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-799-g925e343-fmstable-20190729v1
Mime-Version: 1.0
Message-Id: <266be87c-3bf2-4dcb-9d90-8272fbc3b057@www.fastmail.com>
In-Reply-To: <20190802005427.467841-1-taoren@fb.com>
References: <20190802005427.467841-1-taoren@fb.com>
Date: Fri, 02 Aug 2019 12:26:46 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Tao Ren" <taoren@fb.com>, "Rob Herring" <robh+dt@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Joel Stanley" <joel@jms.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH] ARM: dts: aspeed: Add Facebook Wedge40 BMC
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



On Fri, 2 Aug 2019, at 10:24, Tao Ren wrote:
> Add initial version of device tree for Facebook Wedge40 AST2400 BMC
> platform.
> 
> Signed-off-by: Tao Ren <taoren@fb.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-facebook-wedge40.dts  | 141 ++++++++++++++++++
>  2 files changed, 142 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 39a05a10a2a2..dfc1011eb3f2 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1273,6 +1273,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-facebook-cmm.dtb \
>  	aspeed-bmc-facebook-minipack.dtb \
>  	aspeed-bmc-facebook-tiogapass.dtb \
> +	aspeed-bmc-facebook-wedge40.dtb \
>  	aspeed-bmc-facebook-yamp.dtb \
>  	aspeed-bmc-intel-s2600wf.dtb \
>  	aspeed-bmc-inspur-fp5280g2.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts 
> b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
> new file mode 100644
> index 000000000000..764633964ac1
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2018 Facebook Inc.
> +/dts-v1/;
> +
> +#include "aspeed-g4.dtsi"
> +
> +/ {
> +	model = "Facebook Wedge 40 BMC";
> +	compatible = "facebook,wedge40-bmc", "aspeed,ast2400";
> +
> +	aliases {
> +		/*
> +		 * Override the default uart aliases to avoid breaking
> +		 * the legacy applications.
> +		 */
> +		serial0 = &uart5;
> +		serial1 = &uart1;
> +		serial2 = &uart3;
> +		serial3 = &uart4;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart3;
> +		bootargs = "debug console=ttyS2,9600n8 root=/dev/ram rw";
> +	};
> +
> +	memory@40000000 {
> +		reg = <0x40000000 0x20000000>;
> +	};
> +};
> +
> +&wdt1 {
> +	status = "okay";
> +	aspeed,reset-type = "system";
> +};
> +
> +&wdt2 {
> +	status = "disabled";
> +};
> +
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "fmc0";
> +#include "facebook-bmc-flash-layout.dtsi"
> +	};
> +};
> +
> +&uart1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_txd1_default
> +		     &pinctrl_rxd1_default>;
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
