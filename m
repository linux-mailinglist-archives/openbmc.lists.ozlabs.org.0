Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB234A6991B
	for <lists+openbmc@lfdr.de>; Wed, 19 Mar 2025 20:23:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHzC340Zyz3c9D
	for <lists+openbmc@lfdr.de>; Thu, 20 Mar 2025 06:23:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742412202;
	cv=none; b=bO4tWGVqQlQRmJhufloxmDroQy7WGvQY22sO7z4b6mMxTnLj6o6RyAIwIY+Uc/frqQkGFC5dC+dR6rUa2p+YqeEfKH2Yo0HLYBmI3I3hCgMrsyTexqq5P+eKdJ2MOQYloLyLpzHUOtNrQwAlPTFyS/BjVbR4+cdl09BviWbRGyyJg3Lzj1UKDX0ADyL2AFJbMCs1QoV3uhg0tenjx4zw4DPftx9YyUvzEk6BEk1V6SaOe0TVPKPRnRgLtIdEMDG0VF9Zbbjz7X6q94ddq4qJKSbfy8Bp5CR6dLeSwHLLfjDo0DtCRukRYFVfRfO+WAYgt62CVLBOGlMap9nr0FkIwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742412202; c=relaxed/relaxed;
	bh=k/HZQ3Zahl7KcvExRpxIJjr5IKy9aN8frbDhjqdWNxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iI5EXR1WZR6n2er/N8fFco7Vq4JOdnytzZ1h+1wUuA66+aenWEoqPNi934w7YGVkLRujkjo3qfLXJllgFx86XFrWjiy3OWjDej+/oEmtPxbLhEV7WxZ1t8Xwe/PgCkSIFgjTqCuzO8/HeQKQfhi+H8pD+NxPXsyg3JXFP2SZy9K0Olh17sh0c1ckSOTSOIXF5+YezvckTMY9uPpVMgvLHbwQKyvAGSKJlKkhrfg7jDiyqwB4tEggk5nAYqJArxOcb10ksE3jAzs4enITKHMHYMFz/rhN2uTMvhJlfqUzxcwHJOgn+aUbOxGseTvm3pw1O1ldCZglh5mey28as4oC8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DJcjSaFg; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DJcjSaFg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHzBx6zCcz2yyT;
	Thu, 20 Mar 2025 06:23:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C5DB5C6144;
	Wed, 19 Mar 2025 19:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD5FC4CEE9;
	Wed, 19 Mar 2025 19:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742412199;
	bh=r/XHbPpCDJg8LK6akBmJpvgVHJpTE1lx9iFi1+FW9MU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DJcjSaFg1WzjsfwN3S18h/TNsv+xT7Mfh/G3Ev/9JixtH5vs/cqkDaL5bIq0bSPp8
	 CVGw9HXbJNMdxd0hCCo41zii/BvmkX9CbQ8tKJ1revkGZxxa/VlFf4P25TYt+xiJob
	 4mI9hyx1WBLYCFfuv276gPhY3WqUZz5twwHydHId59OIiv1SLO6v1b6s207i2iKVvL
	 roAKJa9XUgMVWf3hMsavNsfosOoQDpwdFOfw5kWZV1yWG2gnhyc6Fzvhvya0yEzahb
	 nXziJePKSbeQQAjtDLL/yMzmb1OsTUzF1+VJtBTfa8ygzxaZ7455C7bccnu4BoCp4Z
	 n2Zf1cERFJOlA==
Message-ID: <b75a5c14-f399-45e2-80f3-923e7afe78ab@kernel.org>
Date: Wed, 19 Mar 2025 20:23:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add Initial device tree for AMD
 Onyx Platform
To: Rajaganesh Rathinasabapathi <rrathina@amd.com>,
 Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
 andrew@codeconstruct.com.au
References: <20250318174730.1921983-1-Rajaganesh.Rathinasabapathi@amd.com>
 <20250318174730.1921983-2-Rajaganesh.Rathinasabapathi@amd.com>
 <af75c352-0010-4c58-b8bc-ac0d02337d1a@kernel.org>
 <8c7be61d-d5e4-4f7f-a995-06cf856a84ae@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <8c7be61d-d5e4-4f7f-a995-06cf856a84ae@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, jothayot@amd.com, robh+dt@kernel.org, Supreeth Venkatesh <supreeth.venkatesh@amd.com>, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 19/03/2025 17:41, Rajaganesh Rathinasabapathi wrote:
> On 3/18/25 23:44, Krzysztof Kozlowski wrote:
>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>
>>
>> On 18/03/2025 18:47, Rajaganesh Rathinasabapathi wrote:
>>> Add initial device tree and makefile updates for
>>> AMD Onyx platform.
>>>
>>> AMD Onyx platform is an AMD customer reference board with an Aspeed
>>> ast2600 BMC manufactured by AMD.
>>> It describes I2C devices, UARTs, MAC, FMC, etc.
>>> present on AMD Onyx platform.
>>>
>>> Signed-off-by: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
>>> Signed-off-by: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
>>> ---
>>> Changes since v1:
>>> * Incorporate review comments
>>
>> Which ones? I do not see my comments addressed and if you do not list
>> them, I treat it as a clear sign you do not care.
>>
> 
> Understood, will list them in next patch submission.
>>> * Update commit message
>>> * Remove vmalloc and earlyprintk
>>>
>>> Changes since v2:
>>> * Address review comments
>>
>> Which ones? This has to be specific
>>
> Got it, will add details and fix in next patch.
> 
>>> * Fix checkpatch warnings
>>> * Remove bootargs
>>>
>>> Changes since v3:
>>> * Fix stdout-path
>>> * Change commit summary
>>> ---
>>>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>>>  .../boot/dts/aspeed/aspeed-bmc-amd-onyx.dts   | 102 ++++++++++++++++++
>>>  2 files changed, 103 insertions(+)
>>>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
>>>
>>> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
>>> index 2e5f4833a073..1e6a130377b8 100644
>>> --- a/arch/arm/boot/dts/aspeed/Makefile
>>> +++ b/arch/arm/boot/dts/aspeed/Makefile
>>> @@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>>       aspeed-ast2600-evb.dtb \
>>>       aspeed-bmc-amd-daytonax.dtb \
>>>       aspeed-bmc-amd-ethanolx.dtb \
>>> +     aspeed-bmc-amd-onyx.dtb \
>>>       aspeed-bmc-ampere-mtjade.dtb \
>>>       aspeed-bmc-ampere-mtjefferson.dtb \
>>>       aspeed-bmc-ampere-mtmitchell.dtb \
>>> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
>>> new file mode 100644
>>> index 000000000000..32509a651183
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
>>> @@ -0,0 +1,102 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +// Copyright (c) 2021 - 2024 AMD Inc.
>>> +// Author: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include "aspeed-g6.dtsi"
>>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>>> +
>>> +/ {
>>> +     model = "AMD Onyx BMC";
>>> +     compatible = "amd,onyx-bmc", "aspeed,ast2600";
>>> +
>>> +     aliases {
>>> +             serial0 = &uart1;
>>> +             serial4 = &uart5;
>>> +     };
>>> +
>>> +     chosen {
>>> +             stdout-path = "serial4:115200n8";
>>> +     };
>>> +
>>> +     memory@80000000 {
>>> +             device_type = "memory";
>>> +             reg = <0x80000000 0x80000000>;
>>> +     };
>>> +
>>> +};
>> How did you address comment here from v1 which was responded with "ACK"?
>>
>> What else what exactly fixed and what not?
>>
>> Best regards,
>> Krzysztof
> 
> Thanks for the comments.
> I will add 'Acked-by' and in next patch submission. 
> 


What? Where did you get it from? Are you sure you understand submitting
patches document regarding this section?

Read the comment given on v1 instead of some random actions.

Best regards,
Krzysztof
