Return-Path: <openbmc+bounces-1374-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPBGJXn8kmkK0wEAu9opvQ
	(envelope-from <openbmc+bounces-1374-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 16 Feb 2026 12:16:09 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB145142C23
	for <lists+openbmc@lfdr.de>; Mon, 16 Feb 2026 12:16:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fF0ZZ0rt7z2ySS;
	Mon, 16 Feb 2026 22:16:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771240566;
	cv=none; b=oy/Q1zk9oPV3V3BFAr1I6vRtAfX1hpT+TcNaFkcIbBVX/4kt2U03hmqHQxeIBgKXZ7KWlY6mJDX7H0TeW/4EMkC8xW3c1RMCA62nFndqx5qhlDea4riCKZG1jJ5XEaWp7nb/THcN/08PcmOSFDSk8ryB8HrRHooGynv/sEkeqynRuM7nG7469Mtn70rXV+oftUBjWUA0OV9uLtViIVe4S48JSVmeTeUgLbJxzTnBC+En4y4dy2guHguctOuC3hBTC2cYmM7w1AUWWo1BV4R3dhbeH0w5icjiioK0IgydftubowP3JqQNBB0uGk8ON/GG9tdZLr52hj2VsIdfXppRpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771240566; c=relaxed/relaxed;
	bh=DVJay1kt6h5sS3ESSPW52gAbXf5AhRtnO61hu8eaVS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eIryjwwtHu4wUk/L8/6kUtKDNMlRFqId0qpqfGOyi+wmtZXc0JTxSWUfY2fpDAmnywYqM/5tB+qQOk2zSPUwQXnaWXaRTdreHXpJDi0D1UQuHXUiLB1RMAjXWkkYGazCvaG9+of23gmXk4kbzZ6NKHQ98nyVqUTSE+lPpE440AahDhgFHFhFDcc4ek4oQLhKR6f4sczx0x4VmIwuYfBspQjqXGA95l9roV5AeZtCOZpnKBcfw0CwbjQ3fMCDlMkGDMo7zpyiiS8/RUAZ+r44cF3Zs2mrQVddOIpjE8h3P4xIG2CKPYcxsat+SNe2i8SZgOQwLR7GMIgcpDGAr/2vuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hBU2/p3e; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hBU2/p3e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fF0ZY0NnZz2xlq
	for <openbmc@lists.ozlabs.org>; Mon, 16 Feb 2026 22:16:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 99CFF40057;
	Mon, 16 Feb 2026 11:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B827EC116C6;
	Mon, 16 Feb 2026 11:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771240562;
	bh=UwgRGCYqq/EWximQqimdPgRHnhQauuFOIke3F5jcuXA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hBU2/p3e/3TiQnU6B0y5VkhCP+r4/F8n1xEW6+QAEXjV20CN3R6zQh/QiCXlk9bXz
	 O7J2pgeKTI6wubDzS79S33dJX5qdh0mi9I1Llcz0zNs4qbZxpGf32A1iZ4+eXlDAmH
	 bPc8Bl0clvTLwcwtWI+GD1G6a967F8l/d3tBIjDDQraDzAnTnoWyrzBqkS2XVYtNYC
	 Lt0GMOLs+0cHRo1FuWVpt/UBpIk4ZCwayz40JC31qw/Cd15S+mR/+wv0jwC+NkiCVD
	 fYkU2HpgY80LZNXE1my3wJ/gnkFUFc7Kl+DVyBOr8fyl5qalfcJ+G6FMPIFm2w1lBB
	 AEaRS48HXi3Ug==
Message-ID: <92197c45-2921-47ad-9680-7339d6308b8f@kernel.org>
Date: Mon, 16 Feb 2026 12:15:57 +0100
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAP6Zq1jZorLxXQYqm5KzcYdoRzcFtD1KQqzmgaa6KKy-+Tpv+Q@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tmaimon77@gmail.com,m:andrew@codeconstruct.com.au,m:avifishman70@gmail.com,m:tali.perry1@gmail.com,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:joel@jms.id.au,m:openbmc@lists.ozlabs.org,m:linux-watchdog@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:taliperry1@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[krzk@kernel.org,openbmc@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-1374-lists,openbmc=lfdr.de];
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
X-Rspamd-Queue-Id: BB145142C23
X-Rspamd-Action: no action

On 16/02/2026 12:10, Tomer Maimon wrote:
> Hi Krzysztof,
> 
> Thanks for your review.
> 
> On Tue, 10 Feb 2026 at 18:11, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>> On 10/02/2026 14:38, Tomer Maimon wrote:
>>> Add reset status detection for NPCM7XX and NPCM8XX platforms via syscon
>>> integration. Document syscon property and three configurable reset type
>>> properties (nuvoton,card-reset-type, nuvoton,ext1-reset-type,
>>> nuvoton,ext2-reset-type)that map reset signal detection to specific
>>> reset bit positions.
>>>
>>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>>> ---
>>>  .../watchdog/nuvoton,npcm750-wdt.yaml         | 51 ++++++++++++++++++-
>>>  1 file changed, 49 insertions(+), 2 deletions(-)
>>>
>>> diff --git
>> a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
>> b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
>>> index 7aa30f5b5c49..054cc0115af2 100644
>>> --- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
>>> +++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
>>> @@ -12,7 +12,7 @@ maintainers:
>>>  description:
>>>    Nuvoton NPCM timer module provides five 24-bit timer counters, and a
>> watchdog.
>>>    The watchdog supports a pre-timeout interrupt that fires 10ms before
>> the
>>> -  expiry.
>>> +  expiry and reset status detection via syscon integration.
>>>
>>>  allOf:
>>>    - $ref: watchdog.yaml#
>>> @@ -40,12 +40,55 @@ properties:
>>>    clock-frequency:
>>>      description: Frequency in Hz of the clock that drives the NPCM
>> timer.
>>>
>>> +  syscon:
>>
>> First iteration. See "How to Get Your DT Schema Bindings Accepted in
>> Less Than 10 Iterations"
>>
> Thanks, it was very helpful.
> the syscon property is already found in the WD node
> in nuvoton-common-npcm8xx.dtsi file, what should I do:

How is that file related to this binding?

Either you document existing ABI or you add new (for new device). Commit
msg MUST be explicit about it and provide the reasons. If wrong (e.g.
discouraged) ABI was already used then it depends how and when it got
into the kernel, e.g. if someone bypassed DT completely just to get it
inside.

> 1. Modify the syson to nuvoton,sys-gcr like in the dtsi?
> 2. Still use the syscon property in the dtsi file, therefore stick with the
> syscon add.
> 

>>
>> or just read the docs please.
>>
>>> +    description: phandle to the Global Control Register (GCR) syscon
>> node.
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +
>>> +  nuvoton,card-reset-type:
>>> +    description: Reset type for external card reset signal detection.
>>> +    enum:
>>> +      - porst
>>> +      - corst
>>> +      - wd0
>>> +      - wd1
>>> +      - wd2
>>> +      - sw1
>>> +      - sw2
>>> +      - sw3
>>> +      - sw4
>>
>> You want it to be static configuration, so cannot be changed runtime? Why?
>>
> Yes, it is only an indication of the most recent reset in the BMC. In
> addition:
> 1. The driver reads the reset register during the probe. After this read,
> the reset register should be cleared so it’s ready for the next system
> reset.
> 2. I’m not aware of any service function that allows changing the reset
> indication at runtime.

Huh? If the driver reads the reset you do not need this property at all.

Best regards,
Krzysztof

