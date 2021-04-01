Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF12350B0A
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 02:05:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9k3Q0B14z3047
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 11:05:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=jdODCwzi;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NSNeQim9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=jdODCwzi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=NSNeQim9; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9k341l11z2yxF;
 Thu,  1 Apr 2021 11:05:19 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6D8E65C0109;
 Wed, 31 Mar 2021 20:05:13 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 31 Mar 2021 20:05:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=GvzBUH2Hs9Nfe6Vfb9E7l/3eeG+oJ65
 EclkE5CrsMAI=; b=jdODCwziEiPpWXZn2ZniTKsQoi++gVH9to/upnq06G+Ev73
 1qQmSGgMQW1E7Py65eQ/2UIVCwBaWcRP6ElgXny+PXnqC5JKkPkri/QMCGIvAlCI
 S+L1P6AuB37TpoorNDnMozxDvxpuS4CPW/yWdXV7JDlxXqGm9WbWbP7KaBoOJR6W
 tIDbClRkZHR7pB5DdL/qD++gVMRMir2ycI7UHVLEH/JKwE3q3V+TYzfRpAVvPDVJ
 fUpVlk5+1nlVaJ7Q979/HMNT0XJBxporQU1UXhCavC23jKn0JF0YB6D4jx3MIxdZ
 VedpHwpNdVEZtJZw/8cjvxQdRxFYdT3FT/xLp4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GvzBUH
 2Hs9Nfe6Vfb9E7l/3eeG+oJ65EclkE5CrsMAI=; b=NSNeQim9CSsB9Fdwt7/RQ/
 ax+w3DGMdSsWYgNPal98p5OMxNQgQB6074bnzgzcUe1n0OHkDlQiXrSntjDUKGFM
 3+FAcLPVG2WZbjrp++LWr64BcQe5AdXiJYLgSBRQAYgMrGHwgeXpV7qcu2os4i/I
 GI7nkrzZoeKd49q6vMdhb4V2LXePSsXshNzE1xFBQlQvn1+uPExagj17uzNWJeLS
 8vEVFCm25JoeLWWtxqIyrGBdsGJfrFsLfFR6rFqk3UwDpGrcqHusoAD5iGfezIu8
 D/Xo4ZznuTX6B551xnyNChrkqdWK/bh/2qBIoAv4YwnY8uJiGCSVpmvK3KjZyv9g
 ==
X-ME-Sender: <xms:OA5lYEa6H2ifTOGrSRJvdklQvGGCY2GqgVXPQwArvcRtHSi8gZfBAA>
 <xme:OA5lYPZPW4sdjKIrEP71Ea-h7749R8WfyZx7vSsPULGlcUPlCrAHTZBSAPcTEjJ4Q
 UAv-otZTDDyafN7bg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeifedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepudfftddvveekfffgteffffeuveegjeelgefhffejtdehtdfhlefgkeef
 hfefkeeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:OA5lYO9n4GH9iYobVsg2u5saiCpr308VsDZLbeJmLEQY9vmp4ZNybQ>
 <xmx:OA5lYOpmJKEgB0jQRGuISRjI47Y-ubcem33oLkkWdlRmq5Tqlac-UA>
 <xmx:OA5lYPrR8VjFBQ9GNvXQ8VI4aWux-xy_6Q-7UqW9fWiASCPIx2_XbQ>
 <xmx:OQ5lYABEXRh5Ky8wVg4hfMV407z9RES5SvGiADBhgxh_EepOELDHRA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 42E44A00073; Wed, 31 Mar 2021 20:05:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <815c666b-d657-4d0a-bea4-d2e182d9e5d1@www.fastmail.com>
In-Reply-To: <20210330002338.335-4-zev@bewilderbeest.net>
References: <20210330002338.335-1-zev@bewilderbeest.net>
 <20210330002338.335-4-zev@bewilderbeest.net>
Date: Thu, 01 Apr 2021 10:34:51 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Zev Weiss" <zev@bewilderbeest.net>, "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH 3/3] ARM: dts: aspeed: add ASRock E3C246D4I BMC
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 30 Mar 2021, at 10:53, Zev Weiss wrote:
> This is a relatively low-cost AST2500-based Xeon E-2100/E-2200 series
> mini-ITX board that we hope can provide a decent platform for OpenBMC
> development.
> 
> This initial device-tree provides the necessary configuration for
> basic BMC functionality such as host power control, serial console and
> KVM support, and POST code snooping.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  .../boot/dts/aspeed-bmc-asrock-e3c246d4i.dts  | 188 ++++++++++++++++++
>  1 file changed, 188 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts 
> b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> new file mode 100644
> index 000000000000..27b34c3cf67a
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> @@ -0,0 +1,188 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/{
> +	model = "ASRock E3C246D4I BMC";
> +	compatible = "aspeed,ast2500";
> +
> +	aliases {
> +		serial4 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";
> +	};
> +
> +	memory@80000000 {
> +		reg = <0x80000000 0x20000000>;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		heartbeat {
> +			/* BMC_HB_LED_N */
> +			gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "timer";
> +		};
> +
> +		system-fault {
> +			/* SYSTEM_FAULT_LED_N */
> +			gpios = <&gpio ASPEED_GPIO(Z, 2) GPIO_ACTIVE_LOW>;
> +			panic-indicator;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		uid-button {
> +			label = "uid-button";
> +			gpios = <&gpio ASPEED_GPIO(F, 1) GPIO_ACTIVE_LOW>;
> +			linux,code = <ASPEED_GPIO(F, 1)>;
> +		};
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>,
> +			<&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>, <&adc 9>,
> +			<&adc 10>, <&adc 11>, <&adc 12>;
> +	};
> +};

You're hooking up the ADC lines to the iio-hwmon bridge...
> +
> +&adc {
> +	status = "okay";
> +};

But you haven't requested the ADC lines from pinmux here.

It will *happen* to work as expected because ADC is the default mux 
state for the pins, but by not requesting the lines you're leaving the 
pins available for a conflicting request, which can be annoying to 
debug.

> +
> +&kcs3 {
> +	status = "okay";
> +	aspeed,lpc-io-reg = <0xca2>;
> +};

Given you need KCS support, do you mind testing my KCS series?

https://lore.kernel.org/linux-arm-kernel/20210319062752.145730-1-andrew@aj.id.au/

The cover letter got detached, and is here:

https://lore.kernel.org/linux-arm-kernel/20210319061952.145040-1-andrew@aj.id.au/

Andrew
