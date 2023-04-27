Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAAB6EFEA4
	for <lists+openbmc@lfdr.de>; Thu, 27 Apr 2023 02:48:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q6HCj46ngz3f5L
	for <lists+openbmc@lfdr.de>; Thu, 27 Apr 2023 10:48:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=Nhnofm2n;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JsdsPX2j;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=Nhnofm2n;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JsdsPX2j;
	dkim-atps=neutral
X-Greylist: delayed 159 seconds by postgrey-1.36 at boromir; Thu, 27 Apr 2023 10:47:43 AEST
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q6HC36Hz1z3cF8
	for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2023 10:47:43 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 00C605C013C;
	Wed, 26 Apr 2023 20:47:42 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Wed, 26 Apr 2023 20:47:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1682556461; x=1682642861; bh=UW
	JOCX1B2KDZ80UCc4U8Vq6bPSbMFeMPMFq4S5CBQZw=; b=Nhnofm2nt1v/yYuo0O
	smBvzt6uhRMxQ46slBb5w9zO1/QhyWlj0glhMLgdJ9z9jx8IJmAetPNMobaGcewn
	K9XZLWKqNHqyHEeLgi5JkZnqar/q0ZNLd78uEUqM3N0OSaM/QrGNOel+BgfSExUb
	adye8m5P8pxyYT+aCsFtOEFKpjbplxFxnZ+URmCBiIzxWJsGKsw0Ydog7jqW8NqG
	ZA2HXmqqQ6NxtXYKoQ7Ruph1H1rwW8O/V+KN2HdYCk9vXCC8yw/UcdllA7sSEVJZ
	cg5kLxODFROOho5z9awuBenAvdfC9Rf95S9OqaGMVqrZqiOEVbsY/iHa06gDXxDS
	Lmhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1682556461; x=1682642861; bh=UWJOCX1B2KDZ8
	0UCc4U8Vq6bPSbMFeMPMFq4S5CBQZw=; b=JsdsPX2jHdEHBnw8tTuiFCkhoM+kx
	TZPuxBJxxJ+GXwSiYOU+d+XJ04Yq4lXDUVHclATIMKJrqcHUSZmT38YTgQsFmdBc
	VoYIUNpA1ffsAqarZZYEjzKasFste6pbh4Vsp29kZi6kTzW0XPMpOUoP62vIqkVT
	XFK4KQbkW9mVMsSG+2iziqwYNW0XrCzryjV8WA1taN9itL4jggK4X6hPzebCVRw7
	aI4+OrSzOlKqJlN/s19I2Y+Y11wd38+j58eM0HyqD3mNNMnXeCDXFrPW5CWPRfjT
	Pkiq0nD7HYkVHiktEGbRX3a3rT75iNjtH6pmfMNMuAruVNjmVO5/hHkGA==
X-ME-Sender: <xms:LcZJZDmOH9d56Q2pCE_feD76edXaF1N19c_3_T1rCoP56nzcdviihQ>
    <xme:LcZJZG3guMQmMiGEar-FSIjeEKDd3_q5jvgB_M-8AsfyHMK5O281VOLyzWv4jiJhb
    d5Sz011wvsuEqivQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduhedgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:LcZJZJrUNT4ThUdPh_59Tjo4OigEkuJBqlGB1PHg_FugnwqwMI4QfQ>
    <xmx:LcZJZLlNyagbUewi8twD8O5zJtN2Diu3HLws7mw_SrjbErmF4jUrqw>
    <xmx:LcZJZB0SWgqtAcp9SLtUXQ-7s9J5VejATrhWu6tqwDIVzM2YKQVuFg>
    <xmx:LcZJZC_3TAeGiNdwa-N2PiOLkb41lnAUn9X4KarmaOVv8qvnekMB-g>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id BEDC01700089; Wed, 26 Apr 2023 20:47:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-374-g72c94f7a42-fm-20230417.001-g72c94f7a
Mime-Version: 1.0
Message-Id: <29618904-ee21-40ff-b35a-b73bffe3e3b0@app.fastmail.com>
In-Reply-To: <20230418061715.124725-1-lintao1890@163.com>
References: <20230418061715.124725-1-lintao1890@163.com>
Date: Thu, 27 Apr 2023 10:17:21 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: lintao1890@163.com, openbmc@lists.ozlabs.org,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] board: ast2600: Add Inspur SCM
 V1 board
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
Cc: LinTao <lintao.lc@inspur.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 18 Apr 2023, at 15:47, lintao1890@163.com wrote:
> From: LinTao <lintao.lc@inspur.com>
>
> AST2600-INSPUR is an Inspur SCM V1 board which is
> equipped with AST2600
>
> Signed-off-by: LinTao <lintao.lc@inspur.com>
> ---
> V1 -> V2:
>     - add a missing '\'
> ---
>  arch/arm/dts/Makefile                    |   3 +-
>  arch/arm/dts/ast2600-inspur-nf5280m7.dts | 190 +++++++++++++++++++++++
>  arch/arm/mach-aspeed/ast2600/Kconfig     |   8 +
>  board/aspeed/ast2600_inspur/Kconfig      |  13 ++
>  board/aspeed/ast2600_inspur/Makefile     |   1 +
>  board/aspeed/ast2600_inspur/inspur.c     |  22 +++
>  6 files changed, 236 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/dts/ast2600-inspur-nf5280m7.dts
>  create mode 100644 board/aspeed/ast2600_inspur/Kconfig
>  create mode 100644 board/aspeed/ast2600_inspur/Makefile
>  create mode 100644 board/aspeed/ast2600_inspur/inspur.c
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 6c34b83336..f62c16b4f1 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -695,7 +695,8 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	ast2600-slt.dtb \
>  	ast2600-tacoma.dtb \
>  	ast2600-intel.dtb \
> -	ast2600-tacoma.dtb
> +	ast2600-tacoma.dtb \
> +	ast2600-inspur-nf5280m7.dtb
> 
>  dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
> 
> diff --git a/arch/arm/dts/ast2600-inspur-nf5280m7.dts 
> b/arch/arm/dts/ast2600-inspur-nf5280m7.dts
> new file mode 100644
> index 0000000000..8210797868
> --- /dev/null
> +++ b/arch/arm/dts/ast2600-inspur-nf5280m7.dts
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright 2023 Inspur Corp.
> +/dts-v1/;
> +
> +#include "ast2600-u-boot.dtsi"
> +
> +/ {
> +	model = "Inspur SCM V1";
> +	compatible = "inspur,nf5280m7-bmc", "aspeed,ast2600";
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x80000000 0x40000000>;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +	};
> +
> +	aliases {
> +		mmc0 = &emmc_slot0;
> +		mmc1 = &sdhci_slot0;
> +		mmc2 = &sdhci_slot1;
> +		spi0 = &fmc;
> +		spi1 = &spi1;
> +		spi2 = &spi2;
> +		ethernet1 = &mac1;
> +	};
> +
> +	cpus {
> +		cpu@0 {
> +			clock-frequency = <1200000000>;
> +		};
> +		cpu@1 {
> +			clock-frequency = <1200000000>;
> +		};
> +	};
> +};
> +
> +&gpio0 {
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> +
> +&uart5 {
> +	u-boot,dm-pre-reloc;
> +	status = "okay";
> +};
> +
> +&sdrammc {
> +	clock-frequency = <400000000>;
> +};
> +
> +&mdio {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_mdio2_default>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	ethphy0: ethernet-phy@0 {
> +		reg = <0>;
> +	};
> +
> +	ethphy1: ethernet-phy@1 {
> +		reg = <0>;
> +	};
> +
> +	ethphy2: ethernet-phy@2 {
> +		reg = <0>;
> +	};
> +
> +	ethphy3: ethernet-phy@3 {
> +		reg = <0>;
> +	};
> +};
> +
> +&mac1 {
> +	status = "okay";
> +	phy-mode = "rgmii";
> +	phy-handle = <&ethphy1>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii2_default>;
> +};
> +
> +&fmc {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fmcquad_default>;
> +	flash@0 {
> +		status = "okay";
> +		spi-max-frequency = <40000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +	};
> +	flash@1 {
> +		status = "okay";
> +		spi-max-frequency = <40000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +	};
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +	multi-master;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c2_default>;
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +	multi-master;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c5_default>;
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +	multi-master;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c6_default>;
> +};
> +
> +&i2c6 {
> +	status = "okay";
> +	multi-master;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c7_default>;
> +};
> +
> +&i2c7 {
> +	status = "okay";
> +	multi-master;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c8_default>;
> +};
> +
> +&i2c8 {
> +	status = "okay";
> +	multi-master;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c9_default>;
> +};
> +
> +&i2c9 {
> +	status = "okay";
> +	multi-master;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c10_default>;
> +};
> +
> +&i2c12 {
> +	status = "okay";
> +	multi-master;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c13_default>;
> +};
> +
> +&i2c13 {
> +	status = "okay";
> +	multi-master;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c14_default>;
> +};
> +
> +&hace {
> +	u-boot,dm-pre-reloc;
> +	status = "okay";
> +};
> +
> +&acry {
> +	u-boot,dm-pre-reloc;
> +	status = "disabled";
> +};
> diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig 
> b/arch/arm/mach-aspeed/ast2600/Kconfig
> index f5852afa77..db177399b9 100644
> --- a/arch/arm/mach-aspeed/ast2600/Kconfig
> +++ b/arch/arm/mach-aspeed/ast2600/Kconfig
> @@ -51,6 +51,13 @@ config TARGET_QUALCOMM_DC_SCM_V1
>  	  QUALCOMM-DC-SCM-V1 is a Qualcomm DC-SCM V1 board which is
>  	  equipped with AST2600.
> 
> +config TARGET_AST2600_INSPUR
> +	bool "AST2600-INSPUR"
> +	depends on ASPEED_AST2600
> +	help
> +	  AST2600-INSPUR is an Inspur SCM V1 board which is
> +	  equipped with AST2600.
> +
>  endchoice
> 
>  source "board/aspeed/evb_ast2600/Kconfig"
> @@ -59,5 +66,6 @@ source "board/aspeed/slt_ast2600/Kconfig"
>  source "board/aspeed/ast2600_ibm/Kconfig"
>  source "board/aspeed/ast2600_intel/Kconfig"
>  source "board/qualcomm/dc-scm-v1/Kconfig"
> +source "board/aspeed/ast2600_inspur/Kconfig"
> 
>  endif
> diff --git a/board/aspeed/ast2600_inspur/Kconfig 
> b/board/aspeed/ast2600_inspur/Kconfig
> new file mode 100644
> index 0000000000..ef11a01bcc
> --- /dev/null
> +++ b/board/aspeed/ast2600_inspur/Kconfig
> @@ -0,0 +1,13 @@
> +if TARGET_AST2600_INSPUR
> +
> +config SYS_BOARD
> +	default "ast2600_inspur"
> +
> +config SYS_VENDOR
> +	default "aspeed"
> +
> +config SYS_CONFIG_NAME
> +	string "board configuration name"
> +	default "ast2600_inspur"
> +
> +endif
> diff --git a/board/aspeed/ast2600_inspur/Makefile 
> b/board/aspeed/ast2600_inspur/Makefile
> new file mode 100644
> index 0000000000..8af8692f3c
> --- /dev/null
> +++ b/board/aspeed/ast2600_inspur/Makefile
> @@ -0,0 +1 @@
> +obj-y += inspur.o
> diff --git a/board/aspeed/ast2600_inspur/inspur.c 
> b/board/aspeed/ast2600_inspur/inspur.c
> new file mode 100644
> index 0000000000..044a7c17c1
> --- /dev/null
> +++ b/board/aspeed/ast2600_inspur/inspur.c
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2023 Inspur Corp.
> + */
> +
> +#include <common.h>
> +#include <asm/io.h>
> +
> +#define AST_GPIO_BASE		(0x1E780000)
> +#define AST_GPIOABCD_DRCTN	(AST_GPIO_BASE + 0x004)
> +
> +int board_late_init(void)
> +{
> +	u32 direction;
> +
> +	/* GPIOB[2] output*/
> +	direction = readl(AST_GPIOABCD_DRCTN);
> +	direction |= 0x700;
> +	writel(direction, AST_GPIOABCD_DRCTN);

Why?

And why do it this way rather than go through the gpio subsystem?

Andrew
