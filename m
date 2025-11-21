Return-Path: <openbmc+bounces-929-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2149C77AA5
	for <lists+openbmc@lfdr.de>; Fri, 21 Nov 2025 08:19:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCRRK2PY3z2yFq;
	Fri, 21 Nov 2025 18:19:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763709549;
	cv=none; b=UL942wnlsIftsnRNW4AhJ2u/jB3mOPkYRomFSDYS09ZGik6t5fOlaqZSPoz34+yahnfezhYtJ/Dxu9stWuaPNg8qIugxRgfdju9XrEm876OQYJXeM4SiRp4/L8zmU/MN/SLWN/wxUnOnChRqsCNN5oXXWV8I+x2OELFk5guUrT5qAYwZSLjxLIy/NRg740UypabEQyasQD9UZDvIKQ5R53qshLhRxhiyiMv777MRgPcwmkU+3+B/e2dV0CKNDL3jwmiNzOLtAsjqwn3Bp4dEhO6AnqnFwPzM13rWSbDB/ITuw0m1VqKiRXyX+w9R/kVjRsxvO5akt8ZY6ZCN4fTq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763709549; c=relaxed/relaxed;
	bh=m6QG7hfmulkeeV0+FHZzzjlI9CbiaVleYLa2jgnVOXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=laCfnbhm6cSNcGOELGzQk1e93Gks79iXXETd4FfJ61x0Vd2bXAHuL825y6VKR+isJ9OIFhgcV+ApuetDw+zNuQ/tdR2CwQ+5mykFNhJqhNIEJGkTouCwqkjQGTmw+vwt7s8qVaHMbsPfu6Z1CMLJeClCOWNXWkRbOWXR3GibDBW3Ll814kABQsK9LHnXF3G6mYcrQROb5kbymi+CUxWD1lnOWQbAh24Vo82Zk0QIw/HKqNLdR0EpyTdoPCv7roIlrO6XeJOa8WwbyIjQTxxBIujVm0B/LQ/rch4NmstqTp49+0G1urzx4D9ZRn1P5nZkUFTm3uC0w5CNvdhlMnTojw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I0ePuL0/; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I0ePuL0/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCRRJ2MHlz2y5T;
	Fri, 21 Nov 2025 18:19:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E72B26021D;
	Fri, 21 Nov 2025 07:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A728DC4CEF1;
	Fri, 21 Nov 2025 07:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763709540;
	bh=68TiG8pngG5tdRAO1B2gHqjjpClbYtgeNfVCoKK25F0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=I0ePuL0/DxC2p6fV5sC4VWvkJonvYfxIMteRqvLXdrcYijhnef29lw6lJ7nEJlTDP
	 jl53pldujo8nBkEuNR2w0S26fepxmXyt6M7Mo2qb1LkLOFNqDaJv40uc/xwPJ99rRY
	 6uVZ0G3MsplidCRxPwhSXupQKKPBk+vvKG245T8uwq6+zqfRPIs5RzedGdQ6sZKCOS
	 Er3CevJItLA96CBlNPbf9Z83O5pTZWx13iFyDMRMYB0sZyEmEun9RrlRcv3ic9xcV9
	 kS0pszq5LpZ20qh+h/U8ruh6hFmVtS3DdQdONRiFkZ36WjqcE7z64noYLf0PHjrVPR
	 wHn2OHOpwPwWw==
Message-ID: <3f81e6dc-65c9-4c99-ac5a-43bea16d6e55@kernel.org>
Date: Fri, 21 Nov 2025 08:18:54 +0100
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
 <3c3287f6-1c5c-4c4d-9349-32665a5e1585@kernel.org>
 <TY2PPF5CB9A1BE6FE06477B9CC51B8133DAF2CFA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <TY2PPF5CB9A1BE67DBBC08424DD062549BDF2CDA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <28fa635b-f9a6-41c3-8199-9630ed3e7649@kernel.org>
 <TY2PPF5CB9A1BE6C0ACB11FE9BB209B9273F2CAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <TY2PPF5CB9A1BE605A022105E6F1B6AA8F5F2D5A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <TY2PPF5CB9A1BE605A022105E6F1B6AA8F5F2D5A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 21/11/2025 06:23, Ryan Chen wrote:
>> Subject: RE: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a new
>> YAML
>>
>>> Subject: Re: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding
>>> into a new YAML
>>>
>>> On 13/11/2025 10:34, Ryan Chen wrote:
>>>>>>>>> +  reg:
>>>>>>>>> +    minItems: 1
>>>>>>>>
>>>>>>>> Why?
>>>>>>>
>>>>>>> Will update as following.
>>>>>>>
>>>>>>> reg:
>>>>>>>   minItems: 1
>>>>>>>   maxItems: 2
>>>>>>
>>>>>>
>>>>>> No. You changed nothing. Instead explain why this is flexible.
>>>>>>
>>>>>> See writing bindings.
>>>>>
>>>>> Sorry, I still not understand your point. Do you mean need to
>>>>> explain why reg is flexible 1 -> 2?
>>>>> If yes, I will update to following.
>>>>>
>>>>> reg:
>>>>>   minItems: 1
>>>>>   maxItems: 2
>>>>>   description:
>>>>>     The first region covers the controller registers.
>>>>>     The optional second region covers the controller's buffer space.
>>>>
>>>> After check the
>>>> https://docs.kernel.org/devicetree/bindings/writing-schema.html#anno
>>>> ta ted-example-schema I think I should update with following, am I
>>>> correct ?
>>>>
>>>>  reg:
>>>>    items:
>>>>      - description: The first region covers the controller registers.
>>>> 	 - description: The optional second region covers the controller's
>>>> buffer
>>> space.
>>>
>>> Please drop "The first region covers" and same for the second. Just
>>> say what is this - controller register and controllers buffer space -
>>> and second one is not optional now.
>>
>> Thanks, will update
>>
>> items:
>>   - description: Controller registers
>>   - description: Controller buffer space
>>>
>>>>
>>>> What you question about
>>>> " Please explain me how one, same SoC has optional IO address space?
>>>> I
>>> asked to explain WHY this is flexible"
>>>> The AST2600 i2c controller have three io,buffer,dma mode.
>>>> The AST2600 have buffer register for buffer transfer. That is 2nd reg offset.
>>>
>>> So the SoC *HAS* it. It is always there. It cannot be missing in the hardware.
>>>
>>>> If dtsi not descript it, the driver will go back to io mode
>>>> transfer. Flexible
>>> implement is in driver.
>>>
>>> Describe the hardware.
>>
>> Understood, thanks your guidance.
> 
> Hello Krzysztof.
> 	Appreciate your review.
> 	I’ve updated the reg and clock section according to your comments.
> 	Do you have any further suggestions on those updates?	https://lore.kernel.org/all/20251118014034.820988-2-ryan_chen@aspeedtech.com/

You sent it on Nov 18. Then you pinged on Nov 19, now you ping on Nov 21.

What's sort of rush is this? I don't respond well to such pressure so I
will move your patch to the bottom of review queue.

Best regards,
Krzysztof

