Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 771DCA45ADF
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2025 10:56:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2qcb05ngz3cYY
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2025 20:56:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04::f03c:95ff:fe5e:7468"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740563787;
	cv=none; b=aiY+1SwWxk3Uxc3FUOS86WQu5UekK2FVF7jCaQS2FMtoaVNZtDAjDdPqelpw6+4Uq8A0nXDZfsww38TmdBaDA5t6H3mF9aRzjzGBbu40Z/211D4DWhydyQMjYdPYkbR8NHCV1oUCUIFyfE5sBGfbaiPq2G6RVv/MXpc6J75MZLBBP9qGkPmI/B2vtdFFs/1uWPNyasLx1iCQFjcsjkMJjly0koHh9UXheynqd2bycQvFVsiJcuLtaAdYf8YhkvKeefQRal3eXuSLOpfUsrO7I9NZKiKwzyiKQSEptWDRR9RKsXTCca2f2TCCFe0mFGi2pj/bp8ZnybmpfG2DMezzHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740563787; c=relaxed/relaxed;
	bh=Y+pxVerkfoS1avWErqPTUCwq3rjsaYZehyf3vYLR4ZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hhBmCf2VMRJDyhnm8KKSOTrBu1kneFETJvDiIuRU7GWA//c9J7GfOFLgaWG5iaGxAAsPP1LZY0Gc3y/EzaZhvAlhDZH7JVzT9Hf0T9SM4VXy9KqTMxec6B/lNsvQ3pZywMSx0P3pUjDuB9oFoTmYA6vmTXuO2zHJU51weVFExzGgPZkbUvf0vVAuY1C222aAuh6I9DIdTE6jwaUmPEpHUtv4a42LsFsf8kWp+ZA/j8ap+K3B7vd/H7cKl0PX4KlRwR0HFMhaLCdmAdoFDTBpS7Ur2sgkpdTeY6gJ0XeAmppJFilWyUJUReiELVKRgrMU3oQhNDCKZBkAF6GoPMxfAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nDIsy8iO; dkim-atps=neutral; spf=pass (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nDIsy8iO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04::f03c:95ff:fe5e:7468])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2qcV2GNSz2yvl;
	Wed, 26 Feb 2025 20:56:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3141061137;
	Wed, 26 Feb 2025 09:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B313C4CED6;
	Wed, 26 Feb 2025 09:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740563783;
	bh=1Quf7/c1ehY7FhlfL5b4CSIvNDLhWomMOOrwdf5C1bc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nDIsy8iONaUkV3zCR4j24aHleHJTprg4Ra22sC6KXhc8VhmIPceVBmDcFBURrhIje
	 cu7kCS/JqDVLynQAq47qWpSXY+sx1LXQCf5NthVCR4cz70GDprSdoMxNf44f1F0s7f
	 lkEttvPtA4icjYlN+6PjUfTSuiI9sIE6I9xCe9ofUGVGLmM7CL4DSqrjZD3A4feDS7
	 AslZqbM90UNfJmjSBXyskmUlDyJs3dBrwl+snCUs4gQK8ctVFdz/qce6nP2MR416XY
	 BGHC2WMTKEKN3BV+K4HMnG4jWxihC9Yt8F6DDtUxVnTebz0sPKInn95MHwTb0TxxJI
	 5vrkFmbgouSTw==
Message-ID: <50327725-f3b8-4a8b-94a2-85afccd2868a@kernel.org>
Date: Wed, 26 Feb 2025 10:56:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
To: Ryan Chen <ryan_chen@aspeedtech.com>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
 <20250224055936.1804279-2-ryan_chen@aspeedtech.com>
 <20250224-arrogant-adventurous-mackerel-0dc18a@krzk-bin>
 <OS8PR06MB75415E95342F26F576B5CF8AF2C22@OS8PR06MB7541.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <OS8PR06MB75415E95342F26F576B5CF8AF2C22@OS8PR06MB7541.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 26/02/2025 10:28, Ryan Chen wrote:
>> Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
>> AST2600-i2cv2
>>
>> On Mon, Feb 24, 2025 at 01:59:34PM +0800, Ryan Chen wrote:
>>> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
>>> and description for ast2600-i2cv2.
>>>
>>> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
>>> ---
>>>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 58 +++++++++++++++++++
>>>  1 file changed, 58 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>> b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>> index 5b9bd2feda3b..356033d18f90 100644
>>> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>> @@ -44,12 +44,60 @@ properties:
>>>      description: frequency of the bus clock in Hz defaults to 100 kHz when
>> not
>>>        specified
>>>
>>> +  multi-master:
>>> +    type: boolean
>>> +    description:
>>> +      states that there is another master active on this bus
>>
>> Except that this wasn't ever tested...
>>
>> Don't duplicate properties. i2c-controller schema has it already.
> 
> I will remove it to avoid duplication.
>>
>>> +
>>> +  aspeed,enable-dma:
>>> +    type: boolean
>>> +    description: |
>>> +      I2C bus enable dma mode transfer.
>>> +
>>> +      ASPEED ast2600 platform equipped with 16 I2C controllers that
>> share a
>>> +      single DMA engine. DTS files can specify the data transfer mode
>> to/from
>>> +      the device, either DMA or programmed I/O. However, hardware
>>> + limitations
>>
>> so what is byte mode?
> I explain in cover, I will add here also. 

Cover letters do not get merged and we do not read them, except when
looking for dependencies and explanations of process (like RFC). Your
hardware description must be fully contained in commits, not cover letter.


> aspeed,enable-byte:
> Force i2c controller use byte mode transfer. the byte mode transfer
> will send i2c data each byte by byte, inlcude address read/write.

Isn't this standard FIFO mode?

Why anyone would need to enable byte mode for given board?

> 
>>
>>> +      may require a DTS to manually allocate which controller can use
>> DMA mode.
>>> +      The "aspeed,enable-dma" property allows control of this.
>>> +
>>> +      In cases where one the hardware design results in a specific
>>> +      controller handling a larger amount of data, a DTS would likely
>>> +      enable DMA mode for that one controller.
>>> +
>>> +  aspeed,enable-byte:
>>> +    type: boolean
>>> +    description: |
>>> +      I2C bus enable byte mode transfer.
>>
>> No, either this is expressed as lack of dma mode property or if you have three
>> modes, then rather some enum (aspeed,transfer-mode ?)
> 
> Thanks suggestion, I will using an enum property like aspeed,transfer-mode instead.
>>
>>
>>
>>> +
>>> +  aspeed,global-regs:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: The phandle of i2c global register node.
>>
>> For what? Same question as usual: do not repeat property name, but say what
>> is this used for and what exactly it points to.
>>
>> s/i2c/I2C/ but then what is "I2C global register node"? This is how you call your
>> device in datasheet?
>>
> I do descript in cover, should add into the yaml file ?


Again, cover letter does not matter. Your hardware must be explained here.

> 
> aspeed,global-regs: 
> This global register is needed, global register is setting for
> new clock divide control, and new register set control.

So this means you implement clock controller via syscon?

> 
>>
>>> +
>>>  required:
>>>    - reg
>>>    - compatible
>>>    - clocks
>>>    - resets
>>>
>>> +allOf:
>>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: aspeed,ast2600-i2cv2
>>
>> NAK, undocumented compatible.
> 
> Sorry, I should add what kind of document about this compatible?

You cannot add new compatibles without documenting them. Documentation
is in the form of DT schema and each compatible must be listed (in some
way) in compatible property description.


Best regards,
Krzysztof
