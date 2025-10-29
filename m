Return-Path: <openbmc+bounces-833-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B44C19DE4
	for <lists+openbmc@lfdr.de>; Wed, 29 Oct 2025 11:52:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxPGM6TFwz3bfV;
	Wed, 29 Oct 2025 21:52:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761735163;
	cv=none; b=S4+1ZCtvEDrwl8ByJ2Up8oDChyKiB3XjbIDBtHzqEsQ1TMbI64LCo4Z9rGNnNH1TCSEZFb/jePBX1e6wADFBgeC13+UkDa4otSrZFZyU+bIXjykzetWga2lnPmB9CLafQfcIZtV/wNdOb3bz8MVbPLxqXI54KrbxnQKrk4ckfloLYkk8WyooQvN/DipvLPgD7nIEK7gYag1FUsX7eiDiXFOX4G4Y9XU+ZwKDtSfvfk/yki8/MAAVBJUP4fetg5jVB7SkaBDpehQqML08wj4cJMIk9mobUX3nURnLOOgoeHJbTk13r/INw49pjbPFug2NZw2nMOkor38XlCwXlv6hhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761735163; c=relaxed/relaxed;
	bh=HnTgtvKdtHrhMOVirx9l8voTajx/RI49/oZD27VCamo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Wv7ACgyXdoDyjWF5GAaVxAcL9/58gNMtEHCpC3AAtKWACCchZkvvcNjBYgzFhkGYY935tJbzo8KeefdNxDr7aEZulAJGhsImed3QINAtYmrW73ZuN3PJrpessNL6wbLt5y6cv3CVWamrlzl1/my6J7rkjXV97h81XtXeTssvas0XMoLfYzCmHQpnULAdjMscdZpwFmZ4dPqNCg1IZR49r1RHrLRDQEWrRxOO9PNt9QmmmgdgWrAhaSVkiFvcCvj9+2O3ycbUfaVVYICybz2muRjvzupzcP/OamvDXHBjbciqI6k49Uj2BO2CVFrFkKTvQSdR7uNW8Ij1CimblhFhVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U5aAB87N; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U5aAB87N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxPGL2mZTz3bfF;
	Wed, 29 Oct 2025 21:52:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1543A601CF;
	Wed, 29 Oct 2025 10:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C67C4CEF7;
	Wed, 29 Oct 2025 10:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761735158;
	bh=WJY9uVEvm/AtqJJTYDny4vNI0huLEu00IUv36RYkrzI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=U5aAB87NxdYRSvJ4zuumX21WQyFgrvfPbSMf6qeueMNII2yP+89+Jp6NGNmurIoae
	 HsjjnzobGOs4V9FdjnsA9yQLyS12UbTCJF/jKXNhBcheBgSuIfJfPxOV/eFlzieS7p
	 CIjwqnRG+NzY1IQCbn136Q8qrRjCcbtJeO4f+K8zZSBVR46xAKSrEds04SPZZq4jBJ
	 QLOTF/dcDRTx9qrlP1gKwnOXpkqUm6fEkdYq6TkcEx6lJyEKYPEerEvA10XjrWOoHZ
	 DKzHE7q0EsGAyI/igrqBRCMpV1sLCay+tCm+OXU4f0lpy6/ieVRZm047xrQin9bwly
	 5pl4UleGJaH8w==
Message-ID: <3c3287f6-1c5c-4c4d-9349-32665a5e1585@kernel.org>
Date: Wed, 29 Oct 2025 11:52:32 +0100
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
Subject: Re: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
To: Ryan Chen <ryan_chen@aspeedtech.com>,
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
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
 <0b76f196-f642-4991-ad5c-717c23938421@kernel.org>
 <TY2PPF5CB9A1BE6597ECD46BD4CB7C5F09FF2FAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <TY2PPF5CB9A1BE6597ECD46BD4CB7C5F09FF2FAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 29/10/2025 09:29, Ryan Chen wrote:
>> Subject: Re: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a new
>> YAML
>>
>> On 21/10/2025 03:35, Ryan Chen wrote:
>>> The AST2600 I2C controller is a new hardware design compared to the
>>> I2C controllers in previous ASPEED SoCs (e.g., AST2400, AST2500).
>>>
>>> It introduces new features such as:
>>>  - A redesigned register layout
>>>  - Separation between controller and target mode registers
>>>  - Transfer mode selection (byte, buffer, DMA)
>>>  - Support for a shared global register block for configuration
>>>
>>> Due to these fundamental differences, maintaining a separate
>>> devicetree binding file for AST2600 helps to clearly distinguish the
>>> hardware capabilities and configuration options from the older
>>> controllers.
>>>
>>> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
>>> ---
>>>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   |  3 +-
>>>  .../devicetree/bindings/i2c/ast2600-i2c.yaml  | 66
>>> +++++++++++++++++++
>>>  2 files changed, 67 insertions(+), 2 deletions(-)  create mode 100644
>>> Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>> b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>> index 5b9bd2feda3b..d4e4f412feba 100644
>>> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>> @@ -4,7 +4,7 @@
>>>  $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
>>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>>
>>> -title: ASPEED I2C on the AST24XX, AST25XX, and AST26XX SoCs
>>> +title: ASPEED I2C on the AST24XX, AST25XX SoCs
>>>
>>>  maintainers:
>>>    - Rayn Chen <rayn_chen@aspeedtech.com> @@ -17,7 +17,6 @@
>>> properties:
>>>      enum:
>>>        - aspeed,ast2400-i2c-bus
>>>        - aspeed,ast2500-i2c-bus
>>> -      - aspeed,ast2600-i2c-bus
>>>
>>>    reg:
>>>      minItems: 1
>>> diff --git a/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
>>> b/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
>>
>> Why completely breaking naming? Please follow writing bindings carefully.
> 
> Will update 
> $id: "http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.yaml#"
>>
>>> new file mode 100644
>>> index 000000000000..6ddcec5decdc
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
>>> @@ -0,0 +1,66 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/i2c/ast2600-i2c.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: ASPEED I2C on the AST26XX SoCs
>>> +
>>> +maintainers:
>>> +  - Ryan Chen <ryan_chen@aspeedtech.com>
>>> +
>>> +allOf:
>>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - aspeed,ast2600-i2c-bus
>>> +
>>> +  reg:
>>> +    minItems: 1
>>
>> Why?
> 
> Will update as following.
> 
> reg:
>   minItems: 1
>   maxItems: 2


No. You changed nothing. Instead explain why this is flexible.

See writing bindings.


...


>>> +  bus-frequency:
>>> +    minimum: 500
>>> +    maximum: 4000000
>>> +    default: 100000
>>> +    description: frequency of the bus clock in Hz defaults to 100 kHz when
>> not
>>> +      specified
>>
>> Don't repeat constraints in free form text.
> 
> Will update
> clock-frequency:
>     description: Desired I2C bus frequency in Hz
>     default: 100000

Heh? You are making random set of changes like did not really read the
feedback. I not to repeat something. What is repeated? Constraints.
Where are the repeated "in free form text". What did you do? Dropped
constraints.

I don't know what to say.

Best regards,
Krzysztof

