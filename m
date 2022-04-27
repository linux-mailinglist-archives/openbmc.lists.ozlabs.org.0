Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1266151238A
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 22:05:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpV9c6zDMz3bgh
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 06:05:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=FY+xcXaW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=FY+xcXaW; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpV9B2wJ2z3bYq
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 06:05:17 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 458971B3;
 Wed, 27 Apr 2022 13:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1651089915;
 bh=AzzWe17kKgZeNsSnsRwYyjYR0RFU8QrYdE2Ktfuuz84=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FY+xcXaWw3zGKKIyu1dm2aux8IMX2r0891MpmNdwga37mMnfzQQPk0IsR03Kf43EZ
 CTPVVjerFH7AhswXy+mw5OZO6+fwQswlO6HEi+To0u4VpTorqVc1WziVWqLH65JOrM
 nkUSd3AqgCkUFqrr5H9+ISEXb0uXmg/n9+DWQ2BA=
Date: Wed, 27 Apr 2022 13:05:11 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: hwmon: Add nuvoton,nct6775
Message-ID: <Ymmh93CW8nIGD0YI@hatter.bewilderbeest.net>
References: <20220427010154.29749-1-zev@bewilderbeest.net>
 <20220427010154.29749-2-zev@bewilderbeest.net>
 <178b9310-a854-dfa6-a4f3-f971b608abe3@linaro.org>
 <YmjmWNUpCAFYesyk@hatter.bewilderbeest.net>
 <5139dc9f-96c3-9f20-4c62-feee902cb5e6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5139dc9f-96c3-9f20-4c62-feee902cb5e6@linaro.org>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Oleksandr Natalenko <oleksandr@natalenko.name>,
 Renze Nicolai <renze@rnplus.nl>, Rob Herring <robh+dt@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Apr 27, 2022 at 09:37:20AM PDT, Krzysztof Kozlowski wrote:
>On 27/04/2022 08:44, Zev Weiss wrote:
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  nuvoton,tsi-channel-mask:
>>>> +    description:
>>>> +      Bitmask indicating which TSI temperature sensor channels are
>>>> +      active.  LSB is TSI0, bit 1 is TSI1, etc.
>>>
>>> Need a type/ref.
>>>
>>
>> Ack, thanks.
>
>Did you test the bindings after the changes? Using reviewers time
>instead of testing by yourself with an automated tool is quite a waste.
>

Yeah, sorry about that -- with uint32 $ref added it passes dt_binding_check;
I'll re-send with that change.


Zev

