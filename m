Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB915EFF42
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 23:27:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mdmfp6cRVz3c6s
	for <lists+openbmc@lfdr.de>; Fri, 30 Sep 2022 07:27:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=W1bS9uCT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=W1bS9uCT;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdmfN6Wlfz2xk6
	for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2022 07:27:24 +1000 (AEST)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 850171AE;
	Thu, 29 Sep 2022 14:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1664486840;
	bh=b7ggKpXybDmgL6F0AfyIfdapD1XXHgq7iG/LCrC6YMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W1bS9uCT4yzKF9g2hLBcpxmkYOCrohSo0u/NEbH7fy2PKJULKmzgIL1DjF52KB2Ni
	 tFSRXFT/8b8yCUIoHbOUZYbVaBOlZAtFISGYDJBC40ntxyJ9sZFny1ibpsWFgFspun
	 tUmLXfEcjiU//IihfLDO2I7geZc+hk+XmfbbJx0Q=
Date: Thu, 29 Sep 2022 14:27:19 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: regulator: Add regulator-output binding
Message-ID: <YzYNt+IQRomycRLs@hatter.bewilderbeest.net>
References: <20220925220319.12572-1-zev@bewilderbeest.net>
 <20220925220319.12572-3-zev@bewilderbeest.net>
 <20220929210714.GA2684335-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220929210714.GA2684335-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Liam Girdwood <lgirdwood@gmail.com>, Naresh Solanki <naresh.solanki@9elements.com>, Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 29, 2022 at 02:07:14PM PDT, Rob Herring wrote:
>On Sun, Sep 25, 2022 at 03:03:18PM -0700, Zev Weiss wrote:
>> This describes a power output supplied by a regulator, such as a
>> power outlet on a power distribution unit (PDU).
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> ---
>>  .../bindings/regulator/regulator-output.yaml  | 47 +++++++++++++++++++
>>  1 file changed, 47 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/regulator/regulator-output.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/regulator-output.yaml b/Documentation/devicetree/bindings/regulator/regulator-output.yaml
>> new file mode 100644
>> index 000000000000..40953ec48e9e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/regulator/regulator-output.yaml
>> @@ -0,0 +1,47 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +
>> +$id: http://devicetree.org/schemas/regulator/regulator-output.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Regulator output connector
>> +
>> +maintainers:
>> +  - Zev Weiss <zev@bewilderbeest.net>
>> +
>> +description: |
>> +  This describes a power output connector supplied by a regulator,
>> +  such as a power outlet on a power distribution unit (PDU).  The
>> +  connector may be standalone or merely one channel or set of pins
>> +  within a ganged physical connector carrying multiple independent
>> +  power outputs.
>> +
>> +properties:
>> +  compatible:
>> +    const: regulator-output
>> +
>> +  vout-supply:
>> +    description:
>> +      Phandle of the regulator supplying the output.
>> +
>> +  regulator-leave-on:
>> +    description: |
>> +      If the regulator is enabled when software relinquishes control
>> +      of it (such as when shutting down) it should be left enabled
>> +      instead of being turned off.
>> +    type: boolean
>
>I'm not too sure about this one as there could be various times when
>control is relinquished. It is userspace closing its access?
>driver unbind? module unload? Does a bootloader pay attention to this?
>
>Rob

Thanks for the feedback, Rob -- I'll admit I was a bit unsure how to 
approach that, and this may well not be the right answer.  What I'm 
really aiming for is an appropriate way to express that regulator on/off 
state should only ever be changed by explicit (external, e.g. userspace) 
request, never as any sort of default/automatic action.  The two obvious 
things to guard against there seem to be automatic enablement during 
initialization and automatic disablement on de-init (shutdown, unbind, 
etc.).  The former I think can be avoided by simply not setting 
regulator-boot-on, so I added this as a corresponding property to avoid 
the latter.

I'm definitely open to suggestions for a better approach though.


Thanks,
Zev

