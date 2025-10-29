Return-Path: <openbmc+bounces-834-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09647C19F6A
	for <lists+openbmc@lfdr.de>; Wed, 29 Oct 2025 12:19:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxPsm08Q4z3bfX;
	Wed, 29 Oct 2025 22:19:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761736795;
	cv=none; b=PBo420LeraE0HMSb9Ry3O3WzFoHE5DN07lVC2A46SlGPzuRp35gG3exLcNUuGMQMme8CXfFPe9XNaPBWQFl+dltRploHppQwy59W6WU85Prsd9Q5OeIgDDH35Mamv5WyoNCrkVAkrqWzq/0SAjoYGx4yFxQoZzoxUDfpD6EFnKjrv/r8Y5OZcM4Uwb5QoO4cQ/8hEkuGPfKogkbZ1/l8TlpHEqyOUIGuJM01lccbZaLGbcfaFlkgCGUyRmW8C4BM2MGxHyOCv985dqu5B7Di6hSpZtACtu+dEH4B1q9loGCxLtrvAZrDA/kxmRj4EKciPcuYreFRFqzYHL++KE7Ggw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761736795; c=relaxed/relaxed;
	bh=KyNXtI6PbEnTz7FPWb3eNnVb1ZmsgCXb6Hy6YuuOSsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LUiCqd1xMvEjv9iIu7w9AFA1BoNGDZE+nMhEO7f7EuEvNrkPspoKizDBgPD8vQJI4sB8bLmFM5gF7vH5ZUlP8ZGex3Fj9fuVILxVmnO1asmhpofhfz0VVvEcTnH4HdwzlodW5rBHEuvO0/QGoRH8GigRutJRYuaL5fKxOdftCAriYw4HOZSZ08K3UtO5/U8bNL79RJ969s7q/GHxWR8qGuTl4JDpi6csfY+g956V/HPsduZHy4OJVHJGQJe7YB/j3Sr0qHKzIqtD+5v7FbaemrhHhbYo8HFkW7jk766mTLRtwdv5TXfwIxMONnKtp4PCs+4F+2ekFXy8EYJnoKPr/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B7EVqC+o; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B7EVqC+o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxPsl0Dvvz3bfN;
	Wed, 29 Oct 2025 22:19:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF23E601CF;
	Wed, 29 Oct 2025 11:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D60C4CEF7;
	Wed, 29 Oct 2025 11:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761736792;
	bh=Dh+ZcU4ASdDvqiZiGQmIVyEEV0pygfzZVWIqYkkSB78=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=B7EVqC+obkpJ9cwtEEcxn+iPMh/RHAaEh8y5xfgsskC3Un69QoGea8ahrJ7JgNUl0
	 vplNQl1bHY195dhxlLgNopw/mw/BVkpMHiUekW5wts4juE7MF4d7SqqhdXm1PgAQWg
	 ik/ewch9b/0OUBhWXqOgEF1RNaWWL6rXqs0nLFn1KpMh39/YiEdzs+1HO22xmeXZOL
	 jIb7HyhQvnE3btnI8oPRNa70rP3vRZXGWcsg9kYCUIvax4tft/71NLPdpDWsb3TkZY
	 hiBn6TFT4IPMILYhl6c1nBp+37V6m+iy08qM7xj6O/PjKTSmlo1oMbpIPDuPfPxx/X
	 lZs6NNNQg3krA==
Message-ID: <36e2b87f-5567-4bd6-bd1b-789623441461@kernel.org>
Date: Wed, 29 Oct 2025 12:19:44 +0100
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
Subject: Re: [PATCH v21 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
To: Ryan Chen <ryan_chen@aspeedtech.com>, BMC-SW <BMC-SW@aspeedtech.com>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "naresh.solanki@9elements.com" <naresh.solanki@9elements.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
 <20251027061240.3427875-3-ryan_chen@aspeedtech.com>
 <93a2ff5f-2f8e-494b-9652-b93bc243c229@kernel.org>
 <TY2PPF5CB9A1BE6DCA78BEDC3178B74FD75F2FAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <TY2PPF5CB9A1BE6DCA78BEDC3178B74FD75F2FAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 29/10/2025 10:25, Ryan Chen wrote:
>> Subject: Re: [PATCH v21 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add global-regs
>> and transfer-mode properties
>>
>> On 27/10/2025 07:12, Ryan Chen wrote:
>>> The AST2600 I2C controller supports three transfer modes: byte,
>>> buffer, and DMA. To allow board designers and firmware to explicitly
>>> select the preferred transfer mode for each controller instance.
>>> "aspeed,transfer-mode" to allow device tree to specify the desired
>>> transfer method used by each I2C controller instance.
>>>
>>> And AST2600 i2c controller have two register mode, one is legacy
>>> register layout which is mix controller/target register control
>>> together, another is new mode which is separate controller/target
>>> register control.
>>>
>>
>> This implies your "reg" properties have now completely different meaning and
>> this would be quite an ABI break. We discussed this probably 15 revisions ago.
>> Where did you document the resolution of that discussion?
> 
> Let me explain more about "reg"
> The 'reg' property continues to describe the same register regions
> (bus and buffer) as in the legacy layout. The selection between the legacy
> and new register layout is controlled by a bit in the SoC-level global
> register block, referenced through the new 'aspeed,global-regs' property.
> Therefore, the meaning of the 'reg' property does not change and no DT ABI
> break occurs.
> 
> Should I add it in commit message about "reg" ?

Then why does the address change from 0x40 to 0x80. If it is the same,
it cannot change.

You are describing the IO address space, total address space, as defined
by datasheet. Not whatever is in the driver.


Best regards,
Krzysztof

