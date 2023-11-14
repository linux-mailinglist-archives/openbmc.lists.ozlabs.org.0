Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 779BD7EB942
	for <lists+openbmc@lfdr.de>; Tue, 14 Nov 2023 23:22:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=HPOEZNW9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVLQF2vmDz3cPy
	for <lists+openbmc@lfdr.de>; Wed, 15 Nov 2023 09:22:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=HPOEZNW9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVLPX5P9Lz2xpp;
	Wed, 15 Nov 2023 09:21:52 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:7e5d:5300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 63A02674;
	Tue, 14 Nov 2023 14:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1700000510;
	bh=sRrbeCCCzY9xM1mWd8ERp3RPs7GUB97WTpkWh8EghhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HPOEZNW93Fq9GrYkju2TpGGlbFbv3avrcRzm8gForP13DBD6ICZSf4bUcuJIdYdnx
	 AtZuwmGrp+GjOk761KKWaTh99VknxAK5ZdFF+PqoOrqq5Zsu0XWVISgUG5w2+idsy6
	 PFCrSTyJrXu6Nbz8Wr/81OrfiRHoe33zTU9HqjKs=
Date: Tue, 14 Nov 2023 14:21:49 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add ASRock E3C256D4I BMC
Message-ID: <b06b2b9e-8185-41e8-89b5-e6bc8d09d948@hatter.bewilderbeest.net>
References: <20231114112722.28506-4-zev@bewilderbeest.net>
 <20231114112722.28506-6-zev@bewilderbeest.net>
 <cde26249-1d47-496f-b198-a0c4c02bed5c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <cde26249-1d47-496f-b198-a0c4c02bed5c@linaro.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Nov 14, 2023 at 12:35:37PM PST, Krzysztof Kozlowski wrote:
>On 14/11/2023 12:27, Zev Weiss wrote:
>> Like the E3C246D4I, this is a reasonably affordable off-the-shelf
>> mini-ITX AST2500/Xeon motherboard with good potential as an OpenBMC
>> development platform.  Booting the host requires a modicum of eSPI
>> support that's not yet in the mainline kernel, but most other basic
>> BMC functionality is available with this device-tree.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> ---
>>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>>  .../aspeed/aspeed-bmc-asrock-e3c256d4i.dts    | 314 ++++++++++++++++++
>>  2 files changed, 315 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dts
>>
>> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
>> index d3ac20e316d0..3398ee53f034 100644
>> --- a/arch/arm/boot/dts/aspeed/Makefile
>> +++ b/arch/arm/boot/dts/aspeed/Makefile
>> @@ -9,6 +9,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>  	aspeed-bmc-ampere-mtmitchell.dtb \
>>  	aspeed-bmc-arm-stardragon4800-rep2.dtb \
>>  	aspeed-bmc-asrock-e3c246d4i.dtb \
>> +	aspeed-bmc-asrock-e3c256d4i.dtb \
>>  	aspeed-bmc-asrock-romed8hm3.dtb \
>>  	aspeed-bmc-bytedance-g220a.dtb \
>>  	aspeed-bmc-delta-ahe50dc.dtb \
>> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dts
>> new file mode 100644
>> index 000000000000..4c55272afd4f
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dts
>> @@ -0,0 +1,314 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/dts-v1/;
>> +
>> +#include "aspeed-g5.dtsi"
>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>> +#include <dt-bindings/i2c/i2c.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/watchdog/aspeed-wdt.h>
>> +
>> +/{
>> +	model = "ASRock E3C256D4I BMC";
>> +	compatible = "asrock,e3c256d4i-bmc", "aspeed,ast2500";
>> +
>> +	aliases {
>> +		serial4 = &uart5;
>> +
>> +		i2c20 = &i2c2mux0ch0;
>> +		i2c21 = &i2c2mux0ch1;
>> +		i2c22 = &i2c2mux0ch2;
>> +		i2c23 = &i2c2mux0ch3;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = &uart5;
>> +		bootargs = "console=tty0 console=ttyS4,115200 earlycon";
>
>Drop bootargs.
>

Ack.

>> +	};
>> +
>> +	memory@80000000 {
>> +		reg = <0x80000000 0x20000000>;
>> +	};
>> +
>> +	leds {
>> +		compatible = "gpio-leds";
>> +
>> +		heartbeat {
>
>It does not look like you tested the DTS against bindings. Please run
>`make dtbs_check W=1` (see
>Documentation/devicetree/bindings/writing-schema.rst or
>https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
>for instructions).
>

Au contraire -- I did, and it exited 0 with no output, which I 
interpreted as a clean pass.  Are there particular shortcomings beside 
what you've already pointed out that you would have expected it to flag?

>> +			gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
>> +			linux,default-trigger = "timer";
>
>Missing function and color.
>

Ack.


Thanks,
Zev

