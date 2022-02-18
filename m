Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5C94BAE41
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 01:17:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0C253whgz3cV4
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 11:17:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=C4y25U5k;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=C4y25U5k; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0C1k18S0z3bbW
 for <openbmc@lists.ozlabs.org>; Fri, 18 Feb 2022 11:17:13 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 983A832C;
 Thu, 17 Feb 2022 16:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1645143431;
 bh=Z7wZg8Re/Dy73Zm8lE3R37EB8e+695AOYuDc/5NXQ5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C4y25U5k2fYvV8ABQkDiU+HBD3JQkGXZOv6A7+8tkzevNYob5hUZOCW9fIUZcYe3I
 O0A9JqTqKyTbdAgyQ4JJGojEUMeeIRoqvdOtyQ10/yf/3tPSyMMRBmEmElNp1FIzay
 He+e71Js0bs95/9/VLUgn6N8A+EqaY0E+JYdWczk=
Date: Thu, 17 Feb 2022 16:17:08 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: Add power-efuse binding
Message-ID: <Yg7lhD7ILOoiSndp@hatter.bewilderbeest.net>
References: <20220217104444.7695-1-zev@bewilderbeest.net>
 <20220217104444.7695-4-zev@bewilderbeest.net>
 <Yg7NoLzC7zt2oihV@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Yg7NoLzC7zt2oihV@robh.at.kernel.org>
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
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 17, 2022 at 02:35:12PM PST, Rob Herring wrote:
>On Thu, Feb 17, 2022 at 02:44:43AM -0800, Zev Weiss wrote:
>> This can be used to describe a power output supplied by a regulator
>> device that the system controls.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> ---
>>  .../devicetree/bindings/misc/power-efuse.yaml | 37 +++++++++++++++++++
>>  1 file changed, 37 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/misc/power-efuse.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/misc/power-efuse.yaml b/Documentation/devicetree/bindings/misc/power-efuse.yaml
>> new file mode 100644
>> index 000000000000..cadce15d2ce7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/power-efuse.yaml
>> @@ -0,0 +1,37 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/misc/power-efuse.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Generic power efuse device
>
>No idea what this is, but I doubt any such generic device exists. This
>needs sufficient description to be convincing that it is indeed generic.
>

I was struggling a bit to come up with a reasonably concise title; this 
admittedly isn't great.

Would a description like the following clarify it adequately?

   description: |
     This binding describes a physical power output supplied by a 
     regulator providing efuse functionality (manual on/off control, and 
     auto-shutoff if current, voltage, or thermal limits are exceeded).
     
     These may be found on systems such as "smart" network PDUs, and 
     typically supply power to devices entirely separate from the system 
     described by the device-tree by way of an external connector such as 
     an Open19 power cable:

     https://www.open19.org/marketplace/coolpower-cable-assembly-8ru/


>> +
>> +maintainers:
>> + - Zev Weiss <zev@bewilderbeest.net>
>> +
>> +properties:
>> +  compatible:
>> +    const: power-efuse
>> +
>> +  vout-supply:
>> +    description:
>> +      phandle to the regulator providing power for the efuse
>> +
>> +  error-flags-cache-ttl-ms:
>> +    description:
>> +      The number of milliseconds the vout-supply regulator's error
>> +      flags should be cached before re-fetching them.
>
>What are 'error flags'? Not something I've heard with respect to
>regulators.
>

That refers to the REGULATOR_ERROR_* flags in 
include/linux/regulator/consumer.h, in whatever "physical" form those 
ultimately take -- for example, in the PMBus-based case I'm currently 
aiming to support, they'd map to the flags returned by PMBus STATUS_* 
commands.  


Thanks for the review,
Zev

