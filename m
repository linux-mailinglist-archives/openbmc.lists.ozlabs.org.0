Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C483BD72A
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 06:22:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dPzq3NnQzDqkJ
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 14:22:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="aMjVY6Vi"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IlnmRwen"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dPgM4D9QzDqZn
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 14:08:30 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A82CD22221;
 Wed, 25 Sep 2019 00:08:26 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 00:08:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=Zalv6S3xlfdeKNUROTIlMVSWmSAuKBl
 n5rDL7vl3qfc=; b=aMjVY6ViEKsrkpCrwKqqhyQkVKI2IfbfI49MNwTtlbdxGDT
 PrgoaGyF3IhNBDsaw5djSywF69BaLdfqMwOQWxqHm20OhORMg2WiFiiAmY3tP8CQ
 0r7dlNW+klZFSdGpG0D6ZdY9OUsHAVBgeuAUduqHAcLs++ujXSFwG6dbUKU2rxtH
 iactIX3oV4RMzA/j3IU022nSJz0DCQkuG3zrGOCd0SzBL7DHKrtfeSg9wimLF+55
 7FFUL8I0yOeo3V0Y9KbeZ8Qceyqk3wx6aTnOp9z2BY9GkD6Mv+pGY7HZYkwvXDrd
 Lg6lwfKl60BuUQ19BRJGA182znMqOyU3uOl4w8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Zalv6S
 3xlfdeKNUROTIlMVSWmSAuKBln5rDL7vl3qfc=; b=IlnmRwenb+Q/LJtvQIijr9
 O0zTHr1PrXj2bQB6NjNDC49FU7wg7xwQ/L6ckD51xwCCMBaxIGRZ+vtmid5TFC2y
 LqAUXiLlTFa7hC9E5KXDUM49fg5YuyeTOAUtQFb1aUufUlZzRa02ExvNe5HS8GbB
 pFD7IXUoIqU3V/Ev9lDOmFB6XPVu2r+4kkCJjURFAsYJ0dA6GtoZkwrcscPvlj3z
 To8HOSIrfnanTTdca8s2luX2LeKiY4kV06XABooH+9FD/o/uRgipMgM+35uSQOC+
 n47afxjxTzyR9fkeX7vKvic8+fgdFyB+BPy5kWmGYJuyfzNnnzMtMJWdCUKNLsxA
 ==
X-ME-Sender: <xms:OeiKXb2MLDBeay7eafHpRIueksPYLbYYmgg57TRKzaniXZb9EGfeBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedugdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:OeiKXfcXuMgygvwlzMXr1UFFy8Brwj-q8OLAmGq_8Vo1lkQYCdNrlQ>
 <xmx:OeiKXYUgwvgnSjgpE3YrKbxn5s1PrZ9OJaTMG7bPfDAElb1DtVw0eA>
 <xmx:OeiKXV_ou8jDMlIoBAQ0UCinBHPu2IDj2MMcin8cRuo4qiwZBUHvNw>
 <xmx:OuiKXYPRRRWgkuPG2-jIMeZoozHFV4Q1S6dPRe8xm9IjPrKLgqVuGQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C9D18E00AF; Wed, 25 Sep 2019 00:08:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <e6503648-afa7-48ea-b803-5768512fa493@www.fastmail.com>
In-Reply-To: <20190924194759.26854-8-bradleyb@fuzziesquirrel.com>
References: <20190924194759.26854-1-bradleyb@fuzziesquirrel.com>
 <20190924194759.26854-8-bradleyb@fuzziesquirrel.com>
Date: Wed, 25 Sep 2019 13:39:08 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_linux_dev-5.3_07/10]_ARM:_dts:_aspeed:_Add_Raini?=
 =?UTF-8?Q?er_system?=
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



On Wed, 25 Sep 2019, at 05:17, Brad Bishop wrote:
> Rainier is a new IBM server with POWER host processors and an AST2600
> BMC.
> 
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
> v3:
>   - removed i2c, mac
>   - moved reserved memory
>   - set correct memory size
> v2:
>   - reordered rainier DT elements (alphabetized).
>   - added rainier rtc, lpc-ctl, reserved memory, mac devices
> ---
>  arch/arm/boot/dts/Makefile                   |  1 +
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 57 ++++++++++++++++++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 5af075c2f819..3ad9706337a2 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1278,6 +1278,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-facebook-wedge40.dtb \
>  	aspeed-bmc-facebook-wedge100.dtb \
>  	aspeed-bmc-facebook-yamp.dtb \
> +	aspeed-bmc-ibm-rainier.dtb \
>  	aspeed-bmc-intel-s2600wf.dtb \
>  	aspeed-bmc-inspur-fp5280g2.dtb \
>  	aspeed-bmc-lenovo-hr630.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts 
> b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> new file mode 100644
> index 000000000000..f56a7dddba62
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -0,0 +1,57 @@
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
> +		reg = <0x80000000 0x40000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		flash_memory: region@BB000000 {
> +			no-map;
> +			reg = <0xBB000000 0x04000000>; /* 64M */

Probably should have warned you that the region needs to be naturally aligned, so
the address should be 0xb8000000.

Andrew
