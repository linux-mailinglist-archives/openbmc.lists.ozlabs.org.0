Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9676552E63F
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 09:27:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4JGM3NcKz3bkF
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 17:27:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=R9UtXIHm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=R9UtXIHm; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4JFx1z82z306J
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2022 17:27:16 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 4EFD04FC;
 Fri, 20 May 2022 00:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1653031632;
 bh=mLzACvbOtmnIj6ZjHkVM+gyhvinl2jdYQRYC9AQE3T4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R9UtXIHm+aEQbjqtT0roKP7QN/4Vk51xbCbFPy0AZa5G/crhLlNHG7iBK9BrhwuWz
 Azzc4uF5uY33IMgrJe6DreUfliBtEXTBHTBALxVMHEOEmcHKgTN2ZFEdyd1ENE4j0k
 1di7XXHAlRR9UOW6heg/lca31BB/4lKAe1Bl8tPI=
Date: Fri, 20 May 2022 00:27:08 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v3 1/3] arm/dts: Add
 Genesis3 board
Message-ID: <YodCzP3iDv1NtDvu@hatter.bewilderbeest.net>
References: <20220519150719.22338-1-patrick.rudolph@9elements.com>
 <20220519150719.22338-2-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519150719.22338-2-patrick.rudolph@9elements.com>
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
Cc: christian.walter@9elements.com, openbmc@lists.ozlabs.org, takken@us.ibm.com,
 joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 19, 2022 at 08:07:17AM PDT, Patrick Rudolph wrote:
> Add devicetree source file. It uses the evb-ast2500 board files.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  arch/arm/dts/Makefile                 |  1 +
>  arch/arm/dts/ast2500-ibm-genesis3.dts | 28 +++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 arch/arm/dts/ast2500-ibm-genesis3.dts
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index a79f885f54..4b026296f0 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -677,6 +677,7 @@ dtb-$(CONFIG_ARCH_BCM6858) += \
>  dtb-$(CONFIG_ARCH_ASPEED) += \
>  	ast2400-evb.dtb \
>  	ast2500-evb.dtb \
> +	ast2500-ibm-genesis3.dtb \

It looks like (with the exception of ast2600-intel.dts, which is an odd 
one out that I'd think we wouldn't want to emulate) the existing 
convention is to name these as just 'ast2x00-systemname' (without the 
vendor name), so it'd be nice to follow that pattern.

Also, this patch is now a bit out of date w.r.t. the current 
v2019.04-aspeed-openbmc branch and no longer applies cleanly; rebasing 
onto the current upstream branch would make it a bit more convenient 
(not that it's a terribly complex merge conflict).

>  	ast2600a0-evb.dtb \
>  	ast2600a1-evb.dtb \
>  	ast2600-bletchley.dtb \
> diff --git a/arch/arm/dts/ast2500-ibm-genesis3.dts b/arch/arm/dts/ast2500-ibm-genesis3.dts
> new file mode 100644
> index 0000000000..932b598063
> --- /dev/null
> +++ b/arch/arm/dts/ast2500-ibm-genesis3.dts
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * IBM Genesis3
> + *
> + * Copyright (C) 2022 9elements GmbH
> + */
> +
> +#include "ast2500-evb.dts"
> +
> +/ {
> +	model = "IBM Genesis3";
> +	compatible = "ibm,genesis3-bmc", "aspeed,ast2500";
> +};
> +
> +&spi1 {
> +	status = "disabled";
> +};
> +
> +&fmc {
> +	flash@0 {
> +		compatible = "spi-flash", "spansion,s25fl256l";

The usual approach with compatible strings is to go from more specific 
to more generic (so that you get whatever available driver support is 
most appropriately tailored to the precise hardware in question) -- 
these should probably be in the opposite order.

> +	};
> +
> +	flash@1 {
> +		compatible = "spi-flash", "spansion,s25fl256l";

...and likewise here of course.

> +	};
> +};
> +
> -- 
> 2.35.3
> 
