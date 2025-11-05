Return-Path: <openbmc+bounces-841-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E2BC34214
	for <lists+openbmc@lfdr.de>; Wed, 05 Nov 2025 08:05:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1btN00gVz2yjp;
	Wed,  5 Nov 2025 18:05:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762326299;
	cv=none; b=ZZ1Qr3LV9gEmPqA1+ZwXQIzTbnYRTodUZfRb49DO37zoWbccJmF0ozrCe6OLlGevUiFXV4pw32fZCUXziFYZf5272L8MIAyHXhrcFWWgEa+kY2LST7MyJuvSrTwzJv5tgHEgfdMws8I3l6AVuVfD3Mp8SNKPYjuhj/yG2jR0+Zuv4381vEZpkpfVa+sAiJBo3ZsgoRQbH78W1dnCMcsMFIO5w6MUW2dCe5Iywym6Cx5GefrLXdEnWYIfMeWHU+uVX7lJ4iu57pDuuGDRkLkh2ePEeL4xXIEluWl3BTlbGQek460DaZPUnKDpJ7SHMxsGL4i/U3tpOWkc8AyhW53xvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762326299; c=relaxed/relaxed;
	bh=l9XmaKEb9RYL3cXf18FlRBFz4L274PJ5Nmz/QiKbpA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IbHubHeUbdi9RwMNZbb3bFzfZGLTbZXRyWDanqzPcwtqjOgBMEpdsfAJASbC1kRqKT749JP539uzhtO6mNkrZXFaDOqfbQ3BfXwQxGzyo27iYcguuR+l4wFkY0xpYY6QEJah/2MFyuoPDJ4Mrdq2ilwkLkej22dLuN5EnXEp3l7obGvmccG22MNeGhxxY9+3jx0ciUvkq9LvABDj2vIXJ0sL0AD1uyAmMlfSB09pxDAzL+wNJzig6BR7Whgo3CnvOw1D/uLsZRVJUqSiqQdSst7YvesmlLQ1nc8CZkOjLLOUXd00+ca5q6NX45b2INzlTRfa6pWhsZPgSVXLkuEMiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=skFxXnyu; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=skFxXnyu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1btL68mjz2xQD;
	Wed,  5 Nov 2025 18:04:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD4D2434DD;
	Wed,  5 Nov 2025 07:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BE4C4CEF8;
	Wed,  5 Nov 2025 07:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762326295;
	bh=fECj6oacpKXc6X6f2zYwH9Ibg6UtdahRrZWnqz/qj68=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=skFxXnyuvYeO9Z1N85neSH/uQ6UDgiCWVv53PRfQvNM8Ncmh1lE8/WusgFdrOCPph
	 YBQL1w5lvDN2OrFRbX+bt1PJBmot2Fqhw4PepfH6KzWfZ0m3qwXBl1EcSnTyCBF5oC
	 N7sJ0/KOhelMOtouPqbOUMe/2nE7wsz7mWr+gF89voniT4QliOcoemDCRin2OPjyI+
	 BCZMgbigPpbZB4gnYzJAMnSGu/9ZNdnjEa3p74wibJwuZM9+4YmB5pJRDU7u38gBuH
	 2HSyLtykkxr4kAnhxiOxZ6ywPY/f1q36VaddSRTd8SybAiI8Z32u5TPKypF8ZXg1AJ
	 9LY9ciRLlmgdg==
Message-ID: <afa2c9aa-e84c-4a42-a735-73c01b197018@kernel.org>
Date: Wed, 5 Nov 2025 08:04:49 +0100
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
Subject: Re: [PATCH v21 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
To: Jeremy Kerr <jk@codeconstruct.com.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>, bmc-sw@aspeedtech.com,
 benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew@codeconstruct.com.au, p.zabel@pengutronix.de,
 andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
 <20251027061240.3427875-2-ryan_chen@aspeedtech.com>
 <59d4d107-4f35-4906-8524-f45b9b85f0ff@kernel.org>
 <0b9abd87b877595c13011a3d8b4e80e05488effc.camel@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <0b9abd87b877595c13011a3d8b4e80e05488effc.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 30/10/2025 07:04, Jeremy Kerr wrote:
> Hi Kyzysztof,
> 
>>> +++ b/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
>>> @@ -0,0 +1,66 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/i2c/ast2600-i2c.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: ASPEED I2C on the AST26XX SoCs
>>> +
>>> +maintainers:
>>> +  - Ryan Chen <ryan_chen@aspeedtech.com>
>>> +
>>> +allOf:
>>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - aspeed,ast2600-i2c-bus
>>> +
>>> +  reg:
>>> +    minItems: 1
>>
>> <form letter>
>> This is a friendly reminder during the review process.
>>
>> It seems my or other reviewer's previous comments were not fully
>> addressed. Maybe the feedback got lost between the quotes, maybe you
>> just forgot to apply it. Please go back to the previous discussion
>> and
>> either implement all requested changes or keep discussing them.
>>
>> Thank you.
>> </form letter>
>>
>>> +    items:
>>> +      - description: address offset and range of bus
>>> +      - description: address offset and range of bus buffer
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>
>> Nothing improved
> 
> That was mostly the point - this first patch just splits out the 2600
> definitions to the new file, with zero change.
> 
> That means the *actual* changes to the binding are visible via the diff
> in 2/4, and not hidden by the copy.
> 
> This was mentioned on v20, and you replied saying it was irrelevant to
> the separate discussion around the rationale for the change, but didn't
> object to the split-patches approach.
> 
> If your preference is to *not* do this via a verbatim copy as an initial
> step (and essentially squash with 2/4), that's also fine, but I'm sure
> that knowing your preference would help Ryan out here.


The next patch did not correct issues copied from old binding, so above
arguments are not applicable.

I did not ask to merge the patches. I asked not to create WRONG schema
when copying to the new file. This split should not be a verbatim copy,
because we do not create intentionally buggy code which we are going to
fix immediately. Also it does not make sense to make verbatim copy of
ast2500 stuff, since new file is ONLY ast2600.

That copy should include all necessary changes needed to make new
binding correct. I already pointed out this and this was not fixed -
neither here nor in a following commit (which I would still ask to squash).

Best regards,
Krzysztof

