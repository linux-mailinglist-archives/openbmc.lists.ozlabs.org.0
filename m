Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEE1610938
	for <lists+openbmc@lfdr.de>; Fri, 28 Oct 2022 06:13:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mz8KT58KFz3cDL
	for <lists+openbmc@lfdr.de>; Fri, 28 Oct 2022 15:13:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=VThKMQWh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=VThKMQWh;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mz8Jt2lKgz2xKN
	for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2022 15:12:30 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 400C8FA;
	Thu, 27 Oct 2022 21:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1666930344;
	bh=dKSznSQzRP+QlIAygny9pcwjmOkZrx6+cUvIow2CZxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VThKMQWhZix0AYTvfE5WNjtNwZkVKf3QFlRZnS7xT7UDK9Ly2cjo4kO4UL861zcuZ
	 qZa1i9H6G4/1Kz5wcdRMtt963KHe51Zm8XsUSApjmManA7L/BIfA9evdXGXjxX6nx0
	 rvy/8uYOWO/f3omIOBD+D3Vrob6ofQeU8Ne847SI=
Date: Thu, 27 Oct 2022 21:12:22 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/3] dt-bindings: regulator: Add regulator-output bindingg
Message-ID: <Y1tWpikPogEtV0+x@hatter.bewilderbeest.net>
References: <20220925220319.12572-1-zev@bewilderbeest.net>
 <20220925220319.12572-3-zev@bewilderbeest.net>
 <20220929210714.GA2684335-robh@kernel.org>
 <YzYNt+IQRomycRLs@hatter.bewilderbeest.net>
 <Y1rRCq9Kdd2zPPkw@hatter.bewilderbeest.net>
 <ee37b5a1-5afc-71b3-f777-add295d9ce17@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ee37b5a1-5afc-71b3-f777-add295d9ce17@linaro.org>
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Naresh Solanki <naresh.solanki@9elements.com>, Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 27, 2022 at 06:22:10PM PDT, Krzysztof Kozlowski wrote:
>On 27/10/2022 14:42, Zev Weiss wrote:
>> On Thu, Sep 29, 2022 at 02:27:20PM PDT, Zev Weiss wrote:
>>> On Thu, Sep 29, 2022 at 02:07:14PM PDT, Rob Herring wrote:
>>>> On Sun, Sep 25, 2022 at 03:03:18PM -0700, Zev Weiss wrote:
>>>>> This describes a power output supplied by a regulator, such as a
>>>>> power outlet on a power distribution unit (PDU).
>>>>>
>>>>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>>>>> ---
>>>>> .../bindings/regulator/regulator-output.yaml  | 47 +++++++++++++++++++
>>>>> 1 file changed, 47 insertions(+)
>>>>> create mode 100644 Documentation/devicetree/bindings/regulator/regulator-output.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/regulator/regulator-output.yaml b/Documentation/devicetree/bindings/regulator/regulator-output.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..40953ec48e9e
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/regulator/regulator-output.yaml
>>>>> @@ -0,0 +1,47 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +
>>>>> +$id: http://devicetree.org/schemas/regulator/regulator-output.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Regulator output connector
>>>>> +
>>>>> +maintainers:
>>>>> +  - Zev Weiss <zev@bewilderbeest.net>
>>>>> +
>>>>> +description: |
>>>>> +  This describes a power output connector supplied by a regulator,
>>>>> +  such as a power outlet on a power distribution unit (PDU).  The
>>>>> +  connector may be standalone or merely one channel or set of pins
>>>>> +  within a ganged physical connector carrying multiple independent
>>>>> +  power outputs.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: regulator-output
>>>>> +
>>>>> +  vout-supply:
>>>>> +    description:
>>>>> +      Phandle of the regulator supplying the output.
>>>>> +
>>>>> +  regulator-leave-on:
>>>>> +    description: |
>>>>> +      If the regulator is enabled when software relinquishes control
>>>>> +      of it (such as when shutting down) it should be left enabled
>>>>> +      instead of being turned off.
>>>>> +    type: boolean
>>>>
>>>> I'm not too sure about this one as there could be various times when
>>>> control is relinquished. It is userspace closing its access?
>>>> driver unbind? module unload? Does a bootloader pay attention to this?
>>>>
>>>> Rob
>>>
>>> Thanks for the feedback, Rob -- I'll admit I was a bit unsure how to
>>> approach that, and this may well not be the right answer.  What I'm
>>> really aiming for is an appropriate way to express that regulator
>>> on/off state should only ever be changed by explicit (external, e.g.
>>> userspace) request, never as any sort of default/automatic action.
>>> The two obvious things to guard against there seem to be automatic
>>> enablement during initialization and automatic disablement on de-init
>>> (shutdown, unbind, etc.).  The former I think can be avoided by simply
>>> not setting regulator-boot-on, so I added this as a corresponding
>>> property to avoid the latter.
>>>
>>> I'm definitely open to suggestions for a better approach though.
>>>
>>
>> Ping...
>>
>> Would something like this be preferable as a more direct description of
>> that?
>>
>>    regulator-manually-controlled:
>>      description: |
>>        The regulator should never be enabled or disabled automatically,
>>        only when explicitly requested by an external actor (e.g.
>>        userspace).
>>      type: boolean
>
>This looks like putting policy and OS behavior into DT.

I can see why it might look that way, but I'd argue it's actually not.  
The systems this is intended to support provide power to entirely 
separate external devices -- think of a power distribution unit that 
might have arbitrary things plugged into it.  It seems to me like a 
property of the hardware that those things shouldn't have their power 
supply turned off (or on) just because a controller in the PDU rebooted.

>I guess it easy
>to understand in case of Linux which disables unclaimed regulators
>during. But what if other system/firmware does not behave like that?
>

In this case, then no change would be needed -- a system that (unlike 
Linux) doesn't twiddle regulator state on its own would just continue to 
not do that.

>And what is the "external actor"? OS is not an external actor?

It's admittedly a bit vague, but I couldn't think of a clearer way to 
express what is a sort of nebulous concept -- essentially, some entity 
outside the "driver" (or analogous software component) using the 
information in the device-tree.  In many common cases this would 
essentially mean "a human user", since in the PDU-like systems I'm 
targeting here the only thing that should ever be deciding to turn the 
regulator on or off is an operator logged in to the system to manually 
enable or disable an outlet.  I was aiming to leave the wording a bit 
more general though, since in some other context I could imagine some 
other piece of software toggling things automatedly (e.g. lights getting 
turned on and off on a schedule or something, if that's what happens to 
be plugged in).

>
>I could not get the problem you want to solve with this property - I
>looked at cover letter and at commit msg.
>

The problem is that a driver deciding on its own to enable or disable 
the regulator (e.g. during boot or shutdown) would be a critical failure 
for the kind of systems I'm aiming to support.

>I can only imagine that you want to keep regulator on, after last its
>user disappears... but for what purpose? Do you expect that after system
>shutdown the pin will stay high so regulator will be also on? If so, you
>need hardware design, e.g. with some pull up (if control is over GPIO).
>

As described above, the regulators involved here (in these sorts of 
PDU-like systems) provide power for external systems and devices.  It is 
critical that the controller's boot and shutdown sequences not alter the 
state of the regulator.

If some additional concrete details would help clarify, the particular 
system I'm working on at the moment is the Delta Power AHE-50DC [0].  It 
has two redundant BMCs controlling 50 power outputs, each of which is 
managed by an LM25066 [1] attached to the controllers via I2C.  The 
LM25066s maintain their power state independently of the controllers 
booting or shutting down, and it's very important that if one controller 
reboots (for a firmware update, say) that it not send I2C commands to 
all the LM25066s telling them to turn off their outputs.

[0] https://www.open19.org/marketplace/delta-16kw-power-shelf/
[1] https://www.ti.com/lit/ds/symlink/lm25066.pdf


Thanks,
Zev

