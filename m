Return-Path: <openbmc+bounces-1377-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ee2Dj8uk2ke2QEAu9opvQ
	(envelope-from <openbmc+bounces-1377-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 16 Feb 2026 15:48:31 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAE5144CDB
	for <lists+openbmc@lfdr.de>; Mon, 16 Feb 2026 15:48:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fF5HV1fPLz2xlq;
	Tue, 17 Feb 2026 01:48:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771253302;
	cv=none; b=fktdIy/d+Zg8qmo1hiRJJTd9jfF1zVn8+rFwWc6GsYgvMkEwM3cUyBtj40+nvDCW04Qks54k/va9Flud7WdAMyqiPO7//fuPHy8b9zv/zA5hcNjh634s098p6pIG0wuL4z6NHYXcWUkoJTQc8OmFSncMFd7N4FrINkAhF2d1KVdYuUdY2XsCuK0AQnOrG0CUaNKQcYHR4SIJ5iPEyanr7KRXbDk9frFzD3khfET8yMBmfoJ1NekcTPnjnuJ35f6vU+qSVSyu+9ksS6fdKG9xxQFnMmFTk1JqAMdbvGVd4tdeFz4AD4xSifLEopVG0o/7k/kb+Uc82pAo8nLki2SJYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771253302; c=relaxed/relaxed;
	bh=IHokAdJ2DEbhpu4ppGyvrDmgI/3+UjdINgV9qFX0OQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+AbHUjAA6Dc2MdHCZxdVslAGgkuH5/Pud2+eRpeaepV1llM0MXj8Hc56Q7rGsILD6GLcFtweHdAucpSMc7BrzZ9u29SHZn00wMxZzUowGTzzqsEc0+y74RcYyGLoc95LrdJJZ52+deqCjKZsOMegi5dk4zdIrAGBVWxy7zsVEp4mO4g1kUlo18WlpDbS3EuApkc/BqhK3Mdhia4LwgYtL1JWNmY5Cz8dOdPUDU19Jw+kkNnrDbH8L+wPiwSYHMSC3C6kR1seckz68xX3WvBoR4f8Hv/5rc4s/0bDXs0nXO3JrDRr+ie7WGYeL6ZiuXJrqtf/LrI1xQRazJVd3jWbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XzRyjnI6; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XzRyjnI6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fF5HT06FMz2xVT
	for <openbmc@lists.ozlabs.org>; Tue, 17 Feb 2026 01:48:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D875D40A8F;
	Mon, 16 Feb 2026 14:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31007C116C6;
	Mon, 16 Feb 2026 14:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771253297;
	bh=L/dpP0UnrPD8okQGuiig4zPdY6ZsuqaFhbpDUBwz0xU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XzRyjnI6TCSAL5tfCk3P3bC0kboynMAO8qdqSwwKQYUKUIZ9zsSnF0aTLn4yARvdf
	 hF60Y4Cmol5oeHGCmtyVvnvWP+APmiemicPgLG34O9+pzJoP57aSVkgg2VOffQUMs8
	 Exo1iCuZAqSCTqvu2Qow27zx4HvQeiXs4cO6AnqXqiVDgpx7Y83ZS4XFjy7xIcnv4z
	 I69vtRk9yYJwapMSfWuwfyI90YnTQYxmpvNFsgva6Zp52yeFo92pmi8fiiPMxvRYR1
	 u1QYelE225o9utYvt9bJiVvFAwK2e9XQf0wAaR1qUrHFHD/U3UrvmanGWE1c+E5reI
	 RDX2LbwYakj8w==
Message-ID: <1522cec8-8259-4404-86fa-18bd91473087@kernel.org>
Date: Mon, 16 Feb 2026 15:48:12 +0100
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: watchdog: Add NPCM reset status
 support
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com,
 tali.perry1@gmail.com, wim@linux-watchdog.org, linux@roeck-us.net,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 joel@jms.id.au, openbmc@lists.ozlabs.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260210133843.1078463-1-tmaimon77@gmail.com>
 <20260210133843.1078463-2-tmaimon77@gmail.com>
 <b746dd7d-550c-4877-9210-754ae278e1a2@kernel.org>
 <CAP6Zq1jZorLxXQYqm5KzcYdoRzcFtD1KQqzmgaa6KKy-+Tpv+Q@mail.gmail.com>
 <92197c45-2921-47ad-9680-7339d6308b8f@kernel.org>
 <CAP6Zq1hLkT-xMwV99yVE-hLsf_nT+V_3v7sEshfqEkkRCkEevA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAP6Zq1hLkT-xMwV99yVE-hLsf_nT+V_3v7sEshfqEkkRCkEevA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.70 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tmaimon77@gmail.com,m:andrew@codeconstruct.com.au,m:avifishman70@gmail.com,m:tali.perry1@gmail.com,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:joel@jms.id.au,m:openbmc@lists.ozlabs.org,m:linux-watchdog@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:taliperry1@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[krzk@kernel.org,openbmc@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-1377-lists,openbmc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,openbmc@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[codeconstruct.com.au,gmail.com,linux-watchdog.org,roeck-us.net,kernel.org,google.com,jms.id.au,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[openbmc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: BCAE5144CDB
X-Rspamd-Action: no action

On 16/02/2026 15:37, Tomer Maimon wrote:
> Hi Krzysztof,
> 
> Thanks for your comments.
> 
> On Mon, 16 Feb 2026 at 13:16, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>> On 16/02/2026 12:10, Tomer Maimon wrote:
>>> Hi Krzysztof,
>>>
>>> Thanks for your review.
>>>
>>> On Tue, 10 Feb 2026 at 18:11, Krzysztof Kozlowski <krzk@kernel.org>
>> wrote:
>>>
>>>> On 10/02/2026 14:38, Tomer Maimon wrote:
>>>>> Add reset status detection for NPCM7XX and NPCM8XX platforms via syscon
>>>>> integration. Document syscon property and three configurable reset type
>>>>> properties (nuvoton,card-reset-type, nuvoton,ext1-reset-type,
>>>>> nuvoton,ext2-reset-type)that map reset signal detection to specific
>>>>> reset bit positions.
>>>>>
>>>>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>>>>> ---
>>>>>  .../watchdog/nuvoton,npcm750-wdt.yaml         | 51 ++++++++++++++++++-
>>>>>  1 file changed, 49 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git
>>>> a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
>>>> b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
>>>>> index 7aa30f5b5c49..054cc0115af2 100644
>>>>> ---
>> a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
>>>>> +++
>> b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
>>>>> @@ -12,7 +12,7 @@ maintainers:
>>>>>  description:
>>>>>    Nuvoton NPCM timer module provides five 24-bit timer counters, and a
>>>> watchdog.
>>>>>    The watchdog supports a pre-timeout interrupt that fires 10ms before
>>>> the
>>>>> -  expiry.
>>>>> +  expiry and reset status detection via syscon integration.
>>>>>
>>>>>  allOf:
>>>>>    - $ref: watchdog.yaml#
>>>>> @@ -40,12 +40,55 @@ properties:
>>>>>    clock-frequency:
>>>>>      description: Frequency in Hz of the clock that drives the NPCM
>>>> timer.
>>>>>
>>>>> +  syscon:
>>>>
>>>> First iteration. See "How to Get Your DT Schema Bindings Accepted in
>>>> Less Than 10 Iterations"
>>>>
>>> Thanks, it was very helpful.
>>> the syscon property is already found in the WD node
>>> in nuvoton-common-npcm8xx.dtsi file, what should I do:
>>
>> How is that file related to this binding?
>>
>> Either you document existing ABI or you add new (for new device). Commit
>> msg MUST be explicit about it and provide the reasons. If wrong (e.g.
>> discouraged) ABI was already used then it depends how and when it got
>> into the kernel, e.g. if someone bypassed DT completely just to get it
>> inside.
>>
> The syscon property is already used in the upstream NPCM8xx DTSI watchdog
> node, so I will document it as existing ABI and mark it deprecated. I will

And how it is used? I cannot find its usage, so I do not agree on
documenting it. Property should be removed or at least provide the
justification/impact of removal, if you need it to stay.

> add a new vendor‑specific property (nuvoton,sysgcr) as the preferred one,
> and explain this clearly in the commit message.
> 
>>
>>> 1. Modify the syson to nuvoton,sys-gcr like in the dtsi?
>>> 2. Still use the syscon property in the dtsi file, therefore stick with
>> the
>>> syscon add.


Best regards,
Krzysztof

