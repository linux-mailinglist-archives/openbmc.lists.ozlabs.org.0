Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3397ED9A8
	for <lists+openbmc@lfdr.de>; Thu, 16 Nov 2023 03:40:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Ncnoulht;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SW44z3kjRz3cWC
	for <lists+openbmc@lfdr.de>; Thu, 16 Nov 2023 13:40:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Ncnoulht;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 141113 seconds by postgrey-1.37 at boromir; Thu, 16 Nov 2023 13:39:27 AEDT
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SW44H4yr4z2yV3;
	Thu, 16 Nov 2023 13:39:27 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:7e5d:5300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id C667442AF;
	Wed, 15 Nov 2023 18:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1700102363;
	bh=4q1q7lhezpq/0nWCFgR7MsiQUEeQlSbd2dM5jhV/qog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NcnoulhtqbhUn5EZOFj7D+/JbKkpUwqvwcZxEHvD6aC/mZ341nKINT4OE0Eixip+T
	 xZZNg47oC1rErtlZogQ5oequAzUi4qRH86nRuOsULxM+SxfE/sAaz6W88cBOxU9qzN
	 iWBacofijjfo1Idm+DA2u1CNr2a6U9pT77cZ0KlA=
Date: Wed, 15 Nov 2023 18:39:21 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add ASRock E3C256D4I BMC
Message-ID: <1e1c1493-d3f5-4c96-b85f-158d720b2ab5@hatter.bewilderbeest.net>
References: <20231114112722.28506-4-zev@bewilderbeest.net>
 <20231114112722.28506-6-zev@bewilderbeest.net>
 <cde26249-1d47-496f-b198-a0c4c02bed5c@linaro.org>
 <e766e663-0985-4a2e-8023-26ad0228157d@hatter.bewilderbeest.net>
 <863a0fe2-c258-47d9-8563-6f12bb55b4ad@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <863a0fe2-c258-47d9-8563-6f12bb55b4ad@linaro.org>
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

On Wed, Nov 15, 2023 at 04:13:29AM PST, Krzysztof Kozlowski wrote:
>On 14/11/2023 23:37, Zev Weiss wrote:
>
>>
>>>> +	};
>>>> +
>>>> +	memory@80000000 {
>>>> +		reg = <0x80000000 0x20000000>;
>>>> +	};
>>>> +
>>>> +	leds {
>>>> +		compatible = "gpio-leds";
>>>> +
>>>> +		heartbeat {
>>>
>>> It does not look like you tested the DTS against bindings. Please run
>>> `make dtbs_check W=1` (see
>>> Documentation/devicetree/bindings/writing-schema.rst or
>>> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
>>> for instructions).
>
>The node names are clearly wrong and you got output. It's easy to spot
>if your patch worked in the first place:
>
> fatal error: dt-bindings/watchdog/aspeed-wdt.h: No such file or directory
>

The patch series was based on Linus's tree at the time I sent it; that 
file was added in commit 9931be2cfca3 ("dt-bindings: watchdog: 
aspeed-wdt: Add aspeed,reset-mask property"), which was included in the 
6.7-rc1 tag, FWIW.

After some debugging I discovered that the reason I wasn't getting any 
output from dtbs_check was that I had neglected to specify ARCH=arm when 
invoking it, and when that defaulted to x86 it silently did a whole 
bunch of nothing.  It might be nice if something emitted some sort of 
warning when invoked with nonsensical parameters (especially if I've 
explicitly specified a dtstree=... argument pointing to arch/arm/...), 
but oh well.

After re-running it with ARCH=arm, it produced a fairly voluminous spew 
of output, though after combing through it all as best I can tell only 
one or two lines of it actually pertain to the .dts in question itself 
(the vast majority being from a .dtsi it #includes).  I've fixed the one 
remaining issue it reported (missing #address-cells and #size-cells on 
the FRU eeprom node) and will post a v2 in the next few days (and 
likewise on the spc621d8hm3 series).


Zev

