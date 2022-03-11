Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A404D69EA
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 22:48:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFfhP4yrhz30Jm
	for <lists+openbmc@lfdr.de>; Sat, 12 Mar 2022 08:48:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=SeBg6gzw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=SeBg6gzw; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFfgy5MTWz2xsb
 for <openbmc@lists.ozlabs.org>; Sat, 12 Mar 2022 08:48:30 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 075505DB;
 Fri, 11 Mar 2022 13:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1647035306;
 bh=P5ZzCyWn8Nc/M66e9melDdZzKd2Hn269uTStfhzFeC8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SeBg6gzwol1DPY+p8aBXLrgBeFwTV/cLJNNB+CzisLZn5BmXq8SHYUi4BmZTI5U87
 EwF40TMiZh3r0gEjiam4MJxKeWQSKEJyhstMlz6G6s6e5q1orIIbmJ+LmDI+adDj6J
 dD4rHas3tEoq254WVvMBjHQvd6oLPDMmrV61sYro=
Date: Fri, 11 Mar 2022 13:48:22 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add power-efuse binding
Message-ID: <YivDpkajrJk3KfBM@hatter.bewilderbeest.net>
References: <20220308011811.10353-1-zev@bewilderbeest.net>
 <20220308011811.10353-2-zev@bewilderbeest.net>
 <YitpuR+SlDiKh4eq@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YitpuR+SlDiKh4eq@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 11, 2022 at 07:24:41AM PST, Rob Herring wrote:
>On Mon, Mar 07, 2022 at 05:18:09PM -0800, Zev Weiss wrote:
>> This can be used to describe a power output supplied by a regulator
>> device that the system controls.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> ---
>>  .../devicetree/bindings/misc/power-efuse.yaml | 49 +++++++++++++++++++
>>  1 file changed, 49 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/misc/power-efuse.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/misc/power-efuse.yaml b/Documentation/devicetree/bindings/misc/power-efuse.yaml
>> new file mode 100644
>> index 000000000000..5f8f0b21af0e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/power-efuse.yaml
>> @@ -0,0 +1,49 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/misc/power-efuse.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Generic power efuse device
>> +
>> +maintainers:
>> +  - Zev Weiss <zev@bewilderbeest.net>
>> +
>> +description: |
>> +  This binding describes a physical power output supplied by a
>> +  regulator providing efuse functionality (manual on/off control, and
>> +  auto-shutoff if current, voltage, or thermal limits are exceeded).
>> +
>> +  These may be found on systems such as "smart" network PDUs, and
>> +  typically supply power to devices entirely separate from the system
>> +  described by the device-tree by way of an external connector such as
>> +  an Open19 power cable:
>> +
>> +  https://www.open19.org/marketplace/coolpower-cable-assembly-8ru/
>
>Not really a helpful link...
>
>I still don't understand what the h/w looks like here. At least I now
>understand we're talking a fuse on power rail, not efuses in an SoC
>used as OTP bits or feature disables.
>

The systems this would actually be used for would be things like these:
  - https://www.open19.org/marketplace/delta-16kw-power-shelf/
  - https://www.open19.org/marketplace/inspur-open19-power-shelf-ob19200l1/

The rightmost pictures on those pages show the four black connectors 
where the cable assembly linked in the patch plugs in, each of which 
provides the outputs from 12 such efuses, on 12 pairs of ground and 
+12VDC pins.  (There are also two more single outputs off to the side.)

It essentially just amounts to an external power output supplied by a 
regulator, with the regulator providing an on/off switch, overcurrent 
protection, etc.

And yes, the ambiguity of the "efuse" terminology is unfortunate (the 
"power-" prefix was an attempt to clarify it slightly).  That's the term 
used in the documentation for the hardware and hence is what I've called 
it here, but I'd be open to using a different name if that would help.

>> +
>> +properties:
>> +  compatible:
>> +    const: power-efuse
>> +
>> +  vout-supply:
>> +    description:
>> +      phandle to the regulator providing power for the efuse
>
>Vout is a supply to the efuse and not the rail being fused?

Yeah, that was a fairly muddled description -- it's really the latter.  
Perhaps:

   phandle to the regulator providing power for the output rail
   controlled by the efuse

?

>
>Sorry, I know nothing about how an efuse is implemented so you are going
>to have to explain or draw it.
>
>> +
>> +  error-flags-cache-ttl-ms:
>> +    description:
>> +      The number of milliseconds the vout-supply regulator's error
>> +      flags should be cached before re-fetching them.
>
>How does one fetch/read? the error flags?
>

In the specific case I'm dealing with, via PMBus STATUS_* commands, 
though I was aiming to keep this more generic so it could potentially be 
used to describe non-PMBus arrangements (in the Linux case, via whatever 
mechanism the implementation of the regulator's .get_error_flags() 
function uses).

>> +
>> +required:
>> +  - compatible
>> +  - vout-supply
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    efuse {
>> +        compatible = "power-efuse";
>> +        vout-supply = <&efuse_reg>;
>> +        error-flags-cache-ttl-ms = <500>;
>> +    };
>> --
>> 2.35.1
>>
>>
