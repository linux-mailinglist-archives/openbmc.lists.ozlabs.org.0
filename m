Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9987153A6
	for <lists+openbmc@lfdr.de>; Tue, 30 May 2023 04:28:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVbsn0mWMz3f6g
	for <lists+openbmc@lfdr.de>; Tue, 30 May 2023 12:28:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=HLCZUEap;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=WFMWT36S;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=HLCZUEap;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=WFMWT36S;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVbs708gsz3bh9
	for <openbmc@lists.ozlabs.org>; Tue, 30 May 2023 12:27:37 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 2ECC35C00FE;
	Mon, 29 May 2023 22:27:31 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Mon, 29 May 2023 22:27:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1685413651; x=1685500051; bh=IV
	XdeDF7VxbDtjundHUaafq2WA4pYCU2vhQndlohP6M=; b=HLCZUEapzIqodsImC1
	ib29ycUXy/hLgedatYmePJ9WE6TYRHYX83KAFpFKPNoCvJAS0AFTW+DtsarvxC2k
	fZEtdjR1b0Ldut5h9J7ZrZMiZ6JavKptrB3Y9JJuTzvTEULycggsqJH9DmAaBvYu
	Lix6R072tsPW8qBjZLaAVeFmdfQEiLtMJSw1FEdc2G2udZzdSBAf/ROCh0zost5a
	jYe0NVAfuVSYEGiObrMRYcEAZcwDjWxK6wlhryKM/dDNvtEmBNN1GRAQ6xL9jJP3
	v+t5RK/MhknQANdj8NmXX80Fn3jl/7OzfT9rz1pxRJwQivjd/EevGB8b7acPyPy+
	4OPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685413651; x=1685500051; bh=IVXdeDF7VxbDt
	jundHUaafq2WA4pYCU2vhQndlohP6M=; b=WFMWT36SrRnA7gkmY9IEP7cTozbkC
	3VHaTB0c5og155drCb1pfYD/crefRuAhYrNZCxhb4wJQOwjyzMyc0LYzBbh/GDW9
	ZYNOQrnWhgS4tQtu5lTs5ZCf5dZV1BU6zFu/KRpA8Nt1GTpzkKEfwZyhf8sLNBRQ
	wCQHcSaSkW0N9pvIjgy5KS+/d/dhj3CqMB59lL6CxaKLxnN6qS2ZoUqqr1dY1OnG
	l4bV05i0IJfh6eN31lU1U47dWY0Om3BgxQwZiFtP1sq+TASXTWWURwavllQ4op82
	1/zpRmePmwx5/3t5BQTLLf9+hRjuEOjoUqOf4aAsYdhGzAkp+XFXWvhDw==
X-ME-Sender: <xms:El91ZGL7uHQ8hBMcRx-8U91Ts9KFmHjUBTZrgGcAEzPsgZLbtE86Zw>
    <xme:El91ZOIw6-Y9lRBV9bfBoK1AHhf-9wqAlWoCIqJMx41WFVejbnJ7Fnjye15ycm_XN
    fB4jF5prmB7ErRtyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekiedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:El91ZGs0x6Oiij6PghMAolpnhxBkJLTOTDxabMrSl9yCl9fB2ayYvQ>
    <xmx:El91ZLbfcBYW7-ghlG-GlaQNp-rT0QtLK26EgJ37jLBmIHD3zzfF7Q>
    <xmx:El91ZNaIGEMEXIqOq7vEhWuRBSeJ8k3-epeEFf_W-SVzlyscBONo5A>
    <xmx:E191ZMzrI3ruxRy8P-T5s1wq6PtUNjK9LBbQSZkk3vJI2GGaoonYFQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3225F1700090; Mon, 29 May 2023 22:27:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-441-ga3ab13cd6d-fm-20230517.001-ga3ab13cd
Mime-Version: 1.0
Message-Id: <0602812b-8c48-4d2c-8c2b-1fb6d14ebc57@app.fastmail.com>
In-Reply-To: <20230519094316.845479-1-lintao1890@163.com>
References: <20230519094316.845479-1-lintao1890@163.com>
Date: Tue, 30 May 2023 11:57:09 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: lintao1890 <lintao1890@163.com>, openbmc@lists.ozlabs.org,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v4] board: ast2600: Add Inspur SCM
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

Hi LinTao,

On Fri, 19 May 2023, at 19:13, lintao1890@163.com wrote:
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
> V2 -> V3:
>     - use gpio subsystem
> ---
> V3 -> V4:
>     - fix style problems
> ---
>  arch/arm/dts/Makefile                    |   3 +-
>  arch/arm/dts/ast2600-inspur-nf5280m7.dts | 190 +++++++++++++++++++++++
>  arch/arm/mach-aspeed/ast2600/Kconfig     |   8 +
>  board/aspeed/ast2600_inspur/Kconfig      |  13 ++
>  board/aspeed/ast2600_inspur/Makefile     |   1 +
>  board/aspeed/ast2600_inspur/inspur.c     |  18 +++
>  6 files changed, 232 insertions(+), 1 deletion(-)
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

Shouldn't the `reg` value match the unit address?

> +	};
> +
> +	ethphy2: ethernet-phy@2 {
> +		reg = <0>;

Shouldn't the `reg` value match the unit address?

> +	};
> +
> +	ethphy3: ethernet-phy@3 {
> +		reg = <0>;

Shouldn't the `reg` value match the unit address?

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
> index 0000000000..75edcd9a91
> --- /dev/null
> +++ b/board/aspeed/ast2600_inspur/inspur.c
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2023 Inspur Corp.
> + */
> +
> +#include <common.h>
> +#include <asm/io.h>
> +#include <asm/gpio.h>
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +int board_late_init(void)
> +{
> +	/* GPIOB[2] output low*/

This would be a much better comment if it explained *why*. The code already tells us that you're pulling B2 low.

> +	gpio_request(ASPEED_GPIO(B, 2), "");
> +	gpio_direction_output(ASPEED_GPIO(B, 2), GPIO_ACTIVE_LOW);
> +
> +	return 0;
> +}
> -- 
> 2.34.1

Thanks for switching to using the GPIO subsystem.

Andrew
